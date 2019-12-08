import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/layout.dart';
import 'package:delivery_app/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Layout.primary(),
        accentColor: Layout.secondary(),
        textTheme: TextTheme(
          headline: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
          title: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Layout.secondary(),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => MyHomePage(title: 'Delivery App'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Widget content = StreamBuilder(
      stream: Firestore.instance.collection('pedido').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return LinearProgressIndicator();
            break;
          default:
            return Center(
              child: ListView(
                children: snapshot.data.documents.map<Widget>((DocumentSnapshot doc) {
                  // Map<String, dynamic>.from(doc.data['sabores']).forEach((key, item) {
                  //   item.get().then((DocumentSnapshot sabor) {
                  //     print(sabor.data);
                  //   });

                  //   print([key]);
                  // });

                  // Produto
                  // (doc.data['sabores']).get().then((DocumentSnapshot produto) {
                  //   print(produto.data);
                  // });

                  return ListTile(
                    leading: Icon(Icons.people, size: 52),
                    // title: Text('Título do registro'),
                    // subtitle: Text('Da pra fazer ficar bem legal'),
                    title: Text("${doc.data['cliente_nome']}"),
                    subtitle: Text("Valor total: ${doc.data['valor_total'].toString()}"),
                  );
                }).toList(),
              ),
            );
        }
      },
    );

    return Layout.render(Column(
      children: <Widget>[
        Container(
          color: Layout.dark(),
          height: 150,
          child: Center(child: Text('IMG')),
        ),
        Container(
            height: 100,
            color: Layout.light(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(width: 5),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: Container(
                    height: 80,
                    width: 90,
                    color: Layout.info(),
                    child: Center(child: Text('IMG')),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: Container(
                    height: 80,
                    width: 90,
                    color: Layout.info(),
                    child: Center(child: Text('IMG')),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: Container(
                    height: 80,
                    width: 90,
                    color: Layout.info(),
                    child: Center(child: Text('IMG')),
                  ),
                ),
                SizedBox(width: 5),
              ],
            )),
        Expanded(child: content),
      ],
    ));
  }
}

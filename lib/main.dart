import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/layout.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

                  print(doc.data);

                  return ListTile(
                    leading: Icon(Icons.people, size: 52),
                    // title: Text('Título do registro'),
                    // subtitle: Text('Da pra fazer ficar bem legal'),
                    title: Text("Pizza ${doc.data['tamanho']}"),
                    subtitle: Text(doc.data['valor'].toString()),
                  );
                }).toList(),
              ),
            );
        }
      },
    );

    return Layout.render(content);
  }
}

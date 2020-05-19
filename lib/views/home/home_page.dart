import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/views/layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String tag = '/home';

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
            return Align(
              alignment: Alignment.topCenter,
              child: LinearProgressIndicator(),
            );
            break;
          default:
            return Center(
              child: ListView(
                children: snapshot.data.documents.map<Widget>((DocumentSnapshot doc) {
                  return ListTile(
                    leading: Icon(Icons.people, size: 52),
                    title: Text("${doc.data['cliente_nome']}"),
                    subtitle: Text("Valor total: ${doc.data['valor_total'].toString()}"),
                  );
                }).toList(),
              ),
            );
        }
      },
    );

    return Layout.render(
      context,
      child: Column(
        children: <Widget>[
          Container(
            color: Layout.dark(),
            height: 150,
            child: Center(child: Text('IMG')),
          ),
          Container(
            height: 100,
            color: Layout.light(),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int i) {
                return Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 80,
                  color: Colors.blueGrey,
                  margin: EdgeInsets.all(10),
                  child: Center(child: Text('IMG')),
                );
              },
            ),
          ),
          Expanded(child: content),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        backgroundColor: Layout.info(),
        child: Icon(
          Icons.add,
          color: Layout.light(),
        ),
      ),
    );
  }
}

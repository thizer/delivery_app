import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Layout {
  static Widget render(Widget content, [String title = 'Delivery App']) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //
          // Aqui um exemplo para excluir registros
          // QuerySnapshot pedidos = await Firestore.instance.collection('pedido').getDocuments();
          // pedidos.documents
          //     .where(
          //   (DocumentSnapshot doc) => doc.data['valor'].toString() == '68.68',
          // )
          //     .forEach(
          //   (DocumentSnapshot found) {
          //     found.reference.delete();
          //   },
          // );
          // return null;

          //
          // Primeiro buscamos o primeiro produto da lista
          QuerySnapshot queryProd = await Firestore.instance.collection('produto').limit(1).getDocuments();
          DocumentReference prod = queryProd.documents.first.reference;

          // Lista de sabores
          QuerySnapshot querySab = await Firestore.instance.collection('sabor_pizza').getDocuments();
          Iterable<DocumentSnapshot> sabores = querySab.documents.where((DocumentSnapshot test) {
            return test.data['desc'].toString().toLowerCase().contains('e');
          });

          Map<String, bool> tags = {
            'azeitona': false,
            'cebola': true,
            'molho_tomate': true,
          };

          QuerySnapshot queryUsr = await Firestore.instance.collection('usuarios').getDocuments();
          Iterable<DocumentSnapshot> usrs = queryUsr.documents.where((DocumentSnapshot test) {
            return test.data['nome'].toString().toLowerCase() == 'maria rita';
          });

          Map<String, dynamic> data = {
            'produto': prod,
            // 'sabores': sabores.map((item) => {'sabor_' + counter.toString(): item.reference}),
            'tags': tags,
            'usuario': usrs.first.reference,
            'valor': 68.68
          };

          Map<String, dynamic> listSabores = Map<String, dynamic>();

          int counter = 1;
          sabores.forEach((DocumentSnapshot sabDoc) => listSabores['sabor_' + (counter++).toString()] = sabDoc.reference);

          data['sabores'] = listSabores;

          print(listSabores);
          DocumentReference addido = await Firestore.instance.collection('pedido').add(data);
          print(addido);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  // https://material.io/resources/color/#!/?view.left=0&view.right=1&primary.color=D32F2F&secondary.color=C2C03E&secondary.text.color=ffffff
  Color primary([double opacity = 1]) => Colors.red[700].withOpacity(opacity);

  Color seconday([double opacity = 1]) => Color(0xc2c03e).withOpacity(opacity);
}

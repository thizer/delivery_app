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
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
          color: Layout.light(),
          size: 48,
        ),
      ),
    );
  }

  // https://material.io/resources/color/#!/?view.left=0&view.right=1&primary.color=D32F2F&secondary.color=C2C03E&secondary.text.color=ffffff
  static Color primary([double opacity = 1]) => Colors.red[700].withOpacity(opacity);
  static Color primaryLight([double opacity = 1]) => Color(0xffff6659).withOpacity(opacity);
  static Color primaryDark([double opacity = 1]) => Color(0xff9a0007).withOpacity(opacity);

  static Color secondary([double opacity = 1]) => Colors.yellow[800].withOpacity(opacity);
  static Color secondaryLight([double opacity = 1]) => Color(0xfff7f26f).withOpacity(opacity);
  static Color secondaryDark([double opacity = 1]) => Color(0xff8f9000).withOpacity(opacity);

  static Color light([double opacity = 1]) => Color.fromRGBO(230, 230, 230, opacity);
  static Color dark([double opacity = 1]) => Color(0xff333333).withOpacity(opacity);

  static Color danger([double opacity = 1]) => Color.fromRGBO(217, 74, 74, opacity);
  static Color success([double opacity = 1]) => Color.fromRGBO(5, 100, 50, opacity);
  static Color info([double opacity = 1]) => Color.fromRGBO(100, 150, 255, opacity);
  static Color warning([double opacity = 1]) => Color.fromRGBO(250, 200, 70, opacity);
}

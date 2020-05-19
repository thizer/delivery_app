import 'package:delivery_app/views/layout.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static String tag = '/login';

  @override
  Widget build(BuildContext context) {
    //
    // Captura o tema do titulo
    TextStyle titleTheme = Theme.of(context).textTheme.headline6.copyWith(
          color: Layout.light(),
        );

    return Scaffold(
      backgroundColor: Layout.primaryDark(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                ClipRRect(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Layout.light(),
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(150),
                      color: Layout.dark(.8),
                    ),
                    child: Image.asset('assets/pizza-logo-2.png'),
                  ),
                  borderRadius: BorderRadius.circular(150),
                ),
                SizedBox(height: 10),
                Text('Delivery App', style: titleTheme),
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              Positioned(
                top: 5,
                left: 0,
                right: 0,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Layout.dark(),
                        offset: const Offset(0, 0),
                        spreadRadius: 3,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  color: Layout.light(),
                ),
                height: _calcContentHeight(context),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(left: 7),
                          child: Text('Entre para fazer seu pedido'),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide: BorderSide(
                              color: Layout.info(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Senha',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide: BorderSide(
                              color: Layout.info(),
                            ),
                          ),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: FlatButton(
                          color: Layout.info(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('/home');
                          },
                          child: Text(
                            'ENTRAR',
                            style: titleTheme,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 7),
                            child: GestureDetector(
                              child: Text(
                                'ou CADASTRE-SE',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Layout.primaryDark(),
                                ),
                              ),
                              onTap: () {
                                print('Tela de cadastro');
                              },
                            ),
                          ),
                        ),
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  double _calcContentHeight(BuildContext context) {
    var totalHeight = MediaQuery.of(context).size.height;
    var heightAvailable = totalHeight - MediaQuery.of(context).viewInsets.bottom;
    var heightIWant = MediaQuery.of(context).size.height * .6;

    var result = heightIWant;
    if (MediaQuery.of(context).viewInsets.bottom > 0) {
      result = heightAvailable;
    }

    return result;
  }
}

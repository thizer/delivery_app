import 'package:delivery_app/layout.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    // Captura o tema do titulo
    TextStyle titleTheme = Theme.of(context).textTheme.title.copyWith(
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
                    // color: ,
                    child: Image.asset('assets/pizza-logo.png'),
                  ),
                  borderRadius: BorderRadius.circular(150),
                ),
                SizedBox(height: 10),
                Text('Delivery App', style: titleTheme)
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
                        color: Layout.dark(.8),
                        offset: const Offset(0.0, 0.0),
                        spreadRadius: 8,
                        blurRadius: 15,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: Layout.light(),
                ),
                height: MediaQuery.of(context).size.height * .6,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                        ),
                        initialValue: 'Email',
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                        ),
                        initialValue: 'Senha',
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text('ENTRAR', style: titleTheme),
                        ),
                      )
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
}

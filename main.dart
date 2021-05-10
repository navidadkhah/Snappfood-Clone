

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snappfood_app/Info.dart';
import 'package:snappfood_app/Infos.dart';
import 'package:flutter/widgets.dart';
import 'package:snappfood_app/Menu.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:snappfood_app/New.dart';
import 'package:snappfood_app/Widjects.dart';
//  flutter_spinkit: ^4.1.2 ino to pubspec zadam




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // "/second": (context) => Secondpage(),
        "/login": (context) => Login(),
        "/signin": (context) => SignIn(),
        "/menu": (context) => Menu(),
        "/etebar": (context) => Etebar(),
        "/comments": (context) => Comments(),
        "/CmResturant": (context) => CmResturant(),
        "/likes": (context) => likes(),
      },
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[300],
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(50.0),
              child: Text("SNAPP FOOD",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text("Login"),
              onPressed: () {
                Navigator.pushNamed(context, "/login");
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
              ),
              child: Text("signin"),
              onPressed: () {
                Navigator.pushNamed(context, "/signin");
              },
            ),
          ],
        )));
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var _formkey = GlobalKey<FormState>();
  String fname;
  String lname;
  String number;
  String address = "";
  String password;
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.indigo,
      appBar: AppBar(
          leading: Icon(
            Icons.add,
          ),
          backgroundColor: Colors.redAccent,
          title: Text("signin page",
              style: new TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 30.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      onSaved: (String value) {
                        fname = value;
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "    Fill";
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(labelText: ' First name'),
                    ),
                    TextFormField(
                      onSaved: (String value) {
                        lname = value;
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "    Fill";
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(labelText: ' Last name'),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: ' Number'),
                      onSaved: (String value) {
                        number = value;
                      },
                      validator: (String num) {
                        if (num.length != 11 ) {
                          return " Atleast 11 number";
                        }
                        else if(Infos.information.indexWhere((element) => element.number == num)!=-1){
                          return " has been taken";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      onSaved: (String value) {
                        address = value;
                      },
                      validator: (String addr) {
                        if (addr.isEmpty) {
                          return "    Fill";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(labelText: ' Address'),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Password',
                          icon: const Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: const Icon(Icons.lock))),
                      validator: (val) =>
                          val.length < 6 ? 'Password too short.' : null,
                      onSaved: (val) => password = val,
                      obscureText: _obscureText,
                    ),
                    new FlatButton(
                        onPressed: _toggle,
                        child: new Text(_obscureText ? "Show" : "Hide")),
                    ElevatedButton(
                      child: Text("save"),
                      onPressed: () {
                        setState(() {
                          if (_formkey.currentState.validate()) {
                            _formkey.currentState.save();
                            Infos.add(
                                Info(fname, lname, address, number, password));
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              setState(() {
                                Navigator.pop(context);
                              });
                            });
                          }
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        backgroundColor: Colors.redAccent,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _formkey1 = GlobalKey<FormState>();
  var _formkey2 = GlobalKey<FormState>();

  String number = "";
  String password="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.grey[800],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRrgJnM9FLGc_bijjNnpD5Fxu6wd6QEwjP2g&usqp=CAU"),
               Form(
                 key: _formkey1,
                 child:  TextFormField(
                   onSaved: (String value) {
                     number = value;
                   },
                   validator: (String value){
                     if(Infos.information.indexWhere((element) => element.number == value)<0){
                       return "   Wrong";
                     }
                     return null;
                   },
                   decoration: new InputDecoration(
                     labelText: "Number",
                   ),

                 ),
               ),
               Form(
                 key: _formkey2,
                 child: TextFormField(
                   onSaved: (String value){
                     password=value;
                   },
                     decoration: new InputDecoration(
                       labelText: "Password",
                     ),
                   validator: (String value){
                        if(Infos.information.indexWhere((element) => element.password == value)<0){
                          return  "   Wrong";
                        }
                        return null;
                   },
               )


                ),
                ElevatedButton(
                        onPressed:() {
                          setState(() {
                            if(_formkey1.currentState.validate() && _formkey2.currentState.validate())
                            Navigator.pushNamed(context, "/menu");
                            
                          });
                          },


                    child: Text("login",
                      style: TextStyle(fontWeight: FontWeight.bold),)
                    ),



              ],
            ),
          ),

        ),

      ),

    );
  }
}


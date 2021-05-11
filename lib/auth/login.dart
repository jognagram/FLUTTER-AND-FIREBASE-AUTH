import 'package:auth01/views/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // String email;
  // String password;
  @override
  Widget build(BuildContext context) {
    final fld1 = TextFormField(
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            labelText: 'Username',
            labelStyle: TextStyle(
              color: Colors.white,
            )));

    final fld2 = TextFormField(
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          labelText: 'Password',
          labelStyle: TextStyle(
            color: Colors.white,
          )),
    );

    final fld = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          fld1,
          fld2,
        ],
      ),
    );

    final btn = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
          ),
        ),
        onPressed: () async {
          try {
            UserCredential userCredential =
                await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: "kmaevayasmine@gmail.com",
              password: "180801",
            );
            if (userCredential != null) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomePage();
              }));
              //   }));
            }
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              print('No user found for that email.');
            } else if (e.code == 'wrong-password') {
              print('Wrong password provided for that user.');
            }
          }
        },
      ),
    );
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Form(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(36),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                fld,
                Padding(
                  padding: EdgeInsets.only(bottom: 150),
                  child: btn,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

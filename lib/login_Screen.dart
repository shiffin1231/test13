import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/registration_Screen.dart';
import 'package:test1/theme_helper.dart';

import 'add_profile.dart';
import 'header_widget.dart';
import 'main.dart';
import 'menu_Screen.dart';

String emailID = "";
String password = "";
final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // double _headerHeight = 250;
  // // Key _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('LoginPage'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
             TextFormField(
               onChanged: (i){
                 emailId=i;
            },
               decoration: const InputDecoration(
                 icon: const Icon(Icons.email),
                 hintText: 'Enter your emailId',
                 labelText: 'EmailId',
               ),
             ),
                  TextFormField(
                    onChanged: (i){
                      password=i;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.password),
                      hintText: 'Enter your password',
                      labelText: 'password',
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:MaterialStateProperty.all(Colors.lightBlueAccent),
                    ),
                      child:Text('Sign In'),
                      onPressed:() async {
                        User? user;
                        try {
                          print(emailId);
                          print(password);
                          UserCredential userCredential = await _auth
                              .signInWithEmailAndPassword(
                            email: emailId,
                            password: password,
                          );
                          user = userCredential.user;
                          print(userCredential.user);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('Wrong Password Provider');
                          }
                        }
                         if (user == user) {
                          print("Logged In Successfully");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MenuScreen()),
                          );
                        }
                        else {
                          (user = user!);
                          print("LoggedIn Failed");

                        }
                      }
                  ),
                ],
            ),
      ]),
    ));
  }
}

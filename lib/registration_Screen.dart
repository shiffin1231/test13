import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test1/main.dart';
import 'main.dart';

String emailId="";
String password="";
final _auth=FirebaseAuth.instance;
final _firestore=FirebaseFirestore.instance;



class RegistrationScreen extends StatefulWidget {
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}
class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text("Registration"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding:EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(10),
                      child: TextField(
                        onChanged: (i){
                          emailId=i;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email Id',
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10),
                      child: TextField(
                        onChanged: (i){
                          password=i;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.lightBlue)),
                      child: Text('Register'),

                      onPressed: () async{
                        try{
                          final newUser= _auth.createUserWithEmailAndPassword(
                              email: emailId, password: password);
                          _firestore.collection('user_master').add({
                            'Email Id':emailId,
                            'password':password,
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomePage()),
                          );
                        }catch(e){
                          print(e);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test1/edit_profile.dart';
import 'package:test1/menu_Screen.dart';
import 'package:test1/registration_Screen.dart';

import 'main.dart';
import 'menu_Screen.dart';

String name = "";
var phone_no = "";
String adress = '';
final _auth = FirebaseAuth.instance;
final _firestore= FirebaseFirestore.instance;
var found = "n";

CollectionReference profile_ref = FirebaseFirestore.instance.collection('Profiles');

Future<List> getStudentData() async {
  QuerySnapshot snapshot = await profile_ref.get();
  var profiles = snapshot.docs.map((doc) => doc.data()).toList();
  print("std : ${profiles}");
  return profiles;
}
// }
// Future<List> getUserData() async {
//   QuerySnapshot snapshot = await user.get();
//   data = snapshot.docs.map((doc) => doc.data()).toList();
// }

class AddProfiles extends StatefulWidget {
  @override
  State<AddProfiles> createState() => _AddProfilesState();
}

class _AddProfilesState extends State<AddProfiles> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text("Profiles"),
      ),
      body: Form(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          onChanged: (i) {
                            name = i;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                            hintText: 'Enter Name',
                          ),
                        ),
                      ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: TextField(
                                onChanged: (i) {
                                  phone_no = i;
                                  },
                                decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Phone No',
                                hintText: 'Enter Phone No',
                                ),
                              ),
                            ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          onChanged: (i) {
                            adress = i;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Adress',
                            hintText: 'Enter Adress',
                          ),
                        ),
                      ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.lightBlue)),
                            child: Text('Save'),
                            onPressed: () async {
                              var profiles = await getStudentData();
                              print("profiles:_${profiles}");
                              if(found=="n"){
                                print("found: ${found}");
                                {
                                  _firestore.collection('profiles').add({
                                    'name': name,
                                    'phone_no': phone_no,
                                    'adress': adress,
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MenuScreen()),
                                  );
                                }
                              }
                        },
                      ),
                    ])),
              ]),
            )),
      ),
    );
  }
}

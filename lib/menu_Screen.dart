import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test1/display_Profiles.dart';
import 'package:test1/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test1/add_profile.dart';

String name="";
var phone_no ="";
String adress="";
final _auth=FirebaseAuth.instance;
final _firestore=FirebaseFirestore.instance;
CollectionReference students=FirebaseFirestore.instance.collection('Profiles');

Future<List> getStudentData()async{
  QuerySnapshot snapshot=await students.get();
  var profiles=snapshot.docs.map((doc) => doc.data()).toList();
  return profiles;
}

class MenuScreen extends StatefulWidget {
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}
class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text("Menu Screen"),
      ),
      body: Center(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightBlue)),
              child:Text('Add Profiles'),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>AddProfiles()),
                );
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightBlue)),
              child:Text('Display Profiles'),
              onPressed: () async {
                var profiles= await getStudentData();
                // print(profiles);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>DisplayProfiles(profiles)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
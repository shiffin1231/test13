import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
// import 'package:test1/add_Students_Marks.dart';
import 'package:test1/display_Profiles.dart';
import 'package:test1/menu_Screen.dart';

// import 'package:learning/loginScreen.dart';
CollectionReference profile_ref = FirebaseFirestore.instance.collection('Profiles');

Future<QuerySnapshot<Object?>> getStudentSnapshot() async {
  QuerySnapshot custSnapShot = await  profile_ref.get();
  return (custSnapShot);
}

Future<List> getStudentData() async {
  QuerySnapshot snapshot = await  profile_ref.get();
  var profiles = snapshot.docs.map((doc) => doc.data()).toList();
  print("std : ${profiles}");
  return profiles;
}

class EditUser extends StatelessWidget {
  EditUser(this.name, this.index);

  int index;
  String name = "";
  var phone_no="";
  String adress="";

  // get index => index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List View Builder'),
        ),
        body: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.pinkAccent,
                width: 5,
              )),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                    onChanged: (i) {
                      name = i;
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: name,
                      labelText: "studentName",
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextField(
                    // key: formKey,
                    keyboardType: TextInputType.numberWithOptions(),
                    onChanged: (i) {
                      phone_no = i;
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "phone_no",
                      labelText: "phone_no",
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (i) {
                      adress = i;
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "adress",
                      labelText: "adress",
                    ),
                  )),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.pinkAccent)),
                  child: const Text('Update Details'),
                  onPressed: () async {
                    QuerySnapshot snapshot = await getStudentSnapshot();
                    dynamic docId = snapshot.docs[index].id.toString();
                    print("docId :${docId}");

                    print(students);

                    if (name.isEmpty ||
                        phone_no.isEmpty ||
                        adress.isEmpty ) {
                      print("fields are empty");
                    } else {
                      await profile_ref.doc(docId).update({
                        'name': name,
                        'phone_no': phone_no,
                        'adress': adress
                      });
                      var profiles = await getStudentData();
                     name = "";
                     phone_no = "";
                     adress = "";
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MenuScreen()),
                      );
                    }
                  }),
            ],
          ),
        )
    );
  }
}
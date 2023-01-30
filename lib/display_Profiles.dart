import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'edit_Profiles.dart';
String name = "";
String phone_no="";
String adress="";
final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;
var profiles;

CollectionReference profile_ref = FirebaseFirestore.instance.collection('Profiles');
Future<List> getStudentData() async {
  QuerySnapshot snapshot= await profile_ref.get();
  var profilest= snapshot.docs.map((doc) => doc.data()).toList();
  return profilest;
}
class DisplayProfiles extends StatelessWidget {
  var profiles;
  DisplayProfiles(this.profiles);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Builder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: DisplayProfilesTest(),
    );
  }
}
class DisplayProfilesTest extends StatefulWidget {

  @override
  State<DisplayProfilesTest> createState() => _DisplayProfilesTestState();
}

class _DisplayProfilesTestState extends State<DisplayProfilesTest> {
  var profiles;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Profiles'),
      ),
      body:ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: profiles.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white,
                  child: Text(
                    profiles[index]["name"][0],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(profiles[index]["name"].toString(),
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),),
                    Text(profiles[index]["phone_no"].toString())
                  ],
                ),
                subtitle: Text(
                  profiles[index]["adress"].toString(),
                  style: TextStyle(
                      fontSize: 10, fontWeight: FontWeight.bold),),

                trailing: SizedBox(
                  width: 70,
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  EditUser(profiles, index)),
                            );
                            //
                            //
                          },
                          child: Icon(Icons.edit)),
                      InkWell(
                          onTap: () {
                              profiles.removeAt(index);


                          },
                          child: Icon(Icons.delete)),
                    ],
                  ),
                ),
    );
            },
  ), );
  }
}

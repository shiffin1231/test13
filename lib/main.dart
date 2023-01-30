import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:test1/registration_Screen.dart';
import 'package:test1/splash_Screen.dart';
// import 'package:test1/registration_Screen.dart';
// import 'package:test1/splash_Screen.dart';
// import 'package:test1/theme_helper.dart';
import 'add_profile.dart';
import 'login_Screen.dart';
String name="";
var phone_no="";
String adress="";
var data;
var profiles;
CollectionReference user=FirebaseFirestore.instance.collection('Profiles');
getUserData()async{
  QuerySnapshot snapshot=await user.get();
  data=snapshot.docs.map((doc) => doc.data()).toList();

}
Future<List> getStudentData() async {
  QuerySnapshot snapshot= await profile_ref.get();
  var profiles= snapshot.docs.map((doc) => doc.data()).toList();
  return profiles;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProfileApp());
}
class ProfileApp extends StatelessWidget {
  Color _primaryColor =HexColor('E06910');
  Color _accentColor =HexColor('##40E0D0');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      home: const SplashScreen(title:'Flutter Login UI'),
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Home Page'),
      ),
      body: Center(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              // decoration:ThemeHelper().buttonBoxdecoration(context),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.lightBlue)),
                  child:Text('Registration Screen'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>RegistrationScreen()),
                    );
                  },
                ),
            ),
            Container(
              // decoration:ThemeHelper().buttonBoxdecoration(context),
              child: ElevatedButton(

                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.lightBlue)),
                child:Text(' Login Screen '),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>LoginScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

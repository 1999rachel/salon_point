import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:saloon_point/SignUp/SignUp.dart';

import 'Dashboard/Dashboard.dart';
import 'LogIn/LogIn.dart';
import 'SalonOwner/DeletAndAddService/HomePageAddAndDeleteServices.dart';
import 'SplashScreen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
 await  Firebase.initializeApp();
  runApp(const MyApp(
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // routes: {
      //   '/ServiceSelection': (context) => ServiceEditDeleteHomePage(salon_id: 'salon_id', selected_service_id: widget.selected_service_id,),
      // },



      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),


      ),
      home:  Dashboard(),
    );
  }
}

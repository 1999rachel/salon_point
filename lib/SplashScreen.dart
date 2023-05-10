//
// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// import 'SignUp/SignUp.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   initState(){
//
//     super.initState();
//     Timer(Duration(seconds: 5), () {
//
//       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUp()));
//
//     });
//   }
//
//
//
//   Widget build(BuildContext context) {
//     return SafeArea(child: Scaffold(
//
//
//       body: Container(
//
//         color: Color(0xffA76895),
//         width: double.infinity,
//         height: double.infinity,
//         child: Center(
//           child: Text("Salon Point",style: TextStyle(
//             color: Colors.white,
//             fontSize: 30
//           ),),
//         ),
//
//       ),
//     ));
//   }
// }

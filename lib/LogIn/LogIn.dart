import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saloon_point/Dashboard/Dashboard.dart';
import 'package:saloon_point/LogIn/ForgotPassword/EnterPhoneNUmber.dart';
import 'package:http/http.dart' as http;

import '../SignUp/SignUp.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final formKey = GlobalKey<FormState>();
  String Phonecodenumber = "+255";
  bool phone = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var _isobscured = true;
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SafeArea(
          child: Container(
            color: Color(0xffF5F3F4),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                // Container(
                //   width: double.infinity,
                //   padding:
                //       EdgeInsets.only(left: 20, right: 20, top: 20,),
                //   child: Text(
                //     "Sign In",
                //     textAlign: TextAlign.left,
                //     style: TextStyle(
                //         color: Colors.black,
                //         fontWeight: FontWeight.bold,
                //         fontSize: 18),
                //   ),
                // ),

                Container(
                  height: 200,

                  child: Image.asset("assets/logo.png",fit: BoxFit.cover,),
                ),

                Expanded(
                  child: Center(
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20))),
                      child: Flexible(
                        child: Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              SizedBox(height: 30),
                              Container(
                                width: double.infinity,
                                padding:
                                    EdgeInsets.only(left: 20, right: 20,),
                                child: Text(
                                  "Sign In",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                       fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),

                              TextFormField(
                                controller: emailController,
                                validator: (value) {
                                  if (!EmailValidator.validate(value!)) {
                                    return 'Please enter a valid email address';
                                  } else if (value.isEmpty) {
                                    return "PLease enter your email address";
                                  }
                                  return null;
                                },
                                cursorColor: Colors.black54,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.black38, width: 0.5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 0.5, color: Colors.black38),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 0.5,
                                            color: Color(0xA7689500)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.black54,
                                      size: 24,
                                    ),
                                    label: Text("Enter your email"),
                                    labelStyle:
                                        TextStyle(color: Colors.black38),
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.black)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                obscureText: _isobscured,
                                controller: passwordController,
                                cursorColor: Colors.black54,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your password';
                                  } else if (value.length < 7) {
                                    return 'Password should have min. 7 characters';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.black38, width: 0.5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 0.5, color: Colors.black38),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 0.5,
                                            color: Color(0xA7689500)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    prefixIcon: Icon(
                                      Icons.key,
                                      color: Colors.black54,
                                      size: 24,
                                    ),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isobscured = !_isobscured;
                                          });
                                        },
                                        icon: _isobscured
                                            ? Icon(
                                                Icons.visibility,
                                                 color: Colors.black54,
                                              )
                                            : Icon(Icons.visibility_off,
                                          color: Color(0xffA76895),
                                        )),
                                    label: Text("Enter your password"),
                                    labelStyle:
                                        TextStyle(color: Colors.black38),
                                    hintText: "******",
                                    hintStyle: TextStyle(color: Colors.black)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EnterPhoneNUmber()));
                                  },
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      color: Colors.black,
                                      // fontSize: 18
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Color(0xffA76895),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0.0, 1.0), //(x,y)
                                        blurRadius: 4.0,
                                      ),
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: TextButton(
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {

                                    FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value) =>

                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Dashboard()))
                                    );



                                      }
                                    },
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  padding: EdgeInsets.only(bottom: 30),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Dont have an Account?",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUp()));
                                          },
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(
                                                color: Color(
                                                  0xff812727,
                                                ),
                                                fontWeight: FontWeight.bold),
                                          ))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

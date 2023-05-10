import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saloon_point/LogIn/LogIn.dart';
import 'package:saloon_point/SignUp/Phonenumberverification.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _obscured = true;
  bool _isobscure = true;
  bool _isobscureconfirm = true;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
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
                Container(
                  height: 200,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.cover,
                  ),
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
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            SizedBox(height: 30),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: Text(
                                "Sign Up",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
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
                                      left: 20, right: 20, top: 10, bottom: 10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.black38, width: 0.5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5, color: Colors.black38),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 0.5, color: Color(0xA7689500)),
                                      borderRadius: BorderRadius.circular(10)),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.black54,
                                    size: 24,
                                  ),
                                  label: Text("Email"),
                                  labelStyle: TextStyle(color: Colors.black38),
                                  hintText: "eg. abc@gmail.com",
                                  hintStyle: TextStyle(color: Colors.black54)),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                } else if (value.length < 7) {
                                  return 'Password should have min. 7 characters';
                                }
                                return null;
                              },
                              obscureText: _obscured,
                              cursorColor: Colors.black54,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      left: 20, right: 20, top: 10, bottom: 10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.black38, width: 0.5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5, color: Colors.black38),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 0.5, color: Color(0xA7689500)),
                                      borderRadius: BorderRadius.circular(10)),
                                  prefixIcon: Icon(
                                    Icons.key,
                                    color: Colors.black54,
                                    size: 24,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscured = !_obscured;
                                      });
                                    },
                                    icon: _obscured
                                        ? Icon(
                                            Icons.visibility,
                                            color: Colors.black54,
                                          )
                                        : Icon(
                                            Icons.visibility_off,
                                            color: Color(0xffA76895),
                                          ),
                                  ),
                                  label: Text("Enter your password"),
                                  labelStyle: TextStyle(color: Colors.black38),
                                  hintText: "******",
                                  hintStyle: TextStyle(color: Colors.black54)),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: confirmPassword,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please confirm password';
                                } else if (value.length < 7) {
                                  return 'Password should have min. 7 characters';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                if (confirmPassword == passwordController) {
                                  return null;
                                }
                              },
                              obscureText: _isobscureconfirm,
                              cursorColor: Colors.black54,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      left: 20, right: 20, top: 10, bottom: 10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.black38, width: 0.5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5, color: Colors.black38),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 0.5, color: Color(0xA7689500)),
                                      borderRadius: BorderRadius.circular(10)),
                                  prefixIcon: Icon(
                                    Icons.key,
                                    color: Colors.black54,
                                    size: 24,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isobscureconfirm = !_isobscureconfirm;
                                      });
                                    },
                                    icon: _isobscureconfirm
                                        ? Icon(Icons.visibility)
                                        : Icon(Icons.visibility_off),
                                  ),
                                  label: Text("Confirm password"),
                                  labelStyle: TextStyle(color: Colors.black38),
                                  hintText: "******",
                                  hintStyle: TextStyle(color: Colors.black54)),
                            ),
                            SizedBox(
                              height: 20,
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
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                     FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                              email: emailController.text,
                                              password: passwordController.text)
                                          .then((value) =>

                                          FirebaseFirestore
                                                  .instance
                                                  .collection("customers")
                                                  .doc(_auth.currentUser?.uid)
                                                  .set({
                                                'email': emailController.text,
                                                'password':
                                                    passwordController.text
                                              })
                                      .then((value) =>
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(builder: (context) => LogIn()))))
                                        .catchError((onError) =>
                                    {"something went wrong"});

                                      // Navigator.of(context).push(
                                      //     MaterialPageRoute(
                                      //         builder: (context) => LogIn()));
                                    }
                                  },
                                  child: Text(
                                    "Sign Up",
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
                                      "Already have an Account?",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LogIn()));
                                        },
                                        child: Text(
                                          "Sign In",
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

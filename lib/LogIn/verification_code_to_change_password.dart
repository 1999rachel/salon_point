import 'package:flutter/material.dart';
import 'package:saloon_point/LogIn/LogIn.dart';

import '../NormalCustomer pages/UserAccount/ChangePassword.dart';
import 'Changepassword.dart';

class verification_code_to_change_password extends StatefulWidget {
  verification_code_to_change_password({Key? key}) : super(key: key);

  @override
  State<verification_code_to_change_password> createState() =>
      _verification_code_to_change_passwordState();
}

class _verification_code_to_change_passwordState
    extends State<verification_code_to_change_password> {
  TextEditingController verification_code_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xffF7F7F7),
        title: Text(
          "Verification Code",
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xffF7F7F7),
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 45,
                ),
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Please enter code sent to your phone ",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: verification_code_controller,
                    cursorColor: Colors.black54,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the code';
                      } else if (value.length < 4) {
                        return 'Incorrect verification code';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        if (value.length == 4) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Changepassword_after_forgetting_password()));
                        }
                        return null;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.black38, width: 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.5, color: Colors.black38),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0.5, color: Color(0xA7689500)),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

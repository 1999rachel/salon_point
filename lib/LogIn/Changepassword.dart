
import 'package:flutter/material.dart';
import 'package:saloon_point/LogIn/LogIn.dart';

class Changepassword_after_forgetting_password extends StatefulWidget {
  const Changepassword_after_forgetting_password({Key? key}) : super(key: key);

  @override
  State<Changepassword_after_forgetting_password> createState() => _Changepassword_after_forgetting_passwordState();
}

class _Changepassword_after_forgetting_passwordState extends State<Changepassword_after_forgetting_password> {

  TextEditingController old_password_controller = TextEditingController() ;
  TextEditingController new_password_controller = TextEditingController();
  TextEditingController confirm_password_controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:Color(0xffF7F7F7) ,
        elevation: 0,
        title: Text("Change password",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),
      ),
      body:  SafeArea(
        child: Container(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xffF7F7F7),
            child:  Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your old  password';
                        } else if (value.length<7) {
                          return 'Password should have min. 7 characters';
                        }
                        return null;
                      },
                      onChanged: (value){

                      },
                      controller: old_password_controller,
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
                        label: Text("Enter your old"),
                        labelStyle: TextStyle(color: Colors.black38),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your new password';
                        } else if (value.length < 7) {
                          return 'Password should have min. 7 characters';
                        }
                        return null;
                      },
                      onChanged: (value){},
                      controller: new_password_controller,
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
                        label: Text("Enter your new password"),
                        labelStyle: TextStyle(color: Colors.black38),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 7) {
                          return 'Password should have min. 7 characters';
                        }
                        return null;
                      },
                      onChanged: (value){
                        if(new_password_controller==confirm_password_controller)
                          {
                            setState(() {
                              confirm_password_controller= value as TextEditingController;
                            });
                          }
                      },
                      controller: confirm_password_controller,
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
                        label: Text("Cornfirm password"),
                        labelStyle: TextStyle(color: Colors.black38),
                      ),
                    ),
                    SizedBox(
                      height: 30,
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
                            if(_formKey.currentState!.validate()){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogIn()));

                            }

                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ) ,
    );
  }
}

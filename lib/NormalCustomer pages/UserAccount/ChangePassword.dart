import 'package:flutter/material.dart';

import '../../LogIn/LogIn.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isobscureoldpassword= false;
  bool isobscurenewpassword= false;
  bool isobscureconfirmpassword= false;
  TextEditingController OldPasswordController = TextEditingController();
  TextEditingController NewPasswordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();
  final formKey= GlobalKey <FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: Container(

            color: Color(0xffF5F3F4),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  padding:
                  EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      InkWell(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.arrow_back,size: 24,color: Colors.black,),
                        ),
                      ),

                      Text(
                        "Change Pawword",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Container()
                    ],
                  ),
                ),

                // Container(
                //    height: 140,
                //    child: Image.asset("assets/line.png",fit: BoxFit.fitWidth,width: double.infinity,),
                //  ),


                SizedBox(
                  height: 150,
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
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                SizedBox(height: 50),


                                TextFormField(
                                  controller: OldPasswordController,
                                  cursorColor: Colors.black54,
                                  keyboardType: TextInputType.text,
                                  obscureText: isobscureoldpassword,

                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'Please enter your old password';
                                    }
                                    else if (value.length<7){
                                      return 'Password should have min. 7 characters';
                                    }
                                    return null;


                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(onPressed: (){

                                      setState(() {
                                        isobscureoldpassword= !   isobscureoldpassword;
                                      });
                                    },
                                        icon:   isobscureoldpassword?Icon(Icons.visibility):Icon(Icons.visibility_off)),


                                    contentPadding:
                                      EdgeInsets.only(left: 20, right: 20,top: 10,bottom: 10),
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

                                      label: Text("Old Password"),
                                      labelStyle: TextStyle(
                                          color: Colors.black38
                                      ),

                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: NewPasswordController,
                                  cursorColor: Colors.black54,
                                  keyboardType: TextInputType.text,
                                  obscureText: isobscurenewpassword,

                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'Please enter your new password';
                                    }
                                    else if (value.length<7){
                                      return 'Password should have min. 7 characters';
                                    }
                                    return null;


                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(onPressed: (){

                                      setState(() {
                                        isobscurenewpassword= !   isobscurenewpassword;
                                      });
                                    },
                                        icon:   isobscurenewpassword?Icon(Icons.visibility):Icon(Icons.visibility_off)),



                                    contentPadding:
                                      EdgeInsets.only(left: 20, right: 20,top: 10,bottom: 10),
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

                                      label: Text("New Password"),
                                      labelStyle: TextStyle(
                                          color: Colors.black38
                                      ),

                                      // hintText: "Enter New Password",
                                      // hintStyle: TextStyle(
                                      //     color: Colors.black
                                      // )
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(

                                  controller: ConfirmPasswordController,

                                  cursorColor: Colors.black54,
                                  keyboardType: TextInputType.text,
                                  obscureText: isobscureconfirmpassword,

                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'Please confirm your password';
                                    }
                                    else if (value.length<7){
                                      return 'Password should have min. 7 characters';
                                    }
                                    return null;


                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(onPressed: (){

                                      setState(() {
                                        isobscureconfirmpassword= !   isobscureconfirmpassword;
                                      });
                                    },
                                        icon:   isobscureconfirmpassword?Icon(Icons.visibility):Icon(Icons.visibility_off)),


                                    contentPadding:
                                      EdgeInsets.only(left: 20, right: 20,top: 10,bottom: 10),
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

                                      label: Text("Confirm Password"),
                                      labelStyle: TextStyle(
                                          color: Colors.black38
                                      ),

                                  ),
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
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: TextButton(
                                      onPressed: () {
                                        final isValidForm = formKey.currentState!.validate();
                                        if(isValidForm){
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogIn()));
                                        }

                                      },
                                      child: Text("Submit",style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),)),
                                ),


                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}



import 'package:flutter/material.dart';

import '../../SignUp/Phonenumberverification.dart';
import '../verification_code_to_change_password.dart';

class EnterPhoneNUmber extends StatefulWidget {
  const EnterPhoneNUmber({Key? key}) : super(key: key);

  @override
  State<EnterPhoneNUmber> createState() => _EnterPhoneNUmberState();
}

class _EnterPhoneNUmberState extends State<EnterPhoneNUmber> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffF7F7F7),
        centerTitle: true,
        title: Text("Phone number verification",style: TextStyle(
          color: Colors.black,fontSize: 17
        ),),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();

        }, icon: Icon(Icons.arrow_back,size: 24,color: Colors.black,)),
      ),
      body: Container(

        child:  Container(
          padding: EdgeInsets.only(left: 20,right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 45,),
                Container(
                  child: Align(alignment: Alignment.bottomLeft,
                    child: Text("Please enter your number",textAlign: TextAlign.center,style: TextStyle(
                        color: Colors.black,fontSize: 16
                    ),),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                Container(
                  child:     TextFormField(
                    controller: phoneController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      } else if (value.length < 10) {
                        return 'Please enter 10 digits for phone number';
                      }
                      return null;
                    },

                    cursorColor: Colors.black54,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(

                      filled: true,
                      fillColor: Colors.white,

                      hintText: "+255",
                      hintStyle: TextStyle(
                          color: Colors.black87
                      ),
                      prefixIcon: Icon(Icons.call,color: Colors.black87,),
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


                    ),
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>verification_code_to_change_password()));

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
        // child: Container(
        //   width: double.infinity,
        //   height: double.infinity,
        //   color: Color(0xffF7F7F7),
        //   child: Column(
        //     children: [
        //       SizedBox(height: 150,),
        //       Expanded(child: Container(decoration: BoxDecoration(
        //           color: Colors.white,
        //           // boxShadow: [
        //           //   BoxShadow(
        //           //     color: Colors.black12,
        //           //     offset: Offset(4, 0),
        //           //     blurRadius: 0.5
        //           //   )
        //           //
        //           // ],
        //           borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),)
        //       ),width: double.infinity,height: double.infinity,
        //         child: Container(
        //           padding: EdgeInsets.only(left: 20,right: 20),
        //           child: Column(
        //             children: [
        //               SizedBox(height: 45,),
        //               Container(
        //                 child: Align(alignment: Alignment.bottomLeft,
        //                   child: Text("Please enter your number",textAlign: TextAlign.center,style: TextStyle(
        //                       color: Colors.black,fontSize: 16
        //                   ),),
        //                 ),
        //               ),
        //               SizedBox(
        //                 height: 30,
        //               ),
        //
        //               Container(
        //                 child:     TextFormField(
        //
        //                   cursorColor: Colors.black54,
        //                   keyboardType: TextInputType.number,
        //                   decoration: InputDecoration(
        //
        //                     hintText: "+255",
        //                     hintStyle: TextStyle(
        //                       color: Colors.black87
        //                     ),
        //                     prefixIcon: Icon(Icons.call,color: Colors.black87,),
        //                     contentPadding: EdgeInsets.only(
        //                         left: 20, right: 20, top: 10, bottom: 10),
        //                     border: OutlineInputBorder(
        //                       borderRadius: BorderRadius.circular(10),
        //                       borderSide: BorderSide(
        //                           color: Colors.black38, width: 0.5),
        //                     ),
        //                     enabledBorder: OutlineInputBorder(
        //                         borderSide: BorderSide(
        //                             width: 0.5, color: Colors.black38),
        //                         borderRadius: BorderRadius.circular(10)),
        //                     focusedBorder: OutlineInputBorder(
        //                         borderSide: const BorderSide(
        //                             width: 0.5, color: Color(0xA7689500)),
        //                         borderRadius: BorderRadius.circular(10)),
        //
        //
        //                   ),
        //                 ),
        //               ),
        //
        //               SizedBox(
        //                 height: 30,
        //               ),
        //               Container(
        //                 height: 50,
        //                 width: double.infinity,
        //                 decoration: BoxDecoration(
        //                     color: Color(0xffA76895),
        //                     boxShadow: [
        //                       BoxShadow(
        //                         color: Colors.grey,
        //                         offset: Offset(0.0, 1.0), //(x,y)
        //                         blurRadius: 4.0,
        //                       ),
        //                     ],
        //                     borderRadius:
        //                     BorderRadius.all(Radius.circular(10))),
        //                 child: TextButton(
        //
        //                     onPressed: () {
        //                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Phonenumberverification()));
        //                     },
        //                     child: Text(
        //                       "Submit",
        //                       style: TextStyle(
        //                           color: Colors.white,
        //                           fontSize: 18,
        //                           fontWeight: FontWeight.bold),
        //                     )),
        //               ),
        //             ],
        //           ),
        //         ),
        //
        //
        //       ),
        //
        //
        //       )
        //     ],
        //   ),
        // ),
      ),
    );
  }
}

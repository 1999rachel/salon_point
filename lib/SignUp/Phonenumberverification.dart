import 'package:flutter/material.dart';
import 'package:saloon_point/LogIn/LogIn.dart';
import 'package:saloon_point/NormalCustomer%20pages/UserAccount/ChangePassword.dart';

import '../LogIn/Changepassword.dart';

class Phonenumberverification extends StatefulWidget {

  const Phonenumberverification({Key? key}) : super(key: key);
  @override

  State<Phonenumberverification> createState() => _PhonenumberverificationState();
}

class _PhonenumberverificationState extends State<Phonenumberverification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xffF7F7F7),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20,right: 20,top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Text("Phone number verification",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                  Container()


                ],
              ),
            ),
            SizedBox(height: 150,),
            Expanded(child: Container(decoration: BoxDecoration(
                color: Colors.white,
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black12,
              //     offset: Offset(4, 0),
              //     blurRadius: 0.5
              //   )
              //
              // ],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),)
            ),width: double.infinity,height: double.infinity,
            child: Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Column(
                children: [
                  SizedBox(height: 45,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Changepassword_after_forgetting_password()));
                    },
                    child: Container(
                      child: Align(alignment: Alignment.center,
                        child: Text("Please enter number sent to your phone for verification",textAlign: TextAlign.center,style: TextStyle(
                          color: Colors.black,fontSize: 16
                        ),),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  Container(
                  child:     TextFormField(

                    textAlign: TextAlign.center,
                    cursorColor: Colors.black54,
                    keyboardType: TextInputType.number,
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


                        ),
                  ),
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  // Container(
                  //   height: 50,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //       color: Color(0xffA76895),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.grey,
                  //           offset: Offset(0.0, 1.0), //(x,y)
                  //           blurRadius: 4.0,
                  //         ),
                  //       ],
                  //       borderRadius:
                  //       BorderRadius.all(Radius.circular(10))),
                  //   child: TextButton(
                  //
                  //       onPressed: () {
                  //         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogIn()));
                  //       },
                  //       child: Text(
                  //         "Submit",
                  //         style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.bold),
                  //       )),
                  // ),
                ],
              ),
            ),


            ),


            )
          ],
        ),
      ),
    );
  }
}

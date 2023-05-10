
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../DeletAndAddService/HomePageAddAndDeleteServices.dart';

class SalonOwnerAccount extends StatefulWidget {
  const SalonOwnerAccount({Key? key}) : super(key: key);

  @override
  State<SalonOwnerAccount> createState() => _SalonOwnerAccountState();
}

class _SalonOwnerAccountState extends State<SalonOwnerAccount> {

  var _ChangeSalonProfile;
  var ImagePath;
 File? _SalonImageProfile;

  Future  getToChangeSalonProfile() async{
    final salonprofileImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(salonprofileImage== null)return null;

    final TemporarySalonProfile = File(salonprofileImage.path);

    setState(() {
      this._ChangeSalonProfile=TemporarySalonProfile;
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffF5F3F4),
        child: Column(
          children: [

            // Container(
            //   height: 80,
            //   color: Color(0xffA76895),
            //   child: Container(
            //     padding: EdgeInsets.only(left: 20,right: 20,top: 20),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         InkWell(
            //           onTap: (){
            //
            //             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ServiceEditDeleteHomePage()));
            //           },
            //           child: CircleAvatar(
            //             radius: 15,
            //             backgroundColor: Colors.white,
            //             child: Icon(Icons.arrow_back,size: 24,color: Colors.black,),
            //           ),
            //         ),
            //         Container(
            //           child:Text ("Salon account",style: TextStyle(color: Colors.white,fontSize: 20),),
            //         ),
            //         Container()
            //       ],
            //     ),
            //   ),
            // ),


            Stack(
              children: [
                Container(
                  color: Color(0xffA76895),
                  height: 150,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(

                              top: 32,
                              right: 20

                          ),
                          child: TextButton(
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ServiceEditDeleteHomePage()));
                            },
                            child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                  size: 24,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 85),
                  child: Container(
                      height: 100,
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(left: 20, right: 20,top: 2,bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 4.0,
                          ),
                        ],
                      ),
                      child: Column(children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                              onPressed:(){
                                showDialog(context: context, builder: (context){
                                  return  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 40,left: 150),
                                      height: 170,

                                      width: 300,
                                      child: Dialog(
                                        elevation: 5,
                                        backgroundColor: Colors.white,
                                        insetAnimationDuration: Duration(minutes: 3),
                                        child: Column(
                                          children: [
                                            Padding(padding: EdgeInsets.only(top: 5)),
                                            TextButton(
                                              onPressed: getToChangeSalonProfile,
                                                style: ButtonStyle(

                                                ),
                                                child: Text("Change Profile",style: TextStyle( color:Colors.black ),)),
                                            Divider(),
                                            TextButton(onPressed: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ServiceEditDeleteHomePage()));

                                            }, child:Text("Keep it",style: TextStyle(color: Color(0xffA76895)),)),

                                            Padding(padding: EdgeInsets.only(top: 5))


                                          ],
                                        ),

                                      ),

                                    ),
                                  );


                                });
                              },
                              child: Icon(Icons.more_horiz,color: Colors.black,size: 24,)),
                        ),


                        Container(
                          alignment: Alignment.bottomCenter,
                          // margin: EdgeInsets.only(top: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(
                                "Dunia ya warembo",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              SizedBox(
                                height: 0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "kivule",
                                    style: TextStyle(color: Color(0xff812727)),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "Dodoma",
                                    style: TextStyle(color: Color(0xff812727)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],)

                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        alignment: Alignment.center,
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(    color: Color(0xffE3E3E3),
                        ),
                        child:_ChangeSalonProfile!= null ?Image.file(_ChangeSalonProfile!,width: 100,height: 100,fit: BoxFit.cover,) :Icon(Icons.person,size: 50,color: Colors.black54,),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),


                // SalonServices()
              ],
            ),
            SizedBox(
              height: 0.1,
            ),

            SizedBox(
              height: 20,
            ),
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text("Salon name:",style: TextStyle(
                              color: Colors.black
                          ),),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white
                            ),
                            onPressed: (){
                              showDialog(context: (context), builder: (context){

                                return   Center(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          height: 230,
                                          padding: EdgeInsets.only(top: 10,bottom: 10),
                                          child: Dialog(
                                            backgroundColor: Colors.white,
                                            elevation: 10,
                                            child: Center(
                                              child: Container(
                                                alignment: Alignment.center,
                                                child:Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,

                                                  children: [
                                                    InkWell(
                                                        onTap: (){
                                                          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChangeUserName()));
                                                        },
                                                        child: Align(
                                                          alignment: Alignment.center,
                                                          child: Container(
                                                            height: 45,
                                                            alignment: Alignment.center,
                                                            width: double.infinity,
                                                              // color: Colors.black12,
                                                              child: Text("Change Salon name")),
                                                        )),
                                                    Divider(),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    InkWell(
                                                        onTap: (){
                                                          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SalonOwnerAccount()));
                                                        },
                                                     child: Align(
                                                      alignment: Alignment.center,
                                                      child: Container(
                                                          height: 45,
                                                          alignment: Alignment.center,
                                                          width: double.infinity,

                                                          // color: Colors.black12,
                                                          child: Text("Keep it")),
                                                    )),



                                                  ],
                                                ),


                                              ),
                                            ),

                                          )),
                                    ));





                              });


                            }, child: Text("Dunia ya warembo",style: TextStyle(color: Colors.black),))

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text("Country",style: TextStyle(
                              color: Colors.black
                          ),),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white
                            ),
                            onPressed: (){
                              showDialog(context: (context), builder: (context){

                                return   Center(
                                    child: Container(
                                        height: 250,
                                        padding: EdgeInsets.only(top: 20,bottom: 20),
                                        child: Dialog(
                                          backgroundColor: Colors.white,
                                          elevation: 10,
                                          child: Center(
                                            child: Container(
                                              alignment: Alignment.center,
                                              child:Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,

                                                children: [
                                                  InkWell(
                                                      onTap: (){
                                                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChangeUserName()));
                                                      },
                                                      child: Container(
                                                          padding: EdgeInsets.all(5),
                                                          color: Colors.black12,
                                                          child: Text("Change Location"))),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  InkWell(
                                                      onTap: (){
                                                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserAccount()));
                                                      },
                                                      child:Container(
                                                          padding: EdgeInsets.all(5),
                                                          color: Colors.black12,

                                                          child: Text("Keep it"))),



                                                ],
                                              ),


                                            ),
                                          ),

                                        )));





                              });


                            }, child: Text("Tanzania",style: TextStyle(color: Colors.black),))

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text("City",style: TextStyle(
                              color: Colors.black
                          ),),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white
                            ),
                            onPressed: (){
                              showDialog(context: (context), builder: (context){

                                return   Center(
                                    child: Container(
                                        height: 250,
                                        padding: EdgeInsets.only(top: 20,bottom: 20),
                                        child: Dialog(
                                          backgroundColor: Colors.white,
                                          elevation: 10,
                                          child: Center(
                                            child: Container(
                                              alignment: Alignment.center,
                                              child:Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,

                                                children: [
                                                  InkWell(
                                                      onTap: (){
                                                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChangeUserName()));
                                                      },
                                                      child: Container(
                                                          padding: EdgeInsets.all(5),
                                                          color: Colors.black12,
                                                          child: Text("Change Location"))),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  InkWell(
                                                      onTap: (){
                                                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserAccount()));
                                                      },
                                                      child:Container(
                                                          padding: EdgeInsets.all(5),
                                                          color: Colors.black12,

                                                          child: Text("Keep it"))),



                                                ],
                                              ),


                                            ),
                                          ),

                                        )));





                              });


                            }, child: Text("Dodoma",style: TextStyle(color: Colors.black),))

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: EdgeInsets.only(left: 20,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text("Street",style: TextStyle(
                                color: Colors.black
                            ),),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white
                              ),
                              onPressed: (){
                                showDialog(context: (context), builder: (context){

                                  return   Center(
                                      child: Container(
                                          height: 250,
                                          padding: EdgeInsets.only(top: 20,bottom: 20),
                                          child: Dialog(
                                            backgroundColor: Colors.white,
                                            elevation: 10,
                                            child: Center(
                                              child: Container(
                                                alignment: Alignment.center,
                                                child:Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,

                                                  children: [
                                                    InkWell(
                                                        onTap: (){
                                                          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChangeUserName()));
                                                        },
                                                        child: Container(
                                                            padding: EdgeInsets.all(5),
                                                            color: Colors.black12,
                                                            child: Text("Change Location"))),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    InkWell(
                                                        onTap: (){
                                                          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserAccount()));
                                                        },
                                                        child:Container(
                                                            padding: EdgeInsets.all(5),
                                                            color: Colors.black12,

                                                            child: Text("Keep it"))),



                                                  ],
                                                ),


                                              ),
                                            ),

                                          )));





                                });


                              }, child: Text("Kivule",style: TextStyle(color: Colors.black),))

                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text("Contact 1",style: TextStyle(
                              color: Colors.black
                          ),),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white
                            ),
                            onPressed: (){
                              showDialog(context: (context), builder: (context){

                                return   Center(
                                    child: Container(
                                        height: 250,
                                        padding: EdgeInsets.only(top: 20,bottom: 20),
                                        child: Dialog(
                                          backgroundColor: Colors.white,
                                          elevation: 10,
                                          child: Center(
                                            child: Container(
                                              alignment: Alignment.center,
                                              child:Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,

                                                children: [
                                                  InkWell(
                                                      onTap: (){
                                                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChangeUserName()));
                                                      },
                                                      child: Container(
                                                          padding: EdgeInsets.all(5),
                                                          color: Colors.black12,
                                                          child: Text("Change Location"))),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  InkWell(
                                                      onTap: (){
                                                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserAccount()));
                                                      },
                                                      child:Container(
                                                          padding: EdgeInsets.all(5),
                                                          color: Colors.black12,

                                                          child: Text("Keep it"))),



                                                ],
                                              ),


                                            ),
                                          ),

                                        )));





                              });


                            }, child: Text("+2556543565q",style: TextStyle(color: Colors.black),))

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text("Contact 2",style: TextStyle(
                              color: Colors.black
                          ),),
                        ),
                        ElevatedButton(

                            style: ElevatedButton.styleFrom(
                                primary: Colors.white
                            ),
                            onPressed: (){
                              showDialog(context: (context), builder: (context){

                                return   Center(
                                    child: Container(
                                        height: 250,
                                        padding: EdgeInsets.only(top: 20,bottom: 20),
                                        child: Dialog(
                                          backgroundColor: Colors.white,
                                          elevation: 10,
                                          child: Center(
                                            child: Container(
                                              alignment: Alignment.center,
                                              child:Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,

                                                children: [
                                                  InkWell(
                                                      onTap: (){
                                                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChangeUserName()));
                                                      },
                                                      child: Container(
                                                          padding: EdgeInsets.all(5),
                                                          color: Colors.black12,
                                                          child: Text("Change Location"))),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  InkWell(
                                                      onTap: (){
                                                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserAccount()));
                                                      },
                                                      child:Container(
                                                          padding: EdgeInsets.all(5),
                                                          color: Colors.black12,

                                                          child: Text("Keep it"))),



                                                ],
                                              ),


                                            ),
                                          ),

                                        )));





                              });


                            }, child: Text("+2556543565q",style: TextStyle(color: Colors.black),))

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text("Password:",style: TextStyle(
                              color: Colors.black
                          ),),
                        ),
                        Container(

                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white
                              ),
                              onPressed: (){
                                showDialog(context: (context), builder: (context){

                                  return   Center(
                                      child: Container(
                                          height: 250,
                                          padding: EdgeInsets.only(top: 20,bottom: 20),
                                          child: Dialog(
                                            backgroundColor: Colors.white,
                                            elevation: 10,
                                            child: Center(
                                              child: Container(
                                                alignment: Alignment.center,
                                                child:Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,

                                                  children: [
                                                    InkWell(
                                                        onTap: (){
                                                          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChangePassword()));
                                                        },
                                                        child: Container(
                                                            padding: EdgeInsets.all(5),
                                                            color: Colors.black12,
                                                            child: Text("Change password"))),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    InkWell(
                                                        onTap: (){
                                                          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserAccount()));
                                                        },
                                                        child:Container(
                                                            padding: EdgeInsets.all(5),
                                                            color: Colors.black12,

                                                            child: Text("Keep it"))),



                                                  ],
                                                ),


                                              ),
                                            ),

                                          )));





                                });


                              }, child: Text("******",style: TextStyle(color: Colors.black),)),
                        )

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  // Container(
                  //   height: 50,
                  //   width: double.infinity,
                  //   margin: EdgeInsets.only(left: 20,right: 20,bottom: 30),
                  //
                  //   decoration: BoxDecoration(
                  //       color: Color(0xffA76895),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.grey,
                  //           offset: Offset(0.0, 1.0), //(x,y)
                  //           blurRadius: 4.0,
                  //         ),
                  //       ],
                  //       borderRadius: BorderRadius.all(Radius.circular(10))
                  //   ),
                  //   child: TextButton(
                  //
                  //
                  //       onPressed: (){
                  //
                  //         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SalonOwnerAccount()));
                  //         //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Tutorial()));
                  //
                  //       },
                  //       child: Text("Submit"
                  //           ,style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.bold
                  //       ),)),
                  // ),
                ],
              ),
            ))


          ],
        ),
      ),
    );
  }

  // void pickmedia() async {
  //
  //   XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (file!=null){
  //     imagePath = file.path;
  //     setState(() {
  //
  //     });
  //   }
  // }
}

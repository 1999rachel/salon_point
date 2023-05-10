import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../Dashboard/Dashboard.dart';
import 'ChangePassword.dart';
import 'ChangeUserName.dart';
class UserAccount extends StatefulWidget {
  const UserAccount({Key? key}) : super(key: key);

  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {

  File ? _normaluserprofile;
  File? _backgroundImage;
  var imagepath;

  Future getProfile() async {

    final image= await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image== null)return;

    final ImageTemporary = File(image.path);

    setState(() {
      this._normaluserprofile = ImageTemporary;
    });

  }


  Future getBackgroundImage() async {

    final backgroundimage= await ImagePicker().pickImage(source: ImageSource.gallery);
    if(backgroundimage== null)return;

    final BackgroundImageTemporary = File(backgroundimage.path);

    setState(() {
      this._backgroundImage = BackgroundImageTemporary;
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffA76895),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();

            },
            icon: Icon(
              Icons.arrow_back_outlined,
              size: 24,
              color: Colors.white,
            )),
        title: Text(
          "Account",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      
      body: Container(
        color: Color(0xffF5F3F4),
        child: Column(
          children: [

            SizedBox(
              height: 0.1,
            ),

            Container(
              height: 270,
              child: Column(
                children: [


                  Stack(
                    children: [

                      Container(
                        height: 200,
                        width: double.infinity,
                          child:   _backgroundImage!=null?Image.file(_backgroundImage!,width: 90,
                            height: 90,fit: BoxFit.cover,): Image.asset("assets/video.jpeg",fit: BoxFit.cover
                            ,),
                        ),

                      Container(
                         margin: EdgeInsets.only(top:120),
                         child: Align(
                           alignment: Alignment.center,
                           child: ClipRRect(
                             borderRadius: BorderRadius.circular(100),
                             child: Container(
                               alignment: Alignment.center,
                               width: 130,
                               height: 130,
                               decoration: BoxDecoration(color: Colors.white),
                               child: Column(
                                 children: [
                                   _normaluserprofile!=null?Image.file(_normaluserprofile!,width: 130,
                                     height: 130,fit: BoxFit.cover,):      Image.asset(
                                     "assets/video.jpeg",
                                     fit: BoxFit.cover,
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ),
                       ),
                        InkWell(

                          onTap: (){},
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.only(top: 190,left: 70),
                             child: FloatingActionButton(
                               backgroundColor: Color(0xffE3E3E3),

                               elevation: 10,
                               onPressed: getProfile,
                               child: Icon(Icons.camera_alt_outlined,color: Colors.black54,size: 30,),
                             ),
                            ),
                          ),
                        ),


                    ],
                  )
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text("Username:",style: TextStyle(
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
                                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChangeUserName()));
                                       },
                                       child: Container(
                                         padding: EdgeInsets.all(5),

                                           child: Text("Change Username"))),
                                       Divider(),
                                       InkWell(
                                           onTap: (){
                                             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserAccount()));
                                           },
                                           child:Container(
                                           padding: EdgeInsets.all(5),
                                           child: Text("Keep it"))


                                       ),




                                     ],
                                   ),


                                 ),
                               ),

                             )));





                     });
                     
                     
                      }, child: Text("+255743903678",style: TextStyle(color: Colors.black),))

                ],
              ),
            ),
            SizedBox(
              height: 10,
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
                    margin: EdgeInsets.only(right: 65),
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
                                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChangePassword()));
                                                  },
                                                  child: Container(
                                                      padding: EdgeInsets.all(5),
                                                      child: Text("Change password"))),
                                           Divider(),
                                              InkWell(
                                                  onTap: (){
                                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserAccount()));
                                                  },
                                                  child:Container(
                                                      padding: EdgeInsets.all(5),

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
          ],
        ),
      ),
    );
  }
}

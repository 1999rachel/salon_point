import 'dart:io';

import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:image_picker/image_picker.dart';

import 'HomePageAddAndDeleteServices.dart';

class EditServices extends StatefulWidget {
  String salon_id;
  final List<String> selectedServiceIds;
   EditServices({Key? key, required this.salon_id, required this.selectedServiceIds,}) : super(key: key);

  @override
  State<EditServices> createState() => _EditServicesState();
}

class _EditServicesState extends State<EditServices> {

  //pass datas from page to page


  // String service_style,service_image,description,service_cost;
  // EditServices({required this.service_style,required this.description,required this.service_image,required this.service_cost})


  File? _EditServicePicture;
  var imagepath;



  Future getToEditService() async {

    final image= await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image== null)return;

    final ImageTemporary = File(image.path);

    setState(() {
      this._EditServicePicture = ImageTemporary;
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
  child: Column(
    children: [
      SizedBox(
        height: 0.2,
      ),

      Container(
        height: 200,
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    height: 200,
                    width: double.infinity,
                    child: FullScreenWidget(
                      child:   _EditServicePicture!=null?Image.file(_EditServicePicture!,width: 90,
                        height: 90,fit: BoxFit.cover,):Image.asset("assets/video.jpeg",fit: BoxFit.cover
                        ,),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 20),
                     margin: EdgeInsets.only(top:120),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            margin: EdgeInsets.only(left: 90),
                            child: FloatingActionButton(
                              backgroundColor: Color(0xffE3E3E3),

                              elevation: 10,
                              onPressed: getToEditService,
                              child: Icon(Icons.camera_alt_outlined,color: Colors.black54,size: 30,),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),



                ],
              ),


            ],
          ),
        ),
      ),
      SizedBox(
        height: 25,
      ),
      Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 20,right: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Text("Style:",style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: TextFormField(
                          readOnly: true,
                          cursorColor: Colors.black54,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(

                              contentPadding:
                              EdgeInsets.only(left: 20, right: 20,top: 5,bottom: 5),
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

                              hintText: "Hair Style",
                              hintStyle: TextStyle(
                                  color: Colors.black
                              )
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: Container(
                    child: Row(
                      children: [
                        Text("Cost:",style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: TextFormField(
                            cursorColor: Colors.black54,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(

                                contentPadding:
                                EdgeInsets.only(left: 20, right: 20,top: 5,bottom: 5),
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

                                hintText: "0 TzSh",
                                hintStyle: TextStyle(
                                    color: Colors.black
                                )
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: Container(
                    child: Row(
                      children: [
                        Text("description",style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: TextFormField(
                            maxLines: 5,
                            cursorColor: Colors.black54,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(

                                contentPadding:
                                EdgeInsets.only(left: 20, right: 20,top: 5,bottom: 5),
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

                                hintText: "Service description",
                                hintStyle: TextStyle(
                                    color: Colors.black
                                )
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                ),
                SizedBox(
                  height: 120,
                ),
                // Expanded(child: Container()),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 30),
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


                        onPressed: (){

                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ServiceEditDeleteHomePage (salon_id: widget.salon_id, selectedServiceIds: [],)));
                          //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Tutorial()));

                        },
                        child: Text("Submit",style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),)),
                  ),
                ),


              ],
            ),
          ),

        ),
      ),




    ],
  ),
),

    );
  }
}

import 'dart:ffi';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';

import '../../NormalCustomer pages/Homepage.dart';
import '../../utility/color.dart';
import '../DeletAndAddService/HomePageAddAndDeleteServices.dart';
import 'CheckBoxState_Model.dart';



class ServiceSelection extends StatefulWidget {
  // String salon_id;
   ServiceSelection({Key? key}) : super(key: key);

  @override
  State<ServiceSelection> createState() => _ServiceSelectionState();
}

class _ServiceSelectionState extends State<ServiceSelection> {
  // String ?service;
   var value = true;
  File ? _SalonProfile;
  var imagepath;
  bool _onclicked = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Container(
        color: ButtonColor,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Color(0xffA76895),
                  height: 125,
                  width: double.infinity,
                  child: Buttons(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Container(
                    height: 110,
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(left: 20, right: 20),
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
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SizedBox(height: 2,),
                          Text(
                            "Dunia ya warembo",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            height: 3,
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
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      // onTap: getToChangeSalonProfile,

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child:Container(
                          alignment: Alignment.center,
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(color: Colors.white),
                          child:Container(
                            color: Color(0xffE3E3E3),child:Align (
                            alignment: Alignment.center,
                          child: Icon(Icons.person,color: Colors.black54,size: 50,),


                          ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ],
            ),
            SizedBox(
              height: 40,
            ),

            Container(
              alignment: Alignment.center,
              child: Text("Select the service you offer",style: TextStyle(
                color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold
              ),),
            ),
            SizedBox(
              height: 10,
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

                        Expanded
                          (
                          child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance.collection("services_db").snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                            if ( !snapshot.hasData){
                              return Center(
                                child: SpinKitSpinningLines(
                                  color:ButtonColor ,
                                  size: 20,

                                ),
                              );
                              
                            } if (snapshot.connectionState==ConnectionState.waiting){
                              Center(
                                child:
                                SpinKitSpinningLines(
                                  color:ButtonColor ,
                                  size: 20,

                                ),
                              );
                              
                              
                            }
                            QuerySnapshot querysnapshot = snapshot.data;
                            List<QueryDocumentSnapshot> DocumentSnapshotList =
                                          querysnapshot.docs;
                            return  Container(

                              child: ListView.builder(
                                  itemCount: DocumentSnapshotList.length,
                                  itemBuilder: (context,index){
                                    QueryDocumentSnapshot service_data =
                                             DocumentSnapshotList[index];
                                    return  CheckboxListTile(
                                      selected: false,
                                        title: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(color: Color(0xffDADADA),width: 0.5)

                                            ),

                                            padding: EdgeInsets.all(10),
                                            // child: Text(displayServicesToSelect[index].title.toString())),

                                            child: Text(
                                              // "Hair service"
                                              service_data['service_name']

                                            )),
                                        activeColor: ButtonColor,
                                        controlAffinity: ListTileControlAffinity.leading,
                                        value: service_data["status"],
                                        onChanged: (bool? value)=>setState(() =>

                                        FirebaseFirestore.instance.collection("services_db").doc(service_data.id).update({
                                          'status': value!

                                        })
                                        ));

                                    // return Row(
                                    //   children: [
                                    //
                                    //     IconButton(onPressed: (){}, icon: Icon(Icons.check_box_outline_blank_outlined)),
                                    //     Expanded(child: Container(
                                    //       margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                                    //       height: 45,
                                    //       width: double.infinity,
                                    //       decoration: BoxDecoration(
                                    //         color: Colors.red,
                                    //         borderRadius: BorderRadius.all(Radius.circular(10))
                                    //       ),
                                    //     ))
                                    //
                                    //   ],
                                    // );
                                    // return  CheckboxListTile(
                                    //     title: Container(
                                    //         decoration: BoxDecoration(
                                    //             color: Colors.white,
                                    //             borderRadius: BorderRadius.circular(10),
                                    //             border: Border.all(color: Color(0xffDADADA),width: 0.5)
                                    //
                                    //         ),
                                    //
                                    //         padding: EdgeInsets.all(10),
                                    //         // child: Text(displayServicesToSelect[index].title.toString())),
                                    //
                                    //         child: Text(
                                    //           // "Hair service"
                                    //           service_data['service_name']
                                    //
                                    //         )),
                                    //     activeColor: Colors.blue,
                                    //     controlAffinity: ListTileControlAffinity.leading,
                                    //     value: snapshot.data,
                                    //     onChanged: (value)=>setState(() =>this.value=value!));

                                  }),
                            );



                          },
                            // child: Container(
                            //   child: ListView.builder(
                            //       itemCount: 5,
                            //       itemBuilder: (context,index){
                            //         // QueryDocumentSnapshot service_data =
                            //         // DocumentSnapshotList[index];
                            //         return  CheckboxListTile(
                            //             title: Container(
                            //                 decoration: BoxDecoration(
                            //                     color: Colors.white,
                            //                     borderRadius: BorderRadius.circular(10),
                            //                     border: Border.all(color: Color(0xffDADADA),width: 0.5)
                            //
                            //                 ),
                            //
                            //                 padding: EdgeInsets.all(10),
                            //                 // child: Text(displayServicesToSelect[index].title.toString())),
                            //
                            //                 child: Text(
                            //                   "Hair service"
                            //                     // service_data['name']
                            //
                            //                 )),
                            //             activeColor: Colors.blue,
                            //             controlAffinity: ListTileControlAffinity.leading,
                            //             value: value,
                            //             onChanged: (value)=>setState(() =>this.value=value!));
                            //         // return  CheckboxListTile(
                            //         //     title: Container(
                            //         //         decoration: BoxDecoration(
                            //         //             color: Colors.white,
                            //         //             borderRadius: BorderRadius.circular(10),
                            //         //             border: Border.all(color: Color(0xffDADADA),width: 0.5)
                            //         //
                            //         //         ),
                            //         //
                            //         //         padding: EdgeInsets.all(10),
                            //         //         // child: Text(displayServicesToSelect[index].title.toString())),
                            //         //
                            //         //         child: Text(service_data['name'])),
                            //         //     activeColor: Colors.blue,
                            //         //     controlAffinity: ListTileControlAffinity.leading,
                            //         //     value: value, onChanged: (value)=>setState(() =>this.value=value!));
                            //
                            //       }),
                            // ),
                          ),
                        ),
                        // Flexible(
                        //
                        //     child: StreamBuilder<QuerySnapshot>(
                        //       stream: FirebaseFirestore.instance.collection("services").snapshots(),
                        //       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                        //         if(!snapshot.hasData){
                        //           return Center(
                        //             child: CircularProgressIndicator(
                        //               value: 20,
                        //             ),
                        //           );
                        //         }
                        //         if(snapshot.connectionState==ConnectionState.waiting){
                        //           return Center(
                        //             child: CircularProgressIndicator(
                        //               value: 20,
                        //             ),
                        //           );
                        //         }
                        //         if(snapshot.connectionState==ConnectionState.active){
                        //           QuerySnapshot querysnapshot = snapshot.data;
                        //           List<QueryDocumentSnapshot> DocumentSnapshotList =
                        //               querysnapshot.docs;
                        //           return    Container(
                        //             child: ListView.builder(
                        //                 itemCount: snapshot.data!.documents.length,
                        //                 itemBuilder: (context,index){
                        //                   QueryDocumentSnapshot service_data =
                        //                   DocumentSnapshotList[index];
                        //                   return  CheckboxListTile(
                        //                       title: Container(
                        //                           decoration: BoxDecoration(
                        //                               color: Colors.white,
                        //                               borderRadius: BorderRadius.circular(10),
                        //                               border: Border.all(color: Color(0xffDADADA),width: 0.5)
                        //
                        //                           ),
                        //
                        //                           padding: EdgeInsets.all(10),
                        //                           // child: Text(displayServicesToSelect[index].title.toString())),
                        //
                        //                           child: Text(service_data['name'])),
                        //                       activeColor: Colors.blue,
                        //                       controlAffinity: ListTileControlAffinity.leading,
                        //                       value: value,
                        //                       onChanged: (value)=>setState(() =>this.value=value!));
                        //                   // return  CheckboxListTile(
                        //                   //     title: Container(
                        //                   //         decoration: BoxDecoration(
                        //                   //             color: Colors.white,
                        //                   //             borderRadius: BorderRadius.circular(10),
                        //                   //             border: Border.all(color: Color(0xffDADADA),width: 0.5)
                        //                   //
                        //                   //         ),
                        //                   //
                        //                   //         padding: EdgeInsets.all(10),
                        //                   //         // child: Text(displayServicesToSelect[index].title.toString())),
                        //                   //
                        //                   //         child: Text(service_data['name'])),
                        //                   //     activeColor: Colors.blue,
                        //                   //     controlAffinity: ListTileControlAffinity.leading,
                        //                   //     value: value, onChanged: (value)=>setState(() =>this.value=value!));
                        //
                        //                 }),
                        //           );
                        //         }
                        //         return Center(
                        //           child:CircularProgressIndicator(
                        //             value: 20,
                        //           ) ,
                        //         );
                        //       },
                        //
                        //     )),

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
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 4.0,
                                ),
                              ],
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: TextButton(
                              onPressed: (){

                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ServiceEditDeleteHomePage()));
                                //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Tutorial()));

                              },
                              child: Text("Submit",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),)),
                        ),
                        SizedBox(
                          height: 30,
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
    );

  }
  // Widget SingleCheckBox(CheckBoxState checkBox)=>CheckboxListTile(
  //     title: Container(
  //         decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(10),
  //             border: Border.all(color: Color(0xffDADADA),width: 0.5)
  //
  //         ),
  //
  //         padding: EdgeInsets.all(10),
  //         child: Text("Hair Service")),
  //     activeColor: Colors.blue,
  //     controlAffinity: ListTileControlAffinity.leading,
  //     value: checkBox.va, onChanged: (value)=>setState(() =>this.value=value!))
}



import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:image_picker/image_picker.dart';
import '../../utility/color.dart';
import '../BookedAppoitments/BookedAppoitnment.dart';
import '../SalonOwnerAccount/SalonOwnerAccount.dart';
import '../ServiceSelection/ServiceSelection.dart';
import 'EditServices.dart';
import 'SearchServiceModels.dart';

class ServiceEditDeleteHomePage extends StatefulWidget {
  String salon_id;
  final List<String> selectedServiceIds;
  ServiceEditDeleteHomePage({Key? key, required this.salon_id, required this.selectedServiceIds,}) : super(key: key);

  @override
  State<ServiceEditDeleteHomePage> createState() =>
      _ServiceEditDeleteHomePageState();
}

class _ServiceEditDeleteHomePageState extends State<ServiceEditDeleteHomePage> {
  final active_index = 1;
  var _bottomNavigationKey;
  var _SalonProfile;
  var ImagePath;

  Future getToChangeSalonProfile() async {
    final salonprofile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (salonprofile == null) return null;
    final TemporarySalonProfile = File(salonprofile.path);

    setState(() {
      this._SalonProfile = TemporarySalonProfile;
    });
  }

  // Creates the function that creates a dump of list of services to select
  static List<Service_ModelSearch> ListOfSalonServicesToBeEdited = [
    Service_ModelSearch("assets/video.jpeg", "20000", "Crochet", "description"),
    Service_ModelSearch("assets/video.jpeg", "1000", "Mbinjuo", "description"),
    Service_ModelSearch(
        "assets/video.jpeg", "30000", "bobtwist", "description"),
    Service_ModelSearch("assets/video.jpeg", "100", "Crochet", "description"),
    Service_ModelSearch("assets/video.jpeg", "1000", "Mbinjuo", "description"),
    Service_ModelSearch(
        "assets/video.jpeg", "20000", "bobtwist", "description"),
    Service_ModelSearch("assets/video.jpeg", "20000", "Crochet", "description"),
    Service_ModelSearch(
        "assets/video.jpeg", "1000", "kilimanjaro", "description"),
    Service_ModelSearch(
        "assets/video.jpeg", "20000", "mambo bambo", "description"),
    Service_ModelSearch("assets/video.jpeg", "20000", "Crochet", "description"),
    Service_ModelSearch(
        "assets/video.jpeg", "1000", "kilimanjaro", "description"),
    Service_ModelSearch(
        "assets/video.jpeg", "20000", "mambo bambo", "description"),
    Service_ModelSearch("assets/video.jpeg", "20000", "Crochet", "description"),
    Service_ModelSearch(
        "assets/video.jpeg", "1000", "kilimanjaro", "description"),
    Service_ModelSearch(
        "assets/video.jpeg", "20000", "mambo bambo", "description")
  ];

  //Creates a List that display the content in a design from ServiceModels

  var displayServicesToEdit =
      List<Service_ModelSearch>.from(ListOfSalonServicesToBeEdited);

  //here we filter the list of search

  // nw we display the searched list
  void updateListOnSearh(String value) {
    setState(() {
      displayServicesToEdit = ListOfSalonServicesToBeEdited.where((element) =>
              element.service_style.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  TextEditingController hairstyleController = TextEditingController();
  TextEditingController servicecostController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Color(0xffA76895),
        height: 60,
        color: Colors.white,
        backgroundColor: Color(0xfff0f0f0),
        key: _bottomNavigationKey,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.calendar_month_outlined, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          setState(() {
            switch (index) {
              case 0:
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ServiceSelection(salon_id: widget.salon_id,)));

                break;

              case 1:
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BookedAppoitments(salon_id: widget.salon_id, selectedServiceIds: [],)));
                break;

              case 2:
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SalonOwnerAccount(salon_id :widget.salon_id, selectedServiceIds: [],)));
            }
          });
        },
      ),
      body: Container(
        color: Color(0xffF5F3F4),
        child: DefaultTabController(
          length: 6,
          initialIndex: 0,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      color: Color(0xffA76895),
                      height: 115,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              alignment: Alignment.topLeft,
                              padding:
                                  EdgeInsets.only(left: 20, top: 30, right: 20),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                    size: 24,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 75),
                      child: Container(
                          height: 100,
                          alignment: Alignment.bottomCenter,
                          margin: EdgeInsets.only(
                              left: 20, right: 20, top: 2, bottom: 5),
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
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: TextButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 40, left: 150),
                                                height: 170,
                                                width: 300,
                                                child: Dialog(
                                                  elevation: 5,
                                                  backgroundColor: Colors.white,
                                                  insetAnimationDuration:
                                                      Duration(minutes: 3),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 5)),
                                                      TextButton(
                                                          onPressed:
                                                              getToChangeSalonProfile,
                                                          style: ButtonStyle(),
                                                          child: Text(
                                                            "Change Profile",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          )),
                                                      Divider(),
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .push(MaterialPageRoute(
                                                                    builder:

                                                                        (context) =>
                                                                            ServiceEditDeleteHomePage(salon_id: widget.salon_id, selectedServiceIds: [], )));
                                                          },
                                                          child: Text(
                                                            "Keep it",
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xffA76895)),
                                                          )),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 5))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    child: Icon(
                                      Icons.more_horiz,
                                      color: Colors.black,
                                      size: 24,
                                    )),
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
                                      height: 3,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "kivule",
                                          style: TextStyle(
                                              color: Color(0xff812727)),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "Dodoma",
                                          style: TextStyle(
                                              color: Color(0xff812727)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 35),
                      child: Align(
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            alignment: Alignment.center,
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              color: Color(0xffE3E3E3),
                            ),
                            child: _SalonProfile != null
                                ? Image.file(
                                    _SalonProfile!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  )
                                : Icon(
                                    Icons.person,
                                    size: 50,
                                    color: Colors.black54,
                                  ),
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
                  height: 10,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Color(0xffFBFBFB)),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 5, bottom: 8, left: 20, right: 20),
                    child: Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TabBar(
                                isScrollable: true,
                                indicator: BoxDecoration(
                                    color: Color(0xffD8BDD0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                tabs: [
                                  Container(
                                      padding: EdgeInsets.all(6),
                                      child: Text(
                                        "All service ",
                                        textAlign: TextAlign.center,
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Text(
                                    "hair ",
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "massage",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "nails",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "makeup",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "mhahshghzd",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ServiceSelection(salon_id: widget.salon_id,)));
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffA76895),
                                      borderRadius: BorderRadius.circular(10)),
                                  // margin: EdgeInsets.only(top: 5,bottom: 200,right: 10),
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 3, bottom: 3),
                                  child: Container(
                                      child: Row(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 1,
                                      ),
                                      Text(
                                        "Add service",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ))),
                            ),
                            SizedBox(
                              width: 5,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                //  SearchButton(),

                Container(
                  height: 45,
                  child: TextFormField(
                    onChanged: (value) => updateListOnSearh(value),
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.black54,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white54,
                        contentPadding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black38, width: 0.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.5, color: Colors.black38),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0.5, color: Color(0xA7689500)),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black54,
                          size: 24,
                        ),
                        hintText: "Search salon here",
                        hintStyle: TextStyle(color: Colors.black38)),
                  ),
                ),
                // Services(),

                Expanded(
                  child: Container(
                    child: TabBarView(children: [
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                        .collection('service_type_db').where('service_id', whereIn:widget.selectedServiceIds)
                        .snapshots(),

                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if(snapshot.hasError){
                            return Center(
                              child:Text('Error: ${snapshot.error}'),
                            );
                          }
                          if (!snapshot.hasData) {
                            return Center(
                              child: SpinKitSpinningLines(
                                color: ButtonColor,
                                size: 50,
                              ),
                            );
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            Center(
                              child: SpinKitSpinningLines(
                                color: ButtonColor,
                                size: 50,
                              ),
                            );
                          }
                          QuerySnapshot querysnapshot = snapshot.data;
                          List<QueryDocumentSnapshot>
                          DocumentSnapshotList = querysnapshot.docs;
                          return  Expanded(
                            child: ListView.builder(
                              itemCount: DocumentSnapshotList.length,
                              // itemCount: displayServicesToEdit.length,
                              itemBuilder: (context, index) {
                                QueryDocumentSnapshot service_type_data =
                                DocumentSnapshotList[index];
                                return SingleChildScrollView(
                                  child: Container(
                                    width: double.infinity,
                                    color: Color(0xffFBFBFB),
                                    // padding: EdgeInsets.only(top: 5,bottom: 5),
                                    margin: EdgeInsets.only(top: 5, bottom: 5),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 20, right: 20, bottom: 10),
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: InkWell(
                                              onTap: () {
                                                // Navigator.of(context).push(
                                                //     MaterialPageRoute(
                                                //         builder: (context) =>
                                                //             MoreAboutService()));
                                              },
                                              child: Container(
                                                height: 105,
                                                width: 100,
                                                child: FullScreenWidget(
                                                  child: Image.asset("assets/video.jpeg",
                                                    // displayServicesToEdit[index]
                                                    //     .service_image,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 20, bottom: 10, left: 15),
                                            alignment: Alignment.topLeft,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    child: Text(service_type_data[
                                                    'service_type_name'],
                                                      // displayServicesToEdit[index]
                                                      //     .service_style,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w600),
                                                    )),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  child: Text( '0 TzSh',
                                                    // "${displayServicesToEdit[index].service_cost} TzSh",
                                                    style: TextStyle(
                                                        color: Color(0xff812727),
                                                        fontWeight:
                                                        FontWeight.w600),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 55,
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(child: Container()),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [

                                              IconButton(
                                                  onPressed: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                EditServices(salon_id: widget.salon_id, selectedServiceIds: [],)));
                                                  },
                                                  icon: Icon(
                                                    Icons.edit_note_outlined,
                                                    size: 24,
                                                    color: Colors.black,
                                                  )),
                                              IconButton(
                                                  splashRadius: 20,
                                                  focusColor: Colors.red,
                                                  splashColor: Colors.red,
                                                  onPressed: () {
                                                    setState(() {});

                                                    // });
                                                  },
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.black,
                                                    size: 24,
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );


                        },
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              child: Container(
                                width: double.infinity,
                                color: Color(0xffFBFBFB),
                                // padding: EdgeInsets.only(top: 5,bottom: 5),
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10),
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: InkWell(
                                          onTap: () {
                                            // Navigator.of(context).push(
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             MoreAboutService()));
                                          },
                                          child: Container(
                                            height: 105,
                                            width: 100,
                                            child: FullScreenWidget(
                                              child: Image.asset(
                                                "assets/video.jpeg",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 20, bottom: 10, left: 15),
                                        alignment: Alignment.topLeft,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                child: Text(
                                              "Hair style",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "0 Tzsh",
                                                style: TextStyle(
                                                    color: Color(0xff812727),
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 55,
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      Row(
                                        children: [
                                          IconButton(
                                              hoverColor: Colors.red,
                                              focusColor: Colors.red,
                                              disabledColor: Colors.black,
                                              splashColor: Colors.red,
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.edit_note_outlined,
                                                size: 24,
                                                color: Colors.black,
                                              )),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.black,
                                                size: 24,
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Center(
                        child: Text("hiiiiiiiiiii"),
                      ),
                      Center(
                        child: Text("hiiiiiiiiiii"),
                      ),
                      Center(
                        child: Text("hiiiiiiiiiii"),
                      ),
                      Center(
                        child: Text("hiiiiiiiiiii"),
                      ),
                    ]),
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

// class Services extends StatelessWidget {
//   const Services({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//       child: Expanded(
//         child: Container(
//           child: TabBarView(children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: ,
//                 itemBuilder: (context, index) {
//                   return SingleChildScrollView(
//                     child: Container(
//                       width: double.infinity,
//                       color: Color(0xffFBFBFB),
//                       // padding: EdgeInsets.only(top: 5,bottom: 5),
//                       margin: EdgeInsets.only(top: 5, bottom: 5),
//                       child: Container(
//                         padding:
//                         EdgeInsets.only(left: 20, right: 20, bottom: 10),
//                         alignment: Alignment.topLeft,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(10),
//                               child: InkWell(
//                                 onTap: () {
//                                   // Navigator.of(context).push(
//                                   //     MaterialPageRoute(
//                                   //         builder: (context) =>
//                                   //             MoreAboutService()));
//                                 },
//                                 child: Container(
//                                   height: 105,
//                                   width: 100,
//                                   child: FullScreenWidget(
//                                     child: Image.asset(
//                                       "assets/video.jpeg",
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               padding: EdgeInsets.only(
//                                   top: 20, bottom: 10, left: 15),
//                               alignment: Alignment.topLeft,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                       child: Text(
//                                         "Hair style",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.w600),
//                                       )),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Container(
//                                     alignment: Alignment.topLeft,
//                                     child: Text(
//                                       "0 Tzsh",
//                                       style: TextStyle(
//                                           color: Color(0xff812727),
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 55,
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Expanded(child: Container()),
//                            Row(
//                              children: [
//                               IconButton(
//
//                                   onPressed: (){
//
//                                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditServices()));
//
//                                   }, icon: Icon(Icons.edit_note_outlined,size: 24,color: Colors.black,)),
//                                IconButton(
//                                  splashRadius: 20,
//                                    focusColor: Colors.red,
//                                    splashColor: Colors.red,
//                                    onPressed: () {
//
//                                      // });
//                                    },
//                                    icon: Icon(
//                                      Icons.delete,
//                                      color: Colors.black,
//                                      size: 24,
//                                    ))
//                              ],
//                            )
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 10,
//                 itemBuilder: (context, index) {
//                   return SingleChildScrollView(
//                     child: Container(
//                       width: double.infinity,
//                       color: Color(0xffFBFBFB),
//                       // padding: EdgeInsets.only(top: 5,bottom: 5),
//                       margin: EdgeInsets.only(top: 5, bottom: 5),
//                       child: Container(
//                         padding:
//                         EdgeInsets.only(left: 20, right: 20, bottom: 10),
//                         alignment: Alignment.topLeft,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(10),
//                               child: InkWell(
//                                 onTap: () {
//                                   // Navigator.of(context).push(
//                                   //     MaterialPageRoute(
//                                   //         builder: (context) =>
//                                   //             MoreAboutService()));
//                                 },
//                                 child: Container(
//                                   height: 105,
//                                   width: 100,
//                                   child: FullScreenWidget(
//                                     child: Image.asset(
//                                       "assets/video.jpeg",
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               padding: EdgeInsets.only(
//                                   top: 20, bottom: 10, left: 15),
//                               alignment: Alignment.topLeft,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                       child: Text(
//                                         "Hair style",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.w600),
//                                       )),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Container(
//                                     alignment: Alignment.topLeft,
//                                     child: Text(
//                                       "0 Tzsh",
//                                       style: TextStyle(
//                                           color: Color(0xff812727),
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 55,
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Expanded(child: Container()),
//                             Row(
//                               children: [
//                                 IconButton(
//                                     hoverColor: Colors.red,
//                                     focusColor: Colors.red,
//                                     disabledColor: Colors.black,
//                                     splashColor: Colors.red,
//                                     onPressed: (){}, icon: Icon(Icons.edit_note_outlined,size: 24,color: Colors.black,)),
//
//                                 IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.black,size: 24,))
//
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Center(
//               child: Text("hiiiiiiiiiii"),
//             ),
//             Center(
//               child: Text("hiiiiiiiiiii"),
//             ),
//             Center(
//               child: Text("hiiiiiiiiiii"),
//             ),
//             Center(
//               child: Text("hiiiiiiiiiii"),
//             ),
//
//           ]),
//         ),
//       ),
//     );
//   }
// }

// class SearchButton extends StatelessWidget {
//   const SearchButton({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return   Container(
//       child:   TextFormField(
//         // onChanged: (value)=>updateSearchList(value) ,
//         style: TextStyle(color: Colors.black),
//
//         cursorColor: Colors.black54,
//         keyboardType: TextInputType.text,
//
//         decoration: InputDecoration(
//             filled: true,
//             fillColor: Colors.white54,
//
//             contentPadding:
//             EdgeInsets.only(left: 20, right: 20,top: 10,bottom: 10),
//             border: OutlineInputBorder(
//
//               borderSide: BorderSide(
//                   color: Colors.black38, width: 0.5),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                   width: 0.5, color: Colors.black38),
//
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: const BorderSide(
//                   width: 0.5, color: Color(0xA7689500)),
//
//             ),
//             prefixIcon: Icon(
//               Icons.search,
//               color: Colors.black54,
//               size: 24,
//
//             ),
//             hintText: "Search salon here",
//             hintStyle: TextStyle(
//                 color: Colors.black38
//             )
//         ),
//       ),
//     );
//   }
// }
//
//
// }

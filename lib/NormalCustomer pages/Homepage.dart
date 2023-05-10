import 'dart:developer';
import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saloon_point/LogIn/LogIn.dart';
import 'package:saloon_point/NormalCustomer%20pages/Booking/CallForAppoitnment/CallForAppointment.dart';
import '../Dashboard/Dashboard.dart';
import 'Booking/bookingCalender.dart';
import 'Contacts.dart';
import 'Gallery/Gallery.dart';
import 'Nearby/googlemap.dart';
import 'Services/CustomerServices.dart';
import 'UserAccount/UserAccount.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final active_index = 0;
  var _bottomNavigationKey;
  int _index = 0;
  PageController pageController = PageController(
    viewportFraction: 0.85,
  );
  var _currentPageValue = 0;
  bool _isPressed = false;
  bool _ispressedprofile = false;
  File? _normaluserprofile;
  var imagepath;

  Future getProfile() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final ImageTemporary = File(image.path);

    setState(() {
      this._normaluserprofile = ImageTemporary;
    });
  }

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page! as int;
        print(_currentPageValue);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          color: Colors.white,
          buttonBackgroundColor: Color(0xffA76895),
          backgroundColor: Color(0xfff0f0f0),
          key: _bottomNavigationKey,
          items: const <Widget>[
            Icon(Icons.home, size: 30),
            // Icon(Icons.near_me, size: 30),
            Icon(Icons.person, size: 30),
          ],
          onTap: (index) {
            setState(() {
              switch (index) {
                case 0:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Dashboard()));

                  break;

                case 1:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => UserAccount()));
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => NearBySalon()));
                  break;

                // case 2:
                //   Navigator.of(context).push(
                //       MaterialPageRoute(builder: (context) => UserAccount()));
              }
            });
          },
        ),
        // appBar: AppBar(
        //   leading: IconButton(onPressed: (){}, icon: I),
        //
        // ),
        body: Container(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  color: Color(0xffA76895),
                  height: 115,
                  width: double.infinity,
                  child: Buttons(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Container(
                    height: 100,
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
                  margin: EdgeInsets.only(top: 30),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: getProfile,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            showDialog(
                                context: (context),
                                builder: (context) {
                                  return Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(top: 40, left: 150),
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
                                                    EdgeInsets.only(top: 5)),
                                            TextButton(
                                                onPressed: getProfile,
                                                style: ButtonStyle(),
                                                child: Text(
                                                  "Change Profile",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                )),
                                            Divider(),
                                            TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _isPressed = !_isPressed;
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    LogIn()));
                                                  });
                                                },
                                                child: Text("Log Out",
                                                    style: TextStyle(
                                                        color: Color(
                                                            0xffA76895)))),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5))
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          });
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            alignment: Alignment.center,
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(color: Colors.white),
                            child: _normaluserprofile != null
                                ? Image.file(
                                    _normaluserprofile!,
                                    width: 90,
                                    height: 90,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    "assets/video.jpeg",
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 220,
                decoration: BoxDecoration(),
                padding: EdgeInsets.only(
                  top: 15,
                  // left: 10,
                  // right: 10,
                ),
                child: PageView.builder(
                    controller: PageController(viewportFraction: 0.6),
                    onPageChanged: (index) {
                      setState(() {
                        _index = index;
                      });
                    },
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return TweenAnimationBuilder(
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          child: Container(
                                            height: 150,
                                            width: 180,
                                            child: Image.asset(
                                              "assets/video.jpeg",
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10))),
                                          width: 180,
                                          padding: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 5),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Dunia ya warembo",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "kivule,",
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
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          tween: Tween(
                              begin: _index == index ? 1.0 : 0.8,
                              end: _index == index ? 1.0 : 0.8),
                          duration: Duration(milliseconds: 250),
                          builder: (context, double value, child) {
                            return Transform.scale(
                              scale: value,
                              child: child,
                            );
                          });
                    }),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CustomerServices()));
                                      },
                                      child: Container(
                                          width: 110,
                                          height: 110,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                offset:
                                                    Offset(0.0, 1.50), //(x,y)
                                                blurRadius: 4.0,
                                              ),
                                            ],
                                          ),
                                          child: Icon(
                                            Icons.miscellaneous_services,
                                            size: 70,
                                            color: Colors.black87,
                                          )),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      child: Text(
                                        "Services",
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // Navigator.of(context).push(
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             bookingCalender()));
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CallForAppoitment()));
                                      },
                                      child: Container(
                                          // width: 130,
                                          // height: 120,
                                          width: 110,
                                          height: 110,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                offset:
                                                    Offset(0.0, 1.50), //(x,y)
                                                blurRadius: 4.0,
                                              ),
                                            ],
                                          ),
                                          child: Icon(
                                            Icons.calendar_month_outlined,
                                            size: 70,
                                            color: Colors.black87,
                                          )),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      child: Text(
                                        "Appointment",
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Gallery()));
                                      },
                                      child: Container(
                                          width: 110,
                                          height: 110,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                offset:
                                                    Offset(0.0, 1.50), //(x,y)
                                                blurRadius: 4.0,
                                              ),
                                            ],
                                          ),
                                          child: Icon(
                                            Icons.collections_rounded,
                                            size: 70,
                                            color: Colors.black87,
                                          )),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      child: Text(
                                        "Gallery",
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Contacts()));
                                      },
                                      child: Container(
                                          width: 110,
                                          height: 110,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                offset:
                                                    Offset(0.0, 1.50), //(x,y)
                                                blurRadius: 4.0,
                                              ),
                                            ],
                                          ),
                                          child: Icon(
                                            Icons.call,
                                            size: 70,
                                            color: Colors.black,
                                          )),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      child: Text(
                                        "Contacts",
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 30, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                size: 24,
                color: Colors.white,
              )),
          //
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.notifications,
          //     size: 24,
          //     color: Colors.white,
          //   ),
          // )
        ],
      ),
    );
  }
}

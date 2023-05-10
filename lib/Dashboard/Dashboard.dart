import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../NormalCustomer pages/Homepage.dart';
import '../NormalCustomer pages/Nearby/googlemap.dart';
import '../NormalCustomer pages/UserAccount/UserAccount.dart';
import '../SalonOwner/SalonRegistration.dart';
import '../SignUp/SignUp.dart';
import 'SearchModel.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _index = 0;
  var _bottomNavigationKey;
  final int _activeindex = 0;
  PageController controller =
      PageController(initialPage: 0, viewportFraction: 1 / 2);

  // Creating a dump list of the salons
  static List<SalonNameListModel> mainSalonlist = [
    SalonNameListModel(
      "assets/video.jpeg",
      "Dunia ya warembo",
      "kivule",
      "dodoma",
    ),
    SalonNameListModel(
      "assets/video.jpeg",
      "Dunia ya vuma",
      "kivule",
      "dodoma",
    ),
    SalonNameListModel(
      "assets/video.jpeg",
      "Dunia ya mabati",
      "kivule",
      "dodoma",
    ),
    SalonNameListModel(
      "assets/video.jpeg",
      "Dunia ya kobe",
      "kivule",
      "dodoma",
    ),
    SalonNameListModel(
      "assets/video.jpeg",
      "sisiya warembo",
      "kivule",
      "dodoma",
    ),
    SalonNameListModel(
      "assets/video.jpeg",
      "Dunia ya warembo",
      "kivule",
      "dodoma",
    ),
    SalonNameListModel(
      "assets/video.jpeg",
      "B_classic ya warembo",
      "kivule",
      "dodoma",
    ),
    SalonNameListModel(
      "assets/video.jpeg",
      "Data ya warembo",
      "kivule",
      "dodoma",
    ),
    SalonNameListModel(
      "assets/video.jpeg",
      "Dunia ya warembo",
      "Kigamboni",
      "dodoma",
    ),
    SalonNameListModel(
      "assets/video.jpeg",
      "Dunia ya warembo",
      "kivule",
      "dodoma",
    ),
    SalonNameListModel(
      "assets/video.jpeg",
      "Dunia ya warembo",
      "kivule",
      "dodoma",
    ),
    SalonNameListModel(
      "assets/video.jpeg",
      "Dunia ya warembo",
      "kivule",
      "dodoma",
    ),
    SalonNameListModel(
      "assets/video.jpeg",
      "Dunia ya warembo",
      "kivule",
      "dodoma",
    ),
    SalonNameListModel(
      "assets/video.jpeg",
      "Dunia ya warembo",
      "kivule",
      "dodoma",
    ),
    SalonNameListModel(
      "assets/video.jpeg",
      "Dunia ya warembo",
      "kivule",
      "dodoma",
    ),
    SalonNameListModel(
      "assets/video.jpeg",
      "Dunia ya warembo",
      "kivule",
      "dodoma",
    ),
    SalonNameListModel(
      "assets/video.jpeg",
      "Dunia ya warembo",
      "kivule",
      "dodoma",
    ),
    SalonNameListModel(
      "assets/video.jpeg",
      "Dunia ya warembo",
      "kivule",
      "dodoma",
    ),
    SalonNameListModel(
      "assets/video.jpeg",
      "Dunia ya warembo",
      "kivule",
      "dodoma",
    ),
    SalonNameListModel(
      "assets/video.jpeg",
      "Dunia ya warembo",
      "kivule",
      "dodoma",
    ),
    SalonNameListModel(
      "assets/video.jpeg",
      "Dunia ya warembo",
      "kivule",
      "dodoma",
    ),
    SalonNameListModel(
      "assets/video.jpeg",
      "Dunia ya warembo",
      "kivule",
      "dodoma",
    ),
    SalonNameListModel(
      "assets/video.jpeg",
      "Dunia ya warembo",
      "kivule",
      "dodoma",
    ),
    SalonNameListModel(
      "assets/video.jpeg",
      "Dunia ya warembo",
      "kivule",
      "dodoma",
    )
  ];
  //Creating List that we are going to filter and display

  List<SalonNameListModel> display_list = List.from(mainSalonlist);

  void updateSearchList(String value) {
    setState(() {
      display_list = mainSalonlist
          .where((element) =>
              element.salon_name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });

    //here we filter the list of search

    // nw we display the searched list
  }

  @override
  Widget build(BuildContext coentext) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        color: Colors.white,
        buttonBackgroundColor: Color(0xffA76895),
        backgroundColor: Color(0xfff0f0f0),
        key: _bottomNavigationKey,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          // Icon(Icons.near_me, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          setState(() {
            switch (index) {
              case 0:
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Dashboard()));
                break;
              case 1:
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => NearBySalon()));

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => UserAccount()));

                break;
              // case 2:
              //   Navigator.of(context).push(
              //       MaterialPageRoute(builder: (context) => UserAccount()));
            }
          });
        },
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // centerTitle: true,
        // leading: Container(),
        elevation: 0,
        backgroundColor: Color(0xffA76895),
        title: Text(
          "Dashboard",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),

        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SalonRegistration()));
              },
              icon: Icon(
                Icons.add,
                size: 24,
                color: Colors.white,
              )),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: SafeArea(
        child: DefaultTabController(
          initialIndex: 0,
          length: 40,
          child: Container(
            color: Color(0xffF5F3F4),
            width: double.infinity,
            height: double.infinity,
            child: Expanded(
              child: Column(
                children: [
                  Container(
                    height: 220,
                    decoration: BoxDecoration(),
                    padding: EdgeInsets.only(
                      top: 15,
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
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
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10))),
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
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "kivule,",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff812727)),
                                                      ),
                                                      SizedBox(
                                                        width: 3,
                                                      ),
                                                      Text(
                                                        "Dodoma",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff812727)),
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
                  SizedBox(
                    height: 15,
                  ),

                  Container(
                    child: TextFormField(
                      onChanged: (value) => updateSearchList(value),
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
                  // ListofSalon()
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: display_list.length,
                        itemBuilder: (BuildContext contex, index) {
                          var displaysalonview;
                          return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SignUp()));
                                //
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (context) => HomePage()));
                              },
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: [
                                    ListTile(
                                      minVerticalPadding: 10,
                                      tileColor: Colors.yellow,
                                      leading: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.asset(
                                              display_list[index].salon_logo)),
                                      title: Text(
                                        display_list[index].salon_name,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      subtitle: Text(
                                        display_list[index].street,
                                        style:
                                            TextStyle(color: Color(0xff812727)),
                                      ),
                                    ),
                                    Divider(),
                                    Padding(padding: EdgeInsets.only(top: 1)),
                                  ],
                                ),
                              ));
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

// create future that fetch the images

  Future<SalonServices> fetchSalonServices() async {
    final response = await http.get(Uri.parse('get data from db'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return SalonServices.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load salon services');
    }
  }
}

class SalonServices {
  final String salon_name;
  final String street;
  final String city;
  final String service_style;
  final String salon_id;

  SalonServices(
      {required this.service_style,
      required this.salon_name,
      required this.street,
      required this.city,
      required this.salon_id});

  factory SalonServices.fromJson(Map<String, dynamic> json) {
    return SalonServices(
      service_style: json['service_style'],
      salon_id: json['salon_id'],
      street: json['street'],
      salon_name: json['salon_name'],
      city: json['city'],
    );
  }
}

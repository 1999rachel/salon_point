import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../Dashboard/Dashboard.dart';

import '../Nearby/googlemap.dart';
import '../UserAccount/UserAccount.dart';
import 'Cart.dart';
import 'Service_Model/Service_Model.dart';
import 'hair.dart';


class CustomerServices extends StatefulWidget {
  const CustomerServices({Key? key}) : super(key: key);

  @override
  State<CustomerServices> createState() => _CustomerServicesState();
}

class _CustomerServicesState extends State<CustomerServices> with TickerProviderStateMixin {


  late TabController _tabController;
  int _index = 0;
  final active_index = 0;
  var _bottomNavigationKey;

  //creating a dum list of services



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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => UserAccount()));
              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NearBySalon()));
                break;

              // case 2:
              //  Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => UserAccount()));
            }
          });
        },
      ),
      body: Container(
        color: Color(0xffF5F3F4),
        child: DefaultTabController(
          length: 5,
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
                      height: 125,
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(

                            top: 28,


                          ),

                          child: IconButton(onPressed: (){
                            Navigator.of(context).pop();

                          }, icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 24,
                          )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 80),
                      child: Container(
                        height: 110,
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.only(left: 20, right: 20,top: 5,bottom: 5),
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
                      margin: EdgeInsets.only(top: 40,bottom: 10),
                      child: Align(
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(color: Colors.white),
                            child: Image.asset(
                              "assets/video.jpeg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),


                    // SalonServices()
                  ],
                ),


                SalonServices()

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SalonServices extends StatelessWidget {

  const SalonServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(

            child: Column(
                children: [
              Container(
                padding: EdgeInsets.only(left: 20, right: 20,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Services",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Cart()));


                            },
                            icon: Icon(
                              Icons.add_shopping_cart,
                              size: 24,
                              color: Colors.black,
                            ),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xffFBFBFB)

                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 5,bottom: 8,left: 20,right: 20),
                  child: TabBar(
                    isScrollable: true,
                      indicator: BoxDecoration(
                          color: Color(0xffD8BDD0),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),

                      tabs: [
                        Text("hair ",textAlign: TextAlign.center,textDirection: TextDirection.ltr,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        Text("massage",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        Text("nails",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        Text("makeup",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        Text("mhahshghzd",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),

                      ]),
                ) ,
              ),
                  // SizedBox(height: 10,),

                  hair()










            ])));
  }
}


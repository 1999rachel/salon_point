import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';

import '../Booking/CallForAppoitnment/CallForAppointment.dart';
import '../Booking/bookingCalender.dart';

class MoreAboutService extends StatefulWidget {
  const MoreAboutService({Key? key}) : super(key: key);

  @override
  State<MoreAboutService> createState() => _MoreAboutServiceState();
}

class _MoreAboutServiceState extends State<MoreAboutService> {
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
          "More about services",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Color(0xffF5F3F4),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  // padding: EdgeInsets.only(left: 20,right: 20),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              // borderRadius: BorderRadius.all(Radius.circular(10))
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                          child: FullScreenWidget(
                            child: Image.asset(
                              "assets/video.jpeg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Text(
                                "Style",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Text(
                                "Twende Kilioni",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Text(
                                "Cost",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Text(
                                "12000 TzSh",
                                style: TextStyle(
                                    color: Color(0xff812727),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Text(
                                "Description",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                    color: Color(0xffF5F5F5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "hchczhvhjxvbbsjvsjhhahgxha",
                                      maxLines: 3,
                                    )

                                    //fix the text part to akllow limitation of lines
                                  ],
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(bottom: 20, right: 20, left: 20),
                        child: Container(
                          padding:
                              EdgeInsets.only(bottom: 20, left: 20, right: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Container(
                              color: Color(0xffA76895),
                              height: 45,
                              width: double.infinity,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CallForAppoitment()));
                                    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>bookingCalender()));
                                  },
                                  child: Text(
                                    "Appointment",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

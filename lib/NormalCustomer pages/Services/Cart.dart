import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import '../Booking/bookingCalender.dart';
import 'CustomerServices.dart';
import 'MoreAboutService.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

 final  number1 =0743209511;
 final  number2 =0743209511;

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color(0xffF5F3F4),
          child: Column(
            children: [
              Container(
                color: Color(0xffA76895),
                height: 80,
                width: double.infinity,
                padding: EdgeInsets.only(left: 20, right: 20,top: 20),
                child: Container(
                  alignment: Alignment.center,
                  // padding: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 15,
                          child: Icon(
                            Icons.arrow_back,
                            size: 24,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        "Cart",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    Container()
                    ],
                  ),
                ),
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
                          padding:
                              EdgeInsets.only(left: 20, right: 20, bottom: 10),
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MoreAboutService()));
                                  },
                                  child: Container(
                                    height: 105,
                                    width: 100,
                                    child: Image.asset(
                                      "assets/video.jpeg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: 20, bottom: 10, left: 15),
                                alignment: Alignment.topLeft,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        "2000 Tzsh",
                                        style: TextStyle(
                                            color: Color(0xff812727),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 55,
                                    )
                                  ],
                                ),
                              ),
                              Expanded(child: Container()),
                              IconButton(
                                  hoverColor: Colors.red,
                                  focusColor: Colors.red,
                                  disabledColor: Colors.black,
                                  splashColor: Colors.red,
                                  onPressed: () {
                                    // setState(() {
                                    //   controller.dispose();
                                    //   textEditingControllers.remove(controller);
                                    //   textformFields.removeWhere((w) => w.controller = controller));
                                    // });
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.black,
                                    size: 24,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  color: Color(0xffF6F6F6),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.only(right: 20, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Cost :",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "1200 TzSh",
                              style: TextStyle(
                                  color: Color(0xff812727),
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),

                      SizedBox(height: 30,),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("+255$number1"),
                                TextButton(onPressed: () async{
                                  await FlutterPhoneDirectCaller.callNumber("+255$number1");

                                }
                                    ,

                                    child:  Icon(Icons.call,color: Colors.green,size: 24,))
                              ],
                            ),
                            Divider(),

                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("+255$number2"),
                                TextButton(onPressed: () async{
                                  await FlutterPhoneDirectCaller.callNumber("+255$number2");

                                }, child:  Icon(Icons.call,color: Colors.green,size: 24,))
                              ],
                            )
                          ],
                        ),
                      )




                      //send service that are sellected


                      // Container(
                      //   padding: EdgeInsets.all(20),
                      //   child: Container(
                      //     height: 50,
                      //     width: double.infinity,
                      //     decoration: BoxDecoration(
                      //         color: Color(0xffA76895),
                      //         boxShadow: [
                      //           BoxShadow(
                      //             color: Colors.grey,
                      //             offset: Offset(0.0, 1.0), //(x,y)
                      //             blurRadius: 4.0,
                      //           ),
                      //         ],
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(10))),
                      //     child: TextButton(
                      //         onPressed: () {
                      //
                      //           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CustomerServices()));
                      //
                      //         },
                      //         child: Text(
                      //           "Submit",
                      //           style: TextStyle(
                      //               color: Colors.white,
                      //               fontSize: 18,
                      //               fontWeight: FontWeight.bold),
                      //         )),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

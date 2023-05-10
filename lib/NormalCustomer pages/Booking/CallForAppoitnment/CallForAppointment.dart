import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class CallForAppoitment extends StatefulWidget {
  @override
  State<CallForAppoitment> createState() => _CallForAppoitmentState();
}

class _CallForAppoitmentState extends State<CallForAppoitment> {
  final number1 = "743209511";
  final number2 = "743209511";

  late String service_image;
  late String service_style;
  var service_cost;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F3F4),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffA76895),
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
          "Book service",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Container(
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
                                  child: Container(
                                    height: 105,
                                    width: 100,
                                    child: Image.asset(
                                      "assets/video.jpeg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 20, bottom: 10, left: 15),
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                        );
                      })),
              Card(
                color: Colors.white,
                elevation: 5,

                // margin: EdgeInsets.only(top: 30,left: 30,bottom: 30),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, top: 15, bottom: 30),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Please call to make appoitment",
                        style: TextStyle(
                            color: Color(0xffA76895),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("+255$number1"),
                          TextButton(
                              onPressed: () async {
                                await FlutterPhoneDirectCaller.callNumber(
                                    "+255$number1");
                              },
                              child: Icon(
                                Icons.call,
                                color: Colors.green,
                                size: 24,
                              ))
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("+255$number2"),
                          TextButton(
                              onPressed: () async {
                                await FlutterPhoneDirectCaller.callNumber(
                                    "+255$number2");
                              },
                              child: Icon(
                                Icons.call,
                                color: Colors.green,
                                size: 24,
                              ))
                        ],
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



import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import '../Booking/CallForAppoitnment/CallForAppointment.dart';
import 'MoreAboutService.dart';
import 'Service_Model/Service_Model.dart';
class hair extends StatelessWidget {

  static List<Service_Model> ListOfServicesProvided=[
    Service_Model("assets/video.jpeg","20000", "Crochet"),
    Service_Model("assets/video.jpeg","1000", "Mbinjuo"),
    Service_Model("assets/video.jpeg","20000", "bobtwist"),
    Service_Model("assets/video.jpeg","20000", "Crochet"),
    Service_Model("assets/video.jpeg","20000", "mbinjuo"),
    Service_Model("assets/video.jpeg","20000", "Crochet"),
    Service_Model("assets/video.jpeg","20000", "mambo jambo"),
    Service_Model("assets/video.jpeg","20000", "Crochet"),
    Service_Model("assets/video.jpeg","1000", "Mbinjuo"),
    Service_Model("assets/video.jpeg","20000", "bobtwist"),
    Service_Model("assets/video.jpeg","20000", "Crochet"),
    Service_Model("assets/video.jpeg","20000", "mbinjuo"),
    Service_Model("assets/video.jpeg","20000", "Crochet"),
    Service_Model("assets/video.jpeg","20000", "mambo jambo"),
    Service_Model("assets/video.jpeg","20000", "Crochet"),
    Service_Model("assets/video.jpeg","20000", "Crochet"),
    Service_Model("assets/video.jpeg","20000", "Crochet"),
    Service_Model("assets/video.jpeg","20000", "Crochet"),
    Service_Model("assets/video.jpeg","20000", "Crochet"),
    Service_Model("assets/video.jpeg","20000", "Crochet"),
    Service_Model("assets/video.jpeg","20000", "Crochet"),
    Service_Model("assets/video.jpeg","20000", "Crochet"),
    Service_Model("assets/video.jpeg","20000", "Crochet"),
    Service_Model("assets/video.jpeg","20000", "Crochet"),
    Service_Model("assets/video.jpeg","20000", "Crochet"),
    Service_Model("assets/video.jpeg","20000", "Crochet")


  ];

  //creating a list that we are going to display

  List <Service_Model> DisplayService_LIst =List.from(ListOfServicesProvided);
  String Moneytype= "TzSh";



   hair({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: TabBarView(children: [
          ListView.builder(
              itemCount:DisplayService_LIst.length,
              itemBuilder: (context, index) {

                return SingleChildScrollView(

                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MoreAboutService()));

                      },
                      child: Container(
                        width: double.infinity,
                        color: Color(0xffFBFBFB),

                        // padding: EdgeInsets.only(top: 5,bottom: 5),
                         padding: EdgeInsets.only( bottom: 10),

                        child: Container(
                          color: Colors.white,

                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20,),
                          child: Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [


                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(


                                    height: 105,
                                    width: 100,

                                    child: FullScreenWidget(
                                      child: Image.asset(

                                        DisplayService_LIst[index].service_image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),


                                Container(
                                  // color: Colors.red,

                                   padding: EdgeInsets.only(top: 0, bottom: 20,left: 15),
                                  alignment: Alignment.topLeft,
                                 child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Container(
                                          child: Text(DisplayService_LIst[index].service_style,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),)
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(

                                        alignment: Alignment.topLeft,
                                        child: Text(DisplayService_LIst[index].service_cost,style: TextStyle(color: Color(0xff812727),fontWeight: FontWeight.w600),),


                                      ),
                                      SizedBox(
                                        height: 55,
                                      )

                                    ],
                                  ),



                                ),

                                Expanded(child: Container()),
                                Container(
                                  alignment: Alignment.bottomRight,
                                 margin: EdgeInsets.only(right: 20),

                                 child: Column(
                                   children: [
                                     Container(
                                       padding: EdgeInsets.only(top: 20),
                                       child: TextButton(
                                         onPressed: (){


                                         },
                                         child: CircleAvatar(
                                             backgroundColor: Colors.white,
                                             radius: 20,
                                           child: Icon(
                                               Icons.add_shopping_cart,
                                               size: 24,
                                               color: Colors.black,
                                             ),
                                           ),
                                       ),

                                       ),
                                     SizedBox(
                                       height: 25,
                                     ),
                                     TextButton(
                                       onPressed: (){

                                         // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>bookingCalender()));
                                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CallForAppoitment()));


                                       },
                                       child: Container(
                                         padding: EdgeInsets.only(bottom: 15,),
                                         child: ClipRRect(
                                           borderRadius: BorderRadius.all(Radius.circular(10)),
                                           child: Container(
                                             height: 30,
                                             alignment: Alignment.bottomRight,

                                             color: Color(0xffD8BDD0),
                                               child: Center(child: Container(
                                                 padding: EdgeInsets.only(left: 20,right: 20),
                                                 child: Text(textAlign: TextAlign.center,"Book",style: TextStyle(color: Colors.black,),)))

                                           ),
                                         ),
                                       ),
                                     ),
                                   ],
                                 )
                                  ),


                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                );


              }),
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
          )
        ]),
      ),
    );
  }
}

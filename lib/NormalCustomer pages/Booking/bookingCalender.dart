// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// // import 'package:syncfusion_flutter_calendar/calendar.dart';
// import '../../Dashboard/Dashboard.dart';
// import '../Nearby/googlemap.dart';
// import '../Services/CustomerServices.dart';
// import '../UserAccount/UserAccount.dart';
// class bookingCalender extends StatefulWidget {
//   const bookingCalender({Key? key}) : super(key: key);
//
//   @override
//   State<bookingCalender> createState() => _bookingCalenderState();
// }
//
// class _bookingCalenderState extends State<bookingCalender> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: Container(
//         color: Color(0xffF7F7F7),
//
//
//         child: Column(
//           children: [
//               Container(
//
//                 color: Color(0xffA76895),
//                 height: 80,
//                 child: Container(
//                   padding: EdgeInsets.only(left: 20,right: 20,top: 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       InkWell(
//                         onTap: (){
//
//                           Navigator.of(context).pop();
//                         },
//                         child: CircleAvatar(
//                           backgroundColor: Colors.white,
//                           radius: 15,
//                           child: Icon(Icons.arrow_back,size: 24,color: Colors.black,),
//                         ),
//                       ),
//
//                       Container(
//                         child: Text("Booking",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
//                       ),
//                       CircleAvatar(
//                         radius: 15,
//                         backgroundColor: Colors.white,
//                         child: Icon(Icons.add,size: 24,color: Colors.black,),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             Container(
//               child: SfCalendar(
//                 dataSource: MeetingDataSource(getAppointments()),
//                 view: CalendarView.week,
//                 todayHighlightColor: Colors.blue,
//                 firstDayOfWeek: DateTime.monday,
//                 // initialDisplayDate: DateTime(2023,01,13),
//                 // initialSelectedDate: DateTime(2023,01,13),
//
//
//               ),
//             ),
//
//
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.only(left: 20,right: 20),
//                 child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
//                 mainAxisSpacing: 6,crossAxisSpacing: 6,childAspectRatio:1/1), itemBuilder: (context,index){
//
//                   return ClipRRect(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     child: Container(
//                       width: double.maxFinite,
//                       height: 250,
//                       child: Column(     children: [
//
//                         Image.asset("assets/video.jpeg",height:120,width: double.infinity,fit: BoxFit.cover,),
//                         Container(
//                           height: 37,
//                           width: double.infinity,
//                           color: Colors.white54,
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 height: 2,
//                               ),
//                               Padding(padding: EdgeInsets.only(left: 10,right: 10),
//                                   child: Text(
//                                     "Hair style",style: TextStyle(color: Colors.black,),)),
//                               SizedBox(
//                                 height: 2,
//                               ),
//                               Text("0 TzSh",style: TextStyle(
//
//                                   color: Color(0xff812727)
//
//                               ),),
//                               SizedBox(
//                                 height: 1,
//                               ),
//
//                             ],
//                           ),
//                         )
//                       ],
//                       )
//                     ),
//                   ) ;
//                 }),
//               ),
//             ),
//      SizedBox(height: 30,),
//
//             Container(
//               margin: EdgeInsets.only(left: 20,right: 20),
//               height: 50,
//               width: double.infinity,
//
//               decoration: BoxDecoration(
//                   color: Color(0xffA76895),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey,
//                       offset: Offset(0.0, 1.0), //(x,y)
//                       blurRadius: 4.0,
//                     ),
//                   ],
//                   borderRadius: BorderRadius.all(Radius.circular(10))
//               ),
//               child: TextButton(
//                   onPressed: (){
//
//                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CustomerServices()));
//
//
//                   },
//                   child: Text("Book Appoitment",style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold
//                   ),)),
//             ),
//             SizedBox(
//               height: 20,
//             )
//
//
//
//
//
//           ],
//         ),
//       ),
//       );
//
//   }
// }
//
//  List<Appointment> getAppointments(){
//
//   List<Appointment> meetings=<Appointment>[];
//   final DateTime today = DateTime.now();
//   final DateTime startTime =
//   DateTime(today.year,today.month,today.day,9,0,0);
//   final DateTime endTime = startTime.add(Duration(hours: 2));
//
//   meetings.add(Appointment(
//     recurrenceRule: 'FREQ=DAILY;COUNT=10',
//
//     startTime: startTime,
//     endTime: endTime,
//     subject:" Salon service",
//     color: Color(0xffA76895),));
//
// return meetings;
//
//
//  }
// class MeetingDataSource extends CalendarDataSource{
//
//   MeetingDataSource (List<Appointment>source){
//
//     appointments = source;
//   }
//
// }
import 'package:flutter/material.dart';
import '../DeletAndAddService/HomePageAddAndDeleteServices.dart';

class BookedAppoitments extends StatefulWidget {
  String salon_id;
  final List<String> selectedServiceIds;
   BookedAppoitments({Key? key, required this.salon_id, required this.selectedServiceIds}) : super(key: key);

  @override
  State<BookedAppoitments> createState() => _BookedAppoitmentsState();
}

class _BookedAppoitmentsState extends State<BookedAppoitments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffF7F7F7),

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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ServiceEditDeleteHomePage(salon_id: widget.salon_id, selectedServiceIds: [],)));
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
                      "Booked Appoitments",
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

            Expanded(child:      ListView.builder(itemBuilder: (context,index){

              return Padding(
                padding: EdgeInsets.only(bottom: 0,top: 0),
                child: Column(
                  children: [
                    Divider(),
                    ListTile(
                      tileColor: Colors.blueGrey,
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(50),

                          child: Image.asset("assets/video.jpeg")),
                      title: Text("+255743209511",style: TextStyle(color: Colors.black),),
                      subtitle: Text("hair style",style: TextStyle(color: Color(0xff812727)),),
                      trailing: Wrap(
                        spacing: 12, // space between two icons
                        children: <Widget>[
                          Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffA76895),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              // margin: EdgeInsets.only(top: 5,bottom: 200,right: 10),
                              padding: EdgeInsets.only(left: 5,right: 5,top: 3,bottom: 3),
                              child:   Text("Accept",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)

                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffA76895),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              // margin: EdgeInsets.only(top: 5,bottom: 200,right: 10),
                              padding: EdgeInsets.only(left: 5,right: 5,top: 3,bottom: 3),
                              child:   Text("Denied",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)

                          ),
                        ],
                      ),

                    ),

                  ],
                ),
              );
            }))


          ],
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';

class NearBySalon extends StatefulWidget {
  const NearBySalon({Key? key}) : super(key: key);

  @override
  State<NearBySalon> createState() => _NearBySalonState();
}

class _NearBySalonState extends State<NearBySalon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        color: Color(0xffF5F3F4),
        child: Column(
          children: [ Container(
            color: Color(0xffA76895),
            height: 80,
            width: double.infinity,
            padding: EdgeInsets.only(left: 20,right: 20),

            child: Container(
              alignment: Alignment.center,
               padding: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
               InkWell(
                 onTap: (){
                   Navigator.of(context).pop();
                 },
                 child: CircleAvatar(
                   radius: 15,
                   backgroundColor: Colors.white,
                   child: Icon(Icons.arrow_back,size: 24,color: Colors.black,),
                 ),
               ),

                  Container(
                    child: Text("Near By Salon",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                  ),
                  Container()



                ],

              ),
            ),

          ),
          ],
        ),
      ),

    );
  }
}

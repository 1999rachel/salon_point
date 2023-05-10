import 'package:flutter/material.dart';

import 'SalonRegistration.dart';

class RegisteredSalon extends StatefulWidget {
  const RegisteredSalon({Key? key}) : super(key: key);

  @override
  State<RegisteredSalon> createState() => _RegisteredSalonState();
}

class _RegisteredSalonState extends State<RegisteredSalon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Color(0xffF5F3F4),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding:
              EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  InkWell(
                    onTap: (){

                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.arrow_back,size: 24,color: Colors.black,),
                    ),
                  ),
                  Text(
                    "Registered Salon",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),

                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SalonRegistration()));
                    },
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.add,size: 24,color: Colors.black,),
                    ),
                  ),
                ],
              ),
            ),

            // Container(
            //    height: 140,
            //    child: Image.asset("assets/line.png",fit: BoxFit.fitWidth,width: double.infinity,),
            //  ),


            SizedBox(
              height: 150,
            ),
            Expanded(
              child: Center(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: Container(
                    padding: EdgeInsets.only(top: 20),
                    child: ListView.separated(

                        itemCount: 10,
                        itemBuilder: (context,index){

                      return InkWell(
                        onTap: (){
                          
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>))
                        },
                        child: ListTile(
                          title: Text("Dunia ya warembo",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          subtitle: Row(
                            children: [
                              Text("kivule,",style: TextStyle(color: Color(0xff812727)),),
                              SizedBox(width: 2,),
                              Text("Dodoma",style: TextStyle(color: Color(0xff812727)),),

                            ],
                          ),

                          trailing:CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xffF7F7F7),
                            child: Icon(Icons.notifications_none_outlined,color: Colors.black,))),
                      );




                    }, separatorBuilder: (BuildContext context, int index) {

                          return Divider(
                            height: 20,
                            thickness: 1,
                          );
                    },),
                  ),

                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}

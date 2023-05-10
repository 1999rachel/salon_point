import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  final number1 ="743209511";
  final number2 ="743209511";

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
          "Contacts",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Container(
        color: Color(0xffF5F3F4),

        child:Column(
          children: [

            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                 padding: EdgeInsets.only(left: 10,right: 10),
                width: double.infinity,
                child: Card(
                  elevation: 3,
                  color: Color(0xffF6F6F6),
                  child: Column(
                    children: [


                      Container(
                        padding: EdgeInsets.only(left: 10),


                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(child: Text("Contact 1:",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),

                            Container(
                                color: Colors.white12,
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    TextSelectionTheme(
                                      data: TextSelectionThemeData(
                                          selectionColor: Colors.lightBlueAccent,
                                          selectionHandleColor: Colors.black
                                      ),


                                      child: SelectableText(
                                        "+255$number1",style: TextStyle(color: Colors.black),),
                                    ),
                                    TextButton(onPressed: ()async{
                                      await FlutterPhoneDirectCaller.callNumber("+255$number1");

                                    }, child: Icon(Icons.call,color: Colors.green,size: 24,)
                                    ) ],
                                ),
                            )
                          ],
                        ),
                      ),


                      Container(
                        padding: EdgeInsets.only(left: 10),


                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(child: Text("Contact 2:",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),

                            Container(
                              color: Colors.white12,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  TextSelectionTheme(
                                    data: TextSelectionThemeData(
                                        selectionColor: Colors.lightBlueAccent,
                                        selectionHandleColor: Colors.black
                                    ),


                                    child: SelectableText(
                                      "+255$number2",style: TextStyle(color: Colors.black),),
                                  ),
                                  TextButton(onPressed: ()async{
                                    await FlutterPhoneDirectCaller.callNumber("+255$number2");

                                  }, child: Icon(Icons.call,color: Colors.green,size: 24,)
                                  ) ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),


                    ],
                  ),
                ),
              ),
            )

          ],
        ) ,
      ),
    );
  }
}

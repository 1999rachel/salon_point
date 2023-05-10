import 'package:flutter/material.dart';

class Tutorial extends StatefulWidget {
  const Tutorial({Key? key}) : super(key: key);

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  PageController controller = PageController(
    viewportFraction: 0.85,
  );
  var currentPageValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:DefaultTabController(
        length: 5,
        initialIndex: 0,
        child: Column(
          children: [
            Container(
              height: 300,
              color: Colors.white12,
              width: double.infinity,
              child: PageView.builder(
                  controller: PageController(),
                  itemCount: 5,
                  itemBuilder: (context,position){
                    return Padding(padding: EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 270,
                            padding: EdgeInsets.only(top: 15,left: 10,right: 10,bottom: 15),
                            margin: EdgeInsets.only(left: 5,right: 5),

                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: 180,
                                        width: 200,
                                        child: Image.asset("assets/video.jpeg",width: double.infinity,height: double.infinity,fit: BoxFit.cover,),
                                      ),
                                      Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))

                                        ),
                                        width: 200,
                                        padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 5),
                                        child: Column(
                                          children: [
                                            Text("Dunia ya warembo",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text("kivule,",style: TextStyle(color: Color(0xff812727)),),
                                                SizedBox(width: 3,),
                                                Text("Dodoma",style: TextStyle(color: Color(0xff812727)),)

                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )

                                ],
                              ),
                            ),
                          ),
                        ),


                      ),


                    );

                  }),
            ),

          ],
        ),
      )


    );
  }
}


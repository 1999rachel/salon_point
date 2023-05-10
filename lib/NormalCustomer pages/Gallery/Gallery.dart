import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
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
          "Gallery",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
     body: Container(
       color: Color(0xffF5F3F4),

       child:SafeArea(
         child: Column(
           children: [
             SizedBox(height: 10,),
             Expanded(
               child: Container(
                 padding: EdgeInsets.only(left: 10,right: 10),
                 child: GridView.builder(
                   scrollDirection: Axis.vertical,
                     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                       maxCrossAxisExtent: 300,
                         childAspectRatio: 1/1,
                         crossAxisSpacing: 10,
                         mainAxisSpacing: 10,

                     ),
                     itemCount: 30,
                     itemBuilder: (context,index){
                       return ClipRRect(
                           borderRadius: BorderRadius.all(Radius.circular(10)),
                           child: FullScreenWidget(child: Container(child: Image.asset("assets/video.jpeg",fit: BoxFit.cover,),)));

                     }),
               ),
             ),

           ],
         ),
       ) ,
     ),

    );
  }
}

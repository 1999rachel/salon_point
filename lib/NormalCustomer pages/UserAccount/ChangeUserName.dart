

import 'package:flutter/material.dart';

import 'UserAccount.dart';

class ChangeUserName extends StatefulWidget {
  const ChangeUserName({Key? key}) : super(key: key);

  @override
  State<ChangeUserName> createState() => _ChangeUserNameState();
}

class _ChangeUserNameState extends State<ChangeUserName> {

  TextEditingController phonenumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: Container(

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
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.arrow_back,size: 24,color: Colors.black,),
                      ),
                    ),

                    Text(
                      "Change Username",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Container()
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
                    child: Flexible(
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            SizedBox(height: 50),


                            TextFormField(
                              controller: phonenumberController,
                              validator: (value){
                                if (value!.isEmpty){
                                  return 'Please enter phone number';
                                }
                                else if (value.length<10){
                                  return 'Please enter 10 digits for phone number';

                                }
                                return null;
                              },
                              cursorColor: Colors.black54,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(

                                  contentPadding:
                                  EdgeInsets.only(left: 20, right: 20,top: 10,bottom: 10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.black38, width: 0.5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5, color: Colors.black38),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 0.5, color: Color(0xA7689500)),
                                      borderRadius: BorderRadius.circular(10)),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.black54,
                                    size: 24,

                                  ),

                                  label: Text("Username"),
                                  labelStyle: TextStyle(
                                      color: Colors.black38
                                  ),

                                  hintText: "+255..",
                                  hintStyle: TextStyle(
                                      color: Colors.black
                                  )
                              ),
                            ),

                            SizedBox(
                              height: 20,
                            ),



                            Container(
                            //padding: EdgeInsets.only(bottom: 30),
                              height: 50,
                              width: double.infinity,

                              decoration: BoxDecoration(
                                  color: Color(0xffA76895),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 4.0,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: TextButton(

                                  onPressed: () {
                                    final isValidForm = formKey.currentState!.validate();
                                    if(isValidForm){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserAccount()));
                                    }

                                  },

                                  child: Text("Submit",style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),)),
                            ),


                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
      )
    );

  }
}

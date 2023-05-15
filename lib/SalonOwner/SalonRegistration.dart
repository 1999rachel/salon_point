import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utility/upper_case.dart';
import 'RegisteredSalon.dart';
import 'ServiceSelection/ServiceSelection.dart';

class SalonRegistration extends StatefulWidget {
  const SalonRegistration({Key? key}) : super(key: key);

  @override
  State<SalonRegistration> createState() => _SalonRegistrationState();
}

class _SalonRegistrationState extends State<SalonRegistration> {
  TextEditingController _salonphoneController = TextEditingController();
  TextEditingController _salonNameController = TextEditingController();

  TextEditingController _countryController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _streetnameController = TextEditingController();
  TextEditingController _phonenumberController = TextEditingController();
  bool dropButton = false;

  final _formKey = GlobalKey<FormState>();

  // final  salonRegistration = FirebaseFirestore.instance.collection("salons_db");
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF5F3F4),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              size: 24,
              color: Colors.black,
            )),
        title: Text(
          "Salon registration",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Container(
          color: Color(0xffF5F3F4),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
            Container(
            height: 180,
            child: Image.asset("assets/logo.png",fit: BoxFit.cover,),
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
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              SizedBox(height: 50),
                              TextFormField(
                                  // inputFormatters: <TextInputFormatter>[
                                  //   UpperCaseTextFormat()
                                  // ],
                                controller: _salonNameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your salon name';
                                  }
                                },
                                cursorColor: Colors.black54,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(

                                    contentPadding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.black38, width: 0.5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 0.5, color: Colors.black38),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 0.5,
                                            color: Color(0xA7689500)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.black54,
                                      size: 24,
                                    ),
                                    label: Text("Salon name"),
                                    labelStyle:
                                        TextStyle(color: Colors.black38),
                                    hintText: "Enter Your Salon Name",
                                    hintStyle: TextStyle(color: Colors.black54)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: _countryController,
                                cursorColor: Colors.black54,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your country name';
                                  }
                                },
                                decoration: InputDecoration(
                                    suffixIcon: InkWell(
                                        onTap: () {
                                          showCountryPicker(
                                            context: context,
                                            onSelect: (Country selectedCoutry) {
                                              _countryController.text =
                                                  selectedCoutry.name;
                                            },
                                          );
                                        },
                                        child: Icon(Icons.arrow_drop_down,
                                            color: dropButton
                                                ? Colors.black
                                                :Color(0xffA76895)

                                        )),
                                    contentPadding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.black38, width: 0.5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 0.5, color: Colors.black38),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 0.5,
                                            color: Color(0xA7689500)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    prefixIcon: Icon(
                                      Icons.location_on,
                                      color: Colors.black54,
                                      size: 24,
                                    ),
                                    label: Text("Country"),
                                    labelStyle:
                                        TextStyle(color: Colors.black38),
                                    hintText: "Select your country",
                                    hintStyle: TextStyle(
                                       color: Colors.black54

                                    )),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: _cityController,
                                cursorColor: Colors.black54,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your city name';
                                  }
                                },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.black38, width: 0.5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 0.5, color: Colors.black38),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 0.5,
                                            color: Color(0xA7689500)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    prefixIcon: Icon(
                                      Icons.location_city,
                                      color: Colors.black54,
                                      size: 24,
                                    ),
                                    label: Text("City"),
                                    labelStyle:
                                        TextStyle(color: Colors.black38),
                                    hintText: "Enter your city name",
                                    hintStyle: TextStyle(color: Colors.black54)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: _streetnameController,
                                cursorColor: Colors.black54,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your street name';
                                  }
                                },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.black38, width: 0.5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 0.5, color: Colors.black38),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 0.5,
                                            color: Color(0xA7689500)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    prefixIcon: Icon(
                                      Icons.streetview,
                                      color: Colors.black54,
                                      size: 24,
                                    ),
                                    label: Text("Street"),
                                    labelStyle:
                                        TextStyle(color: Colors.black38),
                                    hintText: "Enter your street name",
                                    hintStyle: TextStyle(color: Colors.black54)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: _phonenumberController,
                                cursorColor: Colors.black54,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your phone number';
                                  } else if (value.length < 10) {
                                    return 'Please enter 10 digits for phone number';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.black38, width: 0.5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 0.5, color: Colors.black38),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 0.5,
                                            color: Color(0xA7689500)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    prefixIcon: Icon(
                                      Icons.call,
                                      color: Colors.black54,
                                      size: 24,
                                    ),
                                    label: Text("Phone number"),
                                    labelStyle:
                                        TextStyle(color: Colors.black38),
                                    hintText: "Enter your Phone number",
                                    hintStyle: TextStyle(color: Colors.black54)),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: TextButton(
                                    onPressed: () {
                                      //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ServiceSelection()));

                                      if (_formKey.currentState!.validate()) {
                                        FirebaseFirestore.instance.collection('salon_db').doc(_salonNameController.text).set({
                                          "salon_name":_salonNameController.text,
                                          "country":_countryController.text,
                                          "city":_cityController.text,
                                          "street": _streetnameController.text,
                                          "postal_code": "",
                                        "latitude":"",
                                          "longitude": "",
                                        "social_media_account":"",
                                          "primary_phone_number": _phonenumberController.text,

                                        }).then((value) => Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) => ServiceSelection(salon_id: _salonNameController.text,)))
                                                    // ServiceSelection(salon_id: _salonNameController.text,)))

                                        );


                                      }
                                    },
                                    child: Text(
                                      "Register",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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

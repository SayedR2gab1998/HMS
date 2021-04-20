import 'package:flutter/material.dart';
import 'package:hms/functoins.dart';
import 'package:hms/navigationbar/profileedit.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF3F5F9),
        body: ListView(children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: Column(children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.9-5,
                    child: Column(
                        children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.2,
                          color: Color(0xff6574CF),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        child: Text('الملف الشخصي',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24
                                        ),
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                              icon: ImageIcon(AssetImage('assets/bell.png'),color: Colors.white,),
                                              onPressed: null,
                                            ),
                                            IconButton(
                                              icon: ImageIcon(AssetImage('assets/setting.png'),color: Colors.white,),
                                              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ProfileEdit()));},
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: MediaQuery.of(context).size.height*0.1,
                      left: MediaQuery.of(context).size.width*0.05,
                      child: Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      height: MediaQuery.of(context).size.height*0.77,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            spreadRadius: 3,
                            blurRadius: 25,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          buildprofile(
                            context: context,
                            title: 'مواعيدي',
                            image: 'assets/calender.png',
                          ),
                          Divider(),
                          buildprofile(
                            context: context,
                            title: 'أطبائي',
                            image: 'assets/profile.png',
                          ),
                          Divider(),
                          buildprofile(
                            context: context,
                            title: 'الدفع',
                            image: 'assets/credit.png',
                          ),
                          Divider(),
                          buildprofile(
                            context: context,
                            title: 'تقاريري الطبية',
                            image: 'assets/reports.png',
                          ),
                        ],
                      ),
                    ), 
                  ),
                ],
              ),
            ],),
          ),
        ],),
      ),
    );
  }
}
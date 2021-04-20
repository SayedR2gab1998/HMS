import 'package:flutter/material.dart';
import 'package:hms/profile/ChangePass.dart';
import 'package:hms/profile/ChangePhone.dart';
import 'package:hms/profile/ChangeUserName.dart';
import 'package:hms/services/authservices.dart';


class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final Authservices _auth = Authservices(); 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
            child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.08,
                    color: Color(0xff6574CF),
                    child: Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                      IconButton(
                        iconSize: 26,
                        icon: Icon(Icons.arrow_back,color: Colors.white,),
                        onPressed: (){Navigator.pop(context);}
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                      Text('إعدادات الملف الشخصي',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.09,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangeUserName()));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.5,
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(children: [
                                      Text('الإسم',
                                      style: TextStyle(
                                        color: Color(0xffB3C1DC),
                                        fontSize: 18
                                      ),
                                      ),
                                    ],),
                                  ),
                                  Row(children: [
                                    Container(
                                      child: Text('اسم المستخدم',
                                      style: TextStyle(
                                        color: Color(0xff4E70B5),
                                        fontSize: 20
                                        ),
                                      )
                                    )
                                  ],),
                                  Row(children: [
                                    Container(
                                      child: Text('يكون هذا الإسم ظاهرا لكل المستخدمين',
                                      style: TextStyle(
                                        color: Color(0xffB3C1DC),
                                        fontSize: 16
                                      ),
                                      )),
                                  ],),
                                ],
                              ),
                            ),
                          ),
                          Icon(Icons.edit,color: Color(0xff8F9BB3),),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePhone()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.07,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.5,
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(children: [
                                      Text('رقم الهاتف',
                                      style: TextStyle(
                                        color: Color(0xffB3C1DC),
                                        fontSize: 18
                                      ),
                                      ),
                                    ],),
                                  ),
                                  Row(children: [
                                    Container(
                                      child: Text('رقم الهاتف',
                                      style: TextStyle(
                                        color: Color(0xff4E70B5),
                                        fontSize: 20
                                      ),
                                      ))
                                  ],),
                                ],
                              ),
                            ),
                            Icon(Icons.edit,color: Color(0xff8F9BB3),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword()));
                    },
                                      child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.07,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.5,
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(children: [
                                      Text('كلمة المرور',
                                      style: TextStyle(
                                        color: Color(0xffB3C1DC),
                                        fontSize: 18
                                      ),
                                      ),
                                    ],),
                                  ),
                                  Row(children: [
                                    Container(
                                      child: Text('كلمة المرور',
                                      style: TextStyle(
                                        color: Color(0xff4E70B5),
                                        fontSize: 20
                                      ),
                                      ))
                                  ],),
                                ],
                              ),
                            ),
                            Icon(Icons.edit,color: Color(0xff8F9BB3),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.04,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          Text('الدعم والمساعدة',
                          style: TextStyle(
                            color: Color(0xffB3C1DC),
                            fontSize: 18
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.03,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){
                              showDialog(context: context,
                                  builder: (BuildContext context){
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(15.0))
                                      ),
                                      content: Container(
                                        height: MediaQuery.of(context).size.height*0.4,
                                        child: Column(
                                          children: [
                                            SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                                            Image.asset('assets/Logout.png'),
                                            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                            Text('تسجيل الخروج؟',
                                            style: TextStyle(
                                              color: Color(0xff6978D4),
                                              fontSize: 24,
                                            ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 40),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width/1.5,
                                            height: MediaQuery.of(context).size.height/17,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.0),
                                              color: Color(0xff6978D4),
                                            ),
                                            child: TextButton(
                                              onPressed:()async{
                                                await _auth.signOut();
                                              },
                                              child: Text('تسجيل الخروج',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18
                                              ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 40),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width/1.5,
                                            height: MediaQuery.of(context).size.height/17,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.0),
                                              color: Color(0xffF3F4FB),
                                              border: Border.all(color: Color(0xff6574CF)),
                                            ),
                                            child: TextButton(
                                              onPressed: (){Navigator.pop(context);},
                                              child: Text('إلغاء',
                                              style: TextStyle(
                                                color: Color(0xff6574CF),
                                                fontSize: 18
                                              ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                );
                            },
                            child: Text('تسجيل الخروج',
                              style: TextStyle(
                                color: Color(0xffDF0D30),
                                fontSize: 18
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
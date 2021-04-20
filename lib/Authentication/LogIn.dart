import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hms/Authentication/SignUp.dart';

import 'package:hms/functoins.dart';
import 'package:hms/navigationbar/mainpage.dart';
import 'package:hms/password/RecoverPass.dart';
import 'package:hms/services/authservices.dart';
import 'package:hms/shared/loading.dart';



class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  final Authservices _auth = Authservices();
  bool loading = false;
  String _email = '';
  String _password= '';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : SafeArea(
      child: Scaffold(
        body: ListView(children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                Stack(
                children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.95,
                    child: Column(
                      children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height*0.31,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/header.png'),
                                fit: BoxFit.cover,
                              ), 
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 50.0),
                              child: Container(
                                child:Column(
                                  children: [
                                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                    Row(
                                      children: [
                                        Image.asset('assets/logo2.png',),
                                      ],
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                                    Row(
                                      children: [
                                        Text('تسجيل الدخول',
                                          style:TextStyle(color: Colors.white,fontSize: 22,
                                          fontWeight: FontWeight.w600,),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height*0.001,),
                                    Row(
                                      children: [
                                        Text('أدخل البيانات الآتية من فضلك',
                                          style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ),
                      ],
                    ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height*0.26,
                  right: MediaQuery.of(context).size.width*0.08,
                  child: Container(
                  width: MediaQuery.of(context).size.width*0.85,
                  height: MediaQuery.of(context).size.height*0.65,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(children: [
                        SizedBox(height: MediaQuery.of(context).size.height*0.003,),
                        buildTextFormField(
                          title: 'الرقم القومي',
                          context: context,
                          obsecure: false,
                          validation:(val) => val.isEmpty ? 'أدخل الرقم القومي ' : null,
                          onchange: (value){
                            setState(() {
                              _email = value;
                            });
                          }
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.005,),
                        buildTextFormField(
                          title: 'كلمة المرور',
                          context: context,
                          obsecure: true,
                           validation:(val) => val.length < 6 ? ' كلمة المرور ضعيفة' : null,
                          onchange: (value){
                            setState(() {
                              _password = value;
                            });
                          }
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        InkWell(
                          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>RecoverPassword()));},
                          child: Text('نسيت كلمة المرور؟',
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xff6574CF),
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.25,),
                        Container(
                          width: MediaQuery.of(context).size.width*0.7,
                          height: MediaQuery.of(context).size.height*0.06,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xff6574CF),
                            ),
                            onPressed: ()async{
                              if(_formKey.currentState.validate()){
                                setState(() {
                                  loading= true;
                                });
                                dynamic result = await _auth.sginInWithEmailAndPassword(_email, _password);
                                if(result == null) {
                                  setState(() {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('برجاء إدخال الرقم القومي صحيح')));
                                    loading =false;
                                  });
                                }
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
                              }
                            },
                            child:Text('تسجيل الدخول',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                            ),
                          ),
                        ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                          RichText(
                            text: TextSpan(
                            text: 'ليس لديك حساب؟ ',
                            style: TextStyle(
                              fontSize: 17,
                              color: Color(0xff8F9BB3),
                            ),
                            children: <TextSpan>[
                              TextSpan(text: 'إنشاء حساب',
                                recognizer: new TapGestureRecognizer()..onTap = () =>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SignUp())),
                                style: TextStyle(
                                  color: Color(0xff6574CF).withOpacity(0.8),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],),
                          )
                        ],),
                    ),
                    ),
                  ), 
                ),
              ],),
            ],),
          ),
        ],),
      ),
    );
  }
}

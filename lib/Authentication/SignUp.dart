import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hms/Authentication/LogIn.dart';

import 'package:hms/functoins.dart';
import 'package:hms/services/authservices.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final Authservices _auth = Authservices();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FirebaseAuth instance = FirebaseAuth.instance;
  String _email = '';
  String _password= '';
  int selectedOne=0;
  Widget _buildkind({String kind,int index,bool isSelected}) {
    return InkWell(
      onTap: (){
        setState(() {
          isSelected  =true;
          selectedOne = index;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width/5.5,
        child: Row(
          children: <Widget>[
             Radio(
              value: index,
              groupValue: selectedOne,
              onChanged: (s){
                setState(() {
                  isSelected  =true;
                  selectedOne = index;
                });
              }),
            Text(
              kind,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: Column(children: [
            Stack(
              children: [
               Container(
                 width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*.95,
                  child: Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(0.0),
                         child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*.31,
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
                                  SizedBox(height: MediaQuery.of(context).size.height*.05,),
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
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              buildTextFormField(
                                controller: _usernameController,
                                title: 'إسم المستخدم',
                                keyboadtype: TextInputType.text,
                                context: context,
                                obsecure: false,
                                validation:(val) => val.isEmpty ? 'أدخل إسم المستخدم ' : null,
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                              buildTextFormField(
                                controller: _emailController,
                                title: 'الإيميل الإلكتروني',
                                keyboadtype: TextInputType.emailAddress,
                                context: context,
                                obsecure: false,
                                validation:(val) => val.isEmpty ? 'أدخل الإيميل الإلكتروني ' : null,
                                onchange: (val){
                                  setState(() {
                                    _email = val;
                                  });
                                }
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                              buildTextFormField(
                                title: 'الرقم القومي',
                                keyboadtype: TextInputType.number,
                                context: context,
                                obsecure: false,
                                validation:(val) => val.isEmpty ? 'أدخل الرقم القومي ' : null,
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                              buildTextFormField(
                                controller: _phoneController,
                                title: 'رقم الهاتف',
                                keyboadtype: TextInputType.number,
                                context: context,
                                obsecure: false,
                                validation:(val) => val.isEmpty ? 'أدخل ؤقم الهاتف ' : null,
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                              buildTextFormField(
                                controller: _passwordController,
                                title: 'كلمة المرور',
                                context: context,
                                obsecure: true,
                                validation:(val) => val.length < 6 ? ' كلمة المرور ضعيفة' : null,
                                keyboadtype: TextInputType.visiblePassword,
                                onchange: (val){
                                  setState(() {
                                    _password = val;
                                  });
                                }
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                              Container(
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Text('العمر',
                                        style:TextStyle(color: Color(0xff6574CF),fontSize: 22,
                                        fontWeight: FontWeight.w600,),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.72,
                                        height: MediaQuery.of(context).size.height*0.06,
                                        decoration: BoxDecoration(
                                          color: Color(0xff6574CF).withOpacity(0.05),
                                          border: Border.all(color:Color(0xffB3C1DC).withOpacity(0.5)),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                          child: TextFormField(
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              hintText: 'العمر',
                                              border: InputBorder.none,
                                              suffixText: 'سنة',
                                              suffixStyle: TextStyle(color: Colors.black,fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                  Row(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.72,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text('الجنس',
                                                  style:TextStyle(color: Color(0xff6574CF),fontSize: 22,
                                                  fontWeight: FontWeight.w600,),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                _buildkind(
                                                  kind: 'ذكر',
                                                  isSelected: false,
                                                  index: 1,
                                                ),
                                                _buildkind(
                                                  kind: 'أنثي',
                                                  isSelected: false,
                                                  index: 2,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                                  Container(
                                    width: MediaQuery.of(context).size.width*0.7,
                                    height: MediaQuery.of(context).size.height*0.06,
                                    color: Color(0xff6574CF),
                                    child: TextButton(
                                      onPressed: () async {
                                        if(_formKey.currentState.validate()){
                                          dynamic result = await _auth.registerWithEmailAndPassword(_email, _password);
                                          if(result == null) {
                                            setState(() {
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('برجاء إدخال الرقم القومي صحيح')));
                                            });
                                          }
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تم التسجيل بنجاح')));
                                          _usernameController.clear();
                                          _emailController.clear();
                                          _phoneController.clear();
                                          _passwordController.clear();
                                          
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LogIn()));
                                        }
                                      },
                                      child: Text('إنشاء حساب',style: TextStyle(
                                        color: Colors.white,
                                      ),),
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                  RichText(
                                    text: TextSpan(
                                      text: 'تمتلك حساب بالفعل؟ ',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Color(0xff4E70B4).withOpacity(0.6)
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(text: 'تسجيل الدخول',
                                        recognizer: new TapGestureRecognizer()..onTap = () =>Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>LogIn())),
                                        style: TextStyle(
                                          color: Color(0xff6574CF),
                                          fontWeight: FontWeight.w600,
                                        )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                ],),
                              ),
                            ],
                          ),
                        ),
                      ),
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
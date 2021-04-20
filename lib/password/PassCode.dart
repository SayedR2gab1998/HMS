import 'package:flutter/material.dart';
import 'package:hms/password/NewPass.dart';


class PassCode extends StatefulWidget {
  @override
  _PassCodeState createState() => _PassCodeState();
}

class _PassCodeState extends State<PassCode> {
  Widget _buildTextFormField({String title,}){
    return Column(
      children: [
        Row(
          children: [
            Text(title,
              style:TextStyle(color: Color(0xff4E70E5),fontSize: 22,
              fontWeight: FontWeight.w600,),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height/250,),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width/1.4,
              height: MediaQuery.of(context).size.height/17,
              decoration: BoxDecoration(
                color: Color(0xffB3C1DC).withOpacity(0.05),
                border: Border.all(color:Color(0xffB3C1DC).withOpacity(0.5)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    hintText: title,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SafeArea(
      child: Scaffold(
        body: ListView(children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: Column(children: [
            Stack(
              children: [
               Container(
                 width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/1.05,
                  child: Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(0.0),
                         child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/3.3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/header.png'),
                              fit: BoxFit.cover,
                            ), 
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Container(
                              child:Column(
                                children: [
                                  SizedBox(height: MediaQuery.of(context).size.height/60,),
                                  Row(
                                    children: [
                                      IconButton(icon: Icon(Icons.arrow_back), color: Colors.white,iconSize: 30,onPressed: (){Navigator.pop(context);},),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 20.0),
                                        child: Image.asset('assets/logo2.png',),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height/210,),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Row(
                                      children: [
                                        Text('أدخل الرقم السري',
                                          style:TextStyle(color: Colors.white,fontSize: 22,
                                          fontWeight: FontWeight.w600,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height/210,),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Row(
                                      children: [
                                        Text('تم إرسال الرقم السري إلي هاتفك',
                                          style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),),
                                      ],
                                    ),
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
                    top: 230,
                    left: 35,
                    child: Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: MediaQuery.of(context).size.height/1.5,
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
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(children: [
                        SizedBox(height: MediaQuery.of(context).size.height/85,),
                        _buildTextFormField(title: 'الرقم السري'),
                      SizedBox(height: MediaQuery.of(context).size.height/2.5,),
                      InkWell(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>NewPass()));},
                          child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/17,
                          decoration: BoxDecoration(
                            color: Color(0xff6978D4),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Center(child: Text('إستمرار',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                            ),
                          )),
                        ),
                      ),
                        SizedBox(height: MediaQuery.of(context).size.height/65,),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/17,
                          decoration: BoxDecoration(
                            color: Color(0xffF6F8FB),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color:Color(0xff4E70B5)),
                          ),
                          child: Center(child: Text('إعاده الإرسال',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff4E70B5),
                            ),
                          )),
                        ),
                      ],),
                    ),
                  ), 
                ),
              ],
            ),
        ],),
          ),
        ],),
      ),
      ),
    );
  }
}
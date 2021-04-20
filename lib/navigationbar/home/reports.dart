import 'package:flutter/material.dart';
import 'package:hms/functoins.dart';

class Medicalreports extends StatefulWidget {
  @override
  _MedicalreportsState createState() => _MedicalreportsState();
}

class _MedicalreportsState extends State<Medicalreports> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF3F5F9),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          width: MediaQuery.of(context).size.width*0.9,
          child: FloatingActionButton.extended(
            backgroundColor: Color(0xff6574CF),
            elevation: 0.0,
            onPressed: null,
            label: Text('رفع ملف جديد',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.1,
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
                    Text('التقارير الطبية',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              buildreports(
                context: context,
                reportname: 'نوع التحليل',
                date: 'التاريخ',
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              buildreports(
                context: context,
                reportname: 'نوع التحليل',
                date: 'التاريخ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
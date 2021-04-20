import 'package:flutter/material.dart';
import 'package:hms/functoins.dart';
import 'package:hms/navigationbar/home/reports.dart';

class Homenav extends StatefulWidget {
  @override
  _HomenavState createState() => _HomenavState();
}

class _HomenavState extends State<Homenav> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF3F5F9),
        body: ListView(
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.2,
                    color: Color(0xff6574CF),
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                        Text('الرئيسية',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                        Container(
                          width: MediaQuery.of(context).size.width*0.9,
                          height: MediaQuery.of(context).size.height*0.06,
                          decoration: BoxDecoration(
                            color: Color(0xff7091D3),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 0.5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              style: TextStyle(color: Colors.white,fontSize: 20),
                              decoration: InputDecoration(
                                hintText: 'ابحث',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                border: InputBorder.none,
                                suffixIcon: Icon(Icons.search,color: Colors.white,),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                      buildcontainers(
                        context: context,
                        image: 'assets/clinic.png',
                        clinic: 'العيادات',
                        description: 'وتضم جميع التخصصات الطبية ',
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                      buildcontainers(
                        context: context,
                        image: 'assets/doctors.png',
                        clinic: 'الأطباء',
                        description: 'تضم أكثر الأطباء تميزا في جميع التخصصات',
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                      buildcontainers(
                        context: context,
                        image: 'assets/analyzing.png',
                        clinic: 'التقارير الطبية',
                        description: 'تضم جميع التحاليل التي قام بها المريض',
                        screen: Medicalreports(),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                      buildcontainers(
                        context: context,
                        image: 'assets/medicine.png',
                        clinic: 'الصيدلية',
                        description: 'تضم جميع الروشتات التي تم صرفها',
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                      buildcontainers(
                        context: context,
                        image: 'assets/article.png',
                        clinic: 'حجز عياده',
                        description: 'تسهيل الحجز بدون تاخير',
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                      buildcontainers(
                        context: context,
                        image: 'assets/appointment.png',
                        clinic: 'التوعية الصحية',
                        description: 'تضم جميع التحاليل التي قام بها المريض',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hms/Authentication/LogIn.dart';
import 'package:hms/navigationbar/appointment.dart';
import 'package:hms/navigationbar/doctors.dart';
import 'package:hms/navigationbar/home/home.dart';
import 'package:hms/navigationbar/medicine.dart';
import 'package:hms/navigationbar/profile.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  FirebaseAuth instance = FirebaseAuth.instance;
  @override
  void initState(){
    super.initState();
    instance.authStateChanges().listen((User user) {
      if(user == null)
        {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LogIn()));
        }
      else{

      }
    });
  }
  int _currentindex= 4;
  final tabs= [
    Profile(),
    Appointment(),
    Doctors(),
    Medicine(),
    Homenav(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentindex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          unselectedItemColor: Color(0xffC5CEE0),
          selectedItemColor: Color(0xff7494D4),
          onTap: (index){
            setState(() {
              _currentindex = index;
            });
          },
          
          items: [
            BottomNavigationBarItem(
              label:'',
              icon: ImageIcon(AssetImage('assets/profile.png'))
            ),
            BottomNavigationBarItem(
              label: '',
              icon:ImageIcon(AssetImage('assets/appointment.png'))
            ),
            BottomNavigationBarItem(
              label: '',
              icon: ImageIcon(AssetImage('assets/doctor.png'))
            ),
            BottomNavigationBarItem(
              label: '',
              icon: ImageIcon(AssetImage('assets/medicine.png'))
            ),
            BottomNavigationBarItem(
              label: '',
              icon: ImageIcon(AssetImage('assets/home.png'))
            ),
          ],
        ),
        body: tabs[_currentindex],
      ),
      
    );
  }
}
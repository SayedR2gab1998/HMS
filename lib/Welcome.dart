import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:hms/Authentication/LogIn.dart';
import 'package:provider/provider.dart';



class Onboard extends StatefulWidget {
  @override
  _OnboardState createState() => _OnboardState();
}


class _OnboardState extends State<Onboard> {
  @override
  Widget build(BuildContext context) {
    var pageController= _pageController;
    return Directionality(
      textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Scaffold(
            body: OnBoard(
                onBoardData: onBoardData,
                pageController: pageController,
                onSkip: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>LogIn()));
              },
              onDone: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>LogIn()));
              },
              titleStyles: TextStyle(
                color: Color(0xff6D7BD1),
                fontSize: 20,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.15,
              ),
              descriptionStyles: TextStyle(
                fontSize: 16,
                color: Color(0xff8F9BB3),
              ),
              pageIndicatorStyle: PageIndicatorStyle(
                width: 100,
                inactiveColor: Color(0xff6574CF),
                activeColor: Color(0xff6574CF),
                inactiveSize: Size(8, 8),
                activeSize: Size(12, 12),
              ),
              skipButton: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>LogIn()));
                },
                child: Text("تخطي",style: TextStyle(color: Color(0xff6574CF)),),
              ),
              nextButton: Consumer<OnBoardState>(
                builder: (BuildContext context, OnBoardState state, Widget child) {
                  return InkWell(
                    onTap: () => _onNextTap(state,context),
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.9,
                      height: MediaQuery.of(context).size.height/17,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff6574CF),
                      ),
                      child: Text(
                        state.isLastPage ? "إنهاء" : "التالي",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        )
    );
  }
}
final List<OnBoardModel> onBoardData = [
    OnBoardModel(
      imgUrl: "assets/grid2.png",
      title: "مرحبا بك",
      description:
      "يمكنك الآن كتابة الاعراض التي تعاني منها وسيقوم نظامنا الذكي بترشيح انسب العيادات وتوفير مكان في معاد محدد"
    ),
     OnBoardModel(
      imgUrl: 'assets/grid1.png',
      title: "الطاقم الطبي",
      description:
          "ذو كفاءة عالية في جميع التخصصات",
    ),
    OnBoardModel(
       imgUrl: 'assets/grid3.png',
      title: "وسائل الكشف",
      description:
          "الكشف بأحدث الأدهزة الطبية والتكنولوجيا العالية",
    ),
  ];
final PageController _pageController = PageController();

 void _onNextTap(OnBoardState onBoardState, BuildContext context) {
  if (!onBoardState.isLastPage) {
    _pageController.animateToPage(
      onBoardState.page + 1,
      duration: Duration(milliseconds: 250),
      curve: Curves.easeInOutSine,
    );
  } else {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>LogIn()));
  }
}


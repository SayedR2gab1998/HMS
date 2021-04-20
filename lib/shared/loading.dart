import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SpinKitChasingDots(
        color: Color(0xff6574CF),
        size: 50,
      ),
    );
  }
}
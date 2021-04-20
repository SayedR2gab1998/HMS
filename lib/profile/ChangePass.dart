import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _obscureText = true; 
  bool rememberMe = false;
  void _onRememberMeChanged(bool newValue) => setState(() {
    rememberMe = newValue;
    setState(() {
      _toggle();
    });
  });
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
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
              width: MediaQuery.of(context).size.width/1.166,
              height: MediaQuery.of(context).size.height/17,
              decoration: BoxDecoration(
                color: Color(0xffB3C1DC).withOpacity(0.05),
                border: Border.all(color:Color(0xffB3C1DC).withOpacity(0.5)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  obscureText: _obscureText,
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
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          width: MediaQuery.of(context).size.width*0.9,
          child: FloatingActionButton.extended(
            backgroundColor: Color(0xff6574CF),
            elevation: 0.0,
            onPressed: (){
              showDialog(context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))
                    ),
                    content: Container(
                      height: MediaQuery.of(context).size.height*0.3,
                      child: Column(
                        children: [
                          Image.asset('assets/check.png'),
                          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                          Text('تم تغيير كلمة المرور',
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
                            onPressed: (){Navigator.pop(context);},
                            child: Text('حسنا',
                            style: TextStyle(
                              color: Colors.white,
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
            label: Text('التأكيد',
            style: TextStyle(
              fontSize: 22,
            ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: Column(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/13,
                  color: Color(0xff6574CF),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                          iconSize: 25,
                          onPressed: (){Navigator.pop(context);},
                          ),
                          Text('تغيير كلمة المرور ', 
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        _buildTextFormField(title: 'كلمة المرور القديمة'),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        _buildTextFormField(title: 'كلمة المرور الجديدة'),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        _buildTextFormField(title: 'تأكيد كلمة المرور'),
                        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                        Row(
                          children: [
                            Checkbox(
                              value: rememberMe,
                              onChanged: (val){_onRememberMeChanged(val);},
                            ),
                            Text('إظهار كلمة المرور')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
// build textformfield with keyboard
Widget buildTextFormField({
  TextEditingController controller,
  Function onchange,
  Function validation,
  String title,
  TextInputType keyboadtype,
  bool obsecure,
  BuildContext context,
  })
{
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
      SizedBox(height: MediaQuery.of(context).size.height*0.005,),
      Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*.72,
            height: MediaQuery.of(context).size.height*0.06,
            decoration: BoxDecoration(
              color: Color(0xffB3C1DC).withOpacity(0.05),
              border: Border.all(color:Color(0xffB3C1DC).withOpacity(0.5)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                validator: validation,
                controller: controller,
                obscureText: obsecure,
                keyboardType: keyboadtype,
                onChanged: onchange,
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
// build row in profile in navbar page
Widget buildprofile({String image,String title,BuildContext context}){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height*0.08,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.1,
                  height: MediaQuery.of(context).size.height*0.05,
                  decoration: BoxDecoration(
                    color: Color(0xff6574CF).withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(child: ImageIcon(AssetImage(image),color: Color(0xff6574CF),)),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                Text(title,
                style: TextStyle(
                  color: Color(0xff4E70B5),
                  fontSize: 18,
                ),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios,color: Color(0xff8F9BB3),),
        ],
      ),
    ),
  );
}



// build containers in home in navbar page

Widget buildcontainers({String clinic,String description,String image,BuildContext context,Widget screen}){
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>screen));
    },
    child: Container(
      width: MediaQuery.of(context).size.width*0.43,
      height: MediaQuery.of(context).size.height*0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.1,
                  height: MediaQuery.of(context).size.height*0.05,
                  decoration: BoxDecoration(
                    color: Color(0xff6574CF).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(100),
                  ),
                 child: Center(child: ImageIcon(AssetImage(image),color: Colors.white,)),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(clinic,
                style: TextStyle(
                  color: Color(0xff13366B),
                  fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.32,
                  child: Text(description,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}


// build containers in reports page
Widget buildreports({
  String reportname,
  String date,
  BuildContext context}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      height: MediaQuery.of(context).size.height*0.17,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
      ),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.11,
                          height: MediaQuery.of(context).size.height*0.05,
                          decoration: BoxDecoration(
                            color: Color(0xff6574Cf).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ImageIcon(AssetImage('assets/reports.png'),color: Color(0xff6574CF),),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                        Text(reportname,style: TextStyle(
                          color: Color(0xff6574CF),
                          fontSize: 20,
                        ),),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.download_sharp,color: Colors.grey,),
                          onPressed: null,
                        ),
                        PopupMenuButton(
                          icon: Icon(Icons.more_vert,color: Colors.grey,),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0))
                          ),
                          elevation: 5.0,
                          itemBuilder: (BuildContext context){
                            return Constants.Choices.map((String choices) {
                              return PopupMenuItem(
                                child: Text(choices),
                                value: choices,
                              );
                            }).toList();
                          }
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.35,
                    child: Center(
                      child: Text(reportname,style: TextStyle(
                        color: Color(0xff6574CF),
                        fontSize: 20,
                      ),),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.05,
                    child: VerticalDivider(color: Colors.grey,width: 20,)),
                  Container(
                     width: MediaQuery.of(context).size.width*0.35,
                     child: Center(
                       child: Text(date,style: TextStyle(
                          color: Color(0xff6574CF),
                          fontSize: 20,
                        ),),
                     ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
class Constants{
  static const String delete = 'Delete';
  static const String share = 'Share'; 
  static const List<String>Choices = <String>[
    delete,
    share,
  ];
}

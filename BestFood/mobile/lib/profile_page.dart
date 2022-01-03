import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String url="http://192.168.1.7:3000/user/profile";
String firstName="",lastName="",email='',phone="";
  getUserInfo()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token='jwt '+sharedPreferences.get('token');
    var res = await http.get(url,headers: {
      "token":sharedPreferences.getString('token'),
      "Authorization":token
      });
    if (res.statusCode == 200) {
      var jsonResponse = json.decode(res.body);
      var user=jsonResponse['user'];
      print('user');
      print(user);
      firstName=user['firstName'];
      lastName=user['lastName'];
      email=user['email'];
      phone=user['phone'];

    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("something wrong"),
      ));
    }

  }
  disconnect()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.remove('token');
  Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>LoginPage()));
  }
  @override
  void initState() {
    // TODO: implement initState
    getUserInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
appBar: AppBar(
  backgroundColor: Colors.white,
  iconTheme: IconThemeData(color: Colors.grey,),
  centerTitle: true,
  title: Text("My Profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black),),
),
      body:
      Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget> [
            Icon(Icons.account_circle_rounded,size: 150,color: Colors.grey ,),

            Center(
              child:
              Container(
                //color: Colors.white70,
                height: 250,
                width: MediaQuery.of(context).size.width-70,
                decoration: ShapeDecoration(
                  color:Color.fromRGBO(241, 240, 240, 0.3568627450980392),
                shape: RoundedRectangleBorder (
                  borderRadius: BorderRadius.circular(10.0),
                )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(firstName +" "+lastName,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, ),),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.phone_in_talk_outlined,color: Colors.deepOrangeAccent,),
                        Column(
                          children: [
                            Text("Phone Number",style:TextStyle(fontSize: 15)),
                            Text(phone)
                          ],
                        ),
                        Icon(Icons.drive_file_rename_outline_outlined,size: 15,)
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(icon:Icon(Icons.email_outlined,color: Colors.deepOrangeAccent,size: 20,),onPressed: (){},
                          padding:EdgeInsets.all(10) ,

                        ),
                        Column(
                          children: [
                            Text("Email",style:TextStyle(fontSize: 15)),
                            Text(email)
                          ],
                        ),
                        Icon(Icons.drive_file_rename_outline_outlined,size: 15,)

                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.local_shipping_outlined,color: Colors.deepOrangeAccent,),
                        Column(
                          children: [
                            Text("Adress",style:TextStyle(fontSize: 15)),
                            Text('Tunis')
                          ],
                          
                        ),
                        Icon(Icons.drive_file_rename_outline_outlined,size: 15,)

                      ],
                    ),
                    FlatButton(onPressed:disconnect,
                        color: Colors.red,

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child:
                          SizedBox(
                            width: MediaQuery.of(context).size.width-50,
                            height: 50,
                            child:  Row(
                              children: [
                                Icon(Icons.power_settings_new_outlined,color: Colors.white,size: 25,),
                                Text("   Disconnect",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),

                        ))
                  ],
                ),
              ) ,
            ),

          ],
        ) ,
      ),

    );
  }
}

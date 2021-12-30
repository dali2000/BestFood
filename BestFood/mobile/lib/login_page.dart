import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/home_page.dart';
import 'package:mobile/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email= TextEditingController();
  TextEditingController _password= TextEditingController();
  bool _isLoading = false;
   String url = "http://192.168.1.6:3000/user/login";

  signin(String email, String password) async {
  String msg="";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map body = {"email": email, "password": password};
    print(body);
    var jsonResponse;
    var res = await http.post(url, body: body);
    print("${res}");
    if (res.statusCode == 200) {
      jsonResponse = json.decode(res.body);

      print("response status = ${res.statusCode}");
      print("response body = ${res.body}");

    }
    if (jsonResponse == null) {
      setState(() {
        _isLoading == false;
      });

    }
    else {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(jsonResponse['message']),
        ));
        sharedPreferences.setString("token", jsonResponse['token']);
    //    Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>HomePage()));
        _isLoading = false;
      });
    }
    if(!sharedPreferences.getString("token").isEmpty){
      print(sharedPreferences.getString("token"));
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>HomePage()));

    }

    print("${res.body}");
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("lib/assets/images/logo.png"),
                        fit: BoxFit.contain
                    ),
                  ),
                ),

                Card(

                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                          child: TextField(
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(hintText: "Email"),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                          child: TextField(
                            controller: _password,
                            obscureText: true,
                            decoration: InputDecoration(hintText: "Password"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 60,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child:
                  Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.deepOrangeAccent,
                    child: Text("Sign In", style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25)),
                    onPressed: _email.text==""||_password.text==""?null
                        : (){
                      setState(() {
                        _isLoading=true;
                      });
                      signin(_email.text, _password.text);
                    },
                  ),
                  )

                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("you don\'t have account ?"),
                      FlatButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>RegisterPage()));
                          },
                          child: Text("Register", style: TextStyle(color: Colors
                              .deepOrangeAccent, fontSize: 20),)
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );}}

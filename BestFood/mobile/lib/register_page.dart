import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/home_page.dart';
import 'package:mobile/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _email= TextEditingController();
  TextEditingController _firstName= TextEditingController();
  TextEditingController _lastName= TextEditingController();
  TextEditingController _phone= TextEditingController();
  TextEditingController _password= TextEditingController();
  bool _isLoading = false;
   String url = "http://192.168.1.6:3000/user/register";

  signup(String email, String password,String firstName, String lastName ,String phone) async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map body = {"email": email, "password": password,"firstName":firstName,"lastName":lastName,"phone":phone};
    var jsonResponse;
    var res = await http.post(url, body: body);
    if (res.statusCode == 200) {
      jsonResponse = json.decode(res.body);
      print("response status = ${res.statusCode}");
      print("response body = ${res.body}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${jsonResponse['message']}"),
      ));
      Navigator.push(context,
          MaterialPageRoute(
              builder: (BuildContext context)=>LoginPage()
          ));
    }
      else{
        print("something is wrong");
    }


    print("response body = ${res.body}");


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
                 // height: 150,
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
                   // height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                          child: TextField(
                            controller: _firstName,
                            decoration: InputDecoration(hintText: "FirstName"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                          child: TextField(
                            controller: _lastName,
                            decoration: InputDecoration(hintText: "LastName"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                          child: TextField(
                            controller: _phone,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(hintText: "Phone"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                          child: TextField(
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(hintText: "Email"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
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
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.deepOrangeAccent,
                    child: Text("Sign In", style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25)),
                    onPressed: _email.text==""||_password.text=="" ||_firstName.text==""||_lastName.text=="" ?null
                    : (){
                      setState(() {
                        _isLoading=true;
                      });
                      signup(_email.text, _password.text,_firstName.text,_lastName.text,_phone.text);
                    },
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("you already have Account ?"),
                      FlatButton(
                          onPressed: () {Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (BuildContext context)=>LoginPage()
                              ));
                          },
                          child: Text("Sign Up", style: TextStyle(color: Colors
                              .deepOrangeAccent, fontSize: 20),)
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );}
}
class SnackBarPage extends StatelessWidget {
  const SnackBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text('Yay! A SnackBar!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Show SnackBar'),
      ),
    );
  }
}
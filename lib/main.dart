import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
            title: Text('Edit Profile')),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 250,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset("images/wallpaper.jpg"),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage('images/profile.jpg'),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 30),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Username',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'Email',
                              border: UnderlineInputBorder()),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        IntlPhoneField(
                          decoration: InputDecoration(
                              labelText: 'Phone Number',
                              border: UnderlineInputBorder()),
                          initialCountryCode: "FR",
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                        ),
                        FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: Text('Change password',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20)),
                        ),
                        MaterialButton(
                          minWidth: double.infinity,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Text('Save'),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            _formKey.currentState.validate();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//FlatButton(
//                     onPressed: () =>
//                         Navigator.of(context).pushNamed(Routes.forgotPassword),
//                     child: Text('Forgot Password?',
//                         style: TextStyle(
//                             color: Theme.of(context).primaryColor,
//                             fontWeight: FontWeight.w500)),
//                   ),

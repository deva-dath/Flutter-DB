import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/register.dart';

import 'lists.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  static const platForm = MethodChannel('flutter_native/helper');

  final userNameTextComntroller = TextEditingController();
  final passwordTextComntroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String displayText = "";
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    getSavedData();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://w0.peakpx.com/wallpaper/692/466/HD-wallpaper-batman-dhf-fe.jpg'),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: userNameTextComntroller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: InputBorder.none,
                            hintText: 'Enter Email'),
                        autofillHints: [AutofillHints.email],
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Enter a Valid Email'
                                : null,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: passwordTextComntroller,
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                icon: isVisible
                                    ? Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      )
                                    : Icon(
                                        Icons.visibility_off,
                                        color: Colors.grey,
                                      )),
                            contentPadding: EdgeInsets.all(10),
                            border: InputBorder.none,
                            hintText: 'Enter Password'),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 100, right: 100, top: 10, bottom: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: Colors.deepPurple,
                        ),
                        // child: Text(
                        //   'Log In',
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 24,
                        //       color: Colors.white),
                        // ),
                        child: ElevatedButton(
                            onPressed: () async {
                              final form = formKey.currentState!;
                              if (form.validate()) {
                                await saveDataToStorage();

                                final email = userNameTextComntroller.text;
                                ScaffoldMessenger.of(context)
                                  ..removeCurrentSnackBar()
                                  ..showSnackBar(SnackBar(
                                      content: Text('Your email is $email')));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ListViewSample()));
                              }
                            },
                            child: Text('Login')),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Also sign in using',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.mail_outlined,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.facebook,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 80),
                      Text(
                        "Not a User ?",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> saveDataToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', userNameTextComntroller.text);
    await prefs.setString('pass_word', passwordTextComntroller.text);
    print(userNameTextComntroller.text);
  }

  Future<void> getSavedData() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final usr = await sharedPrefs.getString('user_name');
    final pswd = await sharedPrefs.getString('pass_word');
    print('usr:$usr');
    print('pwd:$pswd');
    if (usr != null) {
      userNameTextComntroller.text = usr;
      passwordTextComntroller.text = pswd!;
    }
  }
}

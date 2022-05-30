import 'package:flutter/material.dart';
import 'package:jobsheet8/helper/authtentication.dart';
import 'package:jobsheet8/helper/sign_in.dart';
import 'package:jobsheet8/screen/first_screen.dart';
import 'package:jobsheet8/screen/second_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dea Vernanda Risky Nuryanto (2031710084)"),
      ),
      body: ListView(children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            const FlutterLogo(size: 150),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                controller: emailController,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                  left: 30, right: 30, top: 10, bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                controller: passwordController,
              ),
            ),
           Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                  left: 30, right: 30, top: 3, bottom: 15),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                controller: passwordController,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
              child: ElevatedButton(
                  child: const Text(
                    "Sign In With Email",
                    style: TextStyle(
                      color: Color.fromARGB(239, 12, 12, 12),
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  onPressed: () async {
                    await signIn(emailController.text, passwordController.text)
                        .then((result) {
                      if (result == null) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondScreen(
                                      email: emailController.text,
                                    )));
                      } else {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                            result,
                            style: TextStyle(fontSize: 16),
                          ),
                        ));
                      }
                    });
                  }),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
              child: ElevatedButton(
                  child: const Text(
                    "Sign Up With Email",
                    style: TextStyle(
                      color: Color.fromARGB(239, 12, 12, 12),
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  onPressed: () async {
                    signUp(emailController.text, passwordController.text)
                        .then((result) {
                      if (result == null) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondScreen(
                                      email: emailController.text,
                                    )));
                      } else {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                            result,
                            style: TextStyle(fontSize: 16),
                          ),
                        ));
                      }
                    });
                  }),
            ),
            const SizedBox(height: 20),
            Row(
              children: const <Widget>[
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  'OR Sign In With',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Divider(thickness: 1, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _signInButton(),
          ],
        ),
      ]),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.blue,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return FirstScreen();
                },
              ),
            );
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: const BorderSide(color: Colors.blue),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            //Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
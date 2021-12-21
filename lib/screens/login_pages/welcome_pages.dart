import 'package:flutter/material.dart';
import 'package:java_spring_frontend/screens/login_pages/login_page.dart';
import 'package:java_spring_frontend/screens/login_pages/register_page.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(26),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Magazine',
                    style: TextStyle(
                        color: Colors.deepPurple.shade400,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Text(
                    'Hello!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    'Welcome to the Magazine',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Image(
                    image: AssetImage('images/1.png'),
                    width: 250.0,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '''Soon you will be able to buy anything you want\t first you need to register''',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '''Click on the "Start registration" button,\n I accept the terms''',
                    style: TextStyle(fontSize: 15),
                  ),
                  InkWell(
                    child: Text(
                      'User Agreement',
                      style: TextStyle(color: Colors.lightBlueAccent),
                    ),
                    onTap: () async {
                      const url = 'http://ecommercelaw.ru/docs/polzovsogl.html';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 250,
                    height: 60,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.indigo),
                        //padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                      ),
                      child: Text(
                        'Start registration',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 250,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.indigo),
                        //padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

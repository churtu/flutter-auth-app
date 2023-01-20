import 'package:auth_app/src/services/google_signin_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AuthApp - Google - Apple'),
          actions: [
            IconButton(
              onPressed: () {
                GoogleSigninService.signOut();
              },
              icon: const Icon(FontAwesomeIcons.doorOpen)
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  splashColor: Colors.transparent,
                  minWidth: double.infinity,
                  height: 40,
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  onPressed: () {
                    GoogleSigninService.signinWithGoogle();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(FontAwesomeIcons.google, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        'Signin with Google', 
                        style: TextStyle(
                          fontSize: 17, 
                          color: Colors.white
                          )
                        ),
                    ],
                  ),
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:easyreserve/pages/services/auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
          Image.asset("assets/images/onboarding.jpg"),
          SizedBox(height: 40.0),
          Text(
            "Sigup here",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            "Event Booking App",
            style: TextStyle(
              color: Color(0xff6351ec),
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
            ),
          SizedBox(height: 50.0),
          Text(
            "Dicover, book, and experience \n unforgeetable moments effortlessly!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black45,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 50),
          GestureDetector(
            onTap: (){
              AuthMethods().signInWithGoogle(context);
            },
            child: Container(
              height: 70,
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              decoration: BoxDecoration(color: Color(0xff6351ec), 
              borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/google.png", height: 30, width: 30,),
                  SizedBox(width: 40),
                  Text(
                    "Sign in with Google",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
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
}
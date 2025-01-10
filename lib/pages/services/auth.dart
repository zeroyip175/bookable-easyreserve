import 'package:easyreserve/pages/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:easyreserve/pages/bottomnav.dart';

class AuthMethods {

  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser()async{
    return await auth.currentUser;

  }
  
  signInWithGoogle(BuildContext context) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount = 
      await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleSignInAuthentication =
      await googleSignInAccount?.authentication;
    
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication?.idToken,
      accessToken: googleSignInAuthentication?.idToken
    );

    UserCredential result = await firebaseAuth.signInWithCredential(credential);

    User? userDerails = result.user;

    //
    if (result != null) {
      Map<String, dynamic> userInfoMap={
        "Name": userDerails!.displayName,
        "Image": userDerails.photoURL,
        "Email": userDerails.email,
        "Id": userDerails.uid
      };

      await DatabaseMethods().addUserDetail(userInfoMap, userDerails.uid);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: 
            Text("Registered Successfully!!!",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),));
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Bottomnav()));
    }
  }

}
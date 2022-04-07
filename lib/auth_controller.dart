import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'login_page.dart';

class AuthController extends GetxController{
  //AuthController.instance....
  static AuthController instance = Get.find();
  //email,password,name..
  late Rx<User?> _user;
  FirebaseAuth auth=FirebaseAuth.instance;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user=Rx<User?>(auth.currentUser);
    //user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user,_initialScreen);
  }

  _initialScreen(User? user){
    if(user==null){
      print("login page");
      Get.offAll(()=>LoginPage());
    }else {
      Get.offAll(()=>WelcomePage(email:user.email!));
    }
  }

  void register(String email, password) async {
  try{
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }
  catch(e){
    Get.snackbar("About User", "User message",
    backgroundColor:Colors.redAccent ,
    snackPosition: SnackPosition.BOTTOM,
      titleText: Text(
        "Account creation failed",
        style:TextStyle(
          color: Colors.white
        ),
      ),
      messageText: Text(
        e.toString(),
        style: TextStyle(
          color: Colors.white
        )
      )
    );
  }
  }
  void login(String email, password) async {
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
      Get.snackbar("About Login", "Login message",
          backgroundColor:Colors.redAccent ,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Login failed",
            style:TextStyle(
                color: Colors.white
            ),
          ),
          messageText: Text(
              e.toString(),
              style: TextStyle(
                  color: Colors.white
              )
          )
      );
    }
  }
  void logOut() async {
      await auth.signOut();
    }

    void resetPassword(String email) async{
    try{
      await auth.sendPasswordResetEmail(email: email);
      Get.snackbar("About Reset", "Reset password",
          backgroundColor:Colors.lightGreen ,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Password reset successful!",
            style:TextStyle(
                color: Colors.white
            ),
          ),
          messageText: Text(
             "Check the code sent to email",
              style: TextStyle(
                  color: Colors.white
              )
          )
      );
    }
    catch(e){
      Get.snackbar("About Reset", "Reset password",
          backgroundColor:Colors.redAccent ,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Password reset failed",
            style:TextStyle(
                color: Colors.white
            ),
          ),
          messageText: Text(
              e.toString(),
              style: TextStyle(
                  color: Colors.white
              )
          )
      );
    }
    }
  }

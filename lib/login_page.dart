import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login/auth_controller.dart';
import 'package:login/forgot_password_page.dart';
import 'package:login/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
                width: w,
                height: h * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("img/wavegreen.png"),
                     fit: BoxFit.fill
                  )
              ),
                // color: Colors.white,

              child: Column(
                children: [
                  SizedBox(height:h*0.1,),
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius:60,
                    backgroundImage: AssetImage(
                        "img/logo.jpg"
                    ),
                  ),

                ],
              ),



            ),
            Container(
                width: w,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 60, color: Colors.black  )),
                    Text("Sign into your account",
                        style:
                            TextStyle(fontSize: 20, color: Colors.grey[500])),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 7,
                                offset: Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email,color:Colors.greenAccent),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 7,
                                offset: Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.password,color:Colors.greenAccent),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ForgotPasswordPage())),
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(),
                            ),
                            Text("Forgot the password?",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey[500])),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 20),
            GestureDetector(
              onTap: (){
                AuthController.instance.login(emailController.text.trim(), passwordController.text.trim());
              },
              child: Container(
                width: w * 0.5,
                height: h * 0.08,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage("img/gradientnew.jpg"),
                        fit: BoxFit.cover)),
                child: Center(
                  child: Text("Sign in",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 35,
                      )),
                ),
              ),
            ),
            // SizedBox(height:w*0.08),
            SizedBox(height: w * 0.1),
            RichText(
                text: TextSpan(
                    text: "Don\'t have an account?",
                    style: TextStyle(color: Colors.grey[500], fontSize: 20),
                    children: [
                  TextSpan(
                      text: " Create",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black, fontSize: 20),
                  recognizer: TapGestureRecognizer()..onTap=(){
                        Get.to(()=>SignUpPage());
                  }
                  )
                ]))
          ],
        ));
  }
}

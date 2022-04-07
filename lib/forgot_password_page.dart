import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/auth_controller.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey=GlobalKey<FormState>();
  final emailController=TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Column(
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
          Expanded(
            child: Container(
                width: w,
                height: h * 0.3,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      'Receive an email to reset your password',
                      style: TextStyle(fontSize:24),
                    ),
                    SizedBox(height:20),
                    TextFormField(
                      controller: emailController,
                      textInputAction: TextInputAction.done,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator:(email)=>
                      email!=null
                          ? 'Enter a valid email'
                          : null,
                    ),
                    SizedBox(height:20),
                    GestureDetector(
                      // onTap:() {
                      //   AuthController.instance.resetPassword(
                      //       emailController.text.trim());
                      // },
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(50),
                            primary: Colors.green,
                          ),
                          icon: Icon(Icons.email_outlined),
                          label: Text(
                            'Reset Password',
                            style:TextStyle(fontSize:24),
                          ),
                          onPressed:(){
                            AuthController.instance.resetPassword(
                                emailController.text.trim());
                          }
                      ),
                    )
                  ],
                )
            )
          )

        ],
      )
    );


  }
}




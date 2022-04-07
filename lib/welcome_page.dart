
import 'package:flutter/material.dart';
import 'package:login/auth_controller.dart';

class WelcomePage extends StatelessWidget {
  String email;
  WelcomePage({Key? key, required this.email}) : super(key: key);

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
              height: h * 0.4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/wavegreen.png"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(height: 40),
            Container(
              width:w,
              margin:const EdgeInsets.only(left:20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Welcome",
                      style: TextStyle(
                          fontSize:36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54
                      )
                  ),
                  Text(
                    email,
                      style: TextStyle(
                          fontSize:18,
                          color: Colors.grey[500]
                      )
                  ),
                ],
              ),
            ),
            SizedBox(height: 200,),
            GestureDetector(
              onTap:(){
                AuthController.instance.logOut();
              },
              child: Container(
                width: w * 0.4,
                height: h * 0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage("img/gradientnew.jpg"),
                        fit: BoxFit.cover)),
                child: Center(
                  child: Text("Sign out",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      )),
                ),
              ),
            ),
          ],
        ));
  }
}

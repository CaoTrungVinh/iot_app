import 'package:flutter/material.dart';
import 'package:iot/authentication/Login/login_screen.dart';
import 'package:iot/authentication/Signup/signup_screen.dart';
import 'package:iot/authentication/Welcome/components/background.dart';
import 'package:iot/components/rounded_button.dart';
import '../../constants.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "HỆ THỐNG NUÔI CÁ CV",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // SizedBox(height: size.height * 0.05),
            // SvgPicture.asset(
            //   "assets/icons/chat.svg",
            //   height: size.height * 0.45,
            // ),
            Image(
              image: AssetImage('assets/images/logo.png'),
              width: 200,
              height: 200,
            ),
            // SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "ĐĂNG NHẬP",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "ĐĂNG KÝ",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

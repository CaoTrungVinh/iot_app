import 'package:flutter/material.dart';
import 'package:iot/authentication/Login/login_screen.dart';
import 'package:iot/authentication/Signup/components/background.dart';
import 'package:iot/components/already_have_an_account_acheck.dart';
import 'package:iot/components/rounded_button.dart';
import 'package:iot/components/rounded_input_field.dart';
import 'package:iot/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // SizedBox(height: size.height * 0.03),
            Image(
              image: AssetImage('assets/images/logo.png'),
              width: 140,
              height: 140,
            ),
            RoundedInputField(
              hintText: "Họ tên",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Giới tính",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "ĐĂNG KÝ",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
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
          ],
        ),
      ),
    );
  }
}

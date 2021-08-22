import 'package:flutter/material.dart';
import 'package:iot/authentication/ProgressHUD.dart';
import 'package:iot/authentication/form_helper.dart';
import 'package:iot/network/post_data.dart';
import 'package:iot/network/request_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static final GlobalKey<FormState> globalFromKey = GlobalKey<FormState>();
  String _email = "";
  String _pwd = "";
  bool hidePassword = true;
  bool isApiCallProcess = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      body: ProgressHUD(
        child: _loginUISetup(context),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
      ),
    ));
  }

  Widget _loginUISetup(BuildContext context) {
    return new SingleChildScrollView(
      child: Container(
        child: Form(
          key: globalFromKey,
          child: _loginUI(context),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3.5,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFD5EBFD),
                    Color(0xFFD5EBFD),
                  ]),
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(150))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 160,
                  height: 160,
                  fit: BoxFit.contain,
                ),
              ),
              Spacer()
            ],
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20, top: 40),
            child: Text(
              'HỆ THỐNG GIÁM SÁT AO NUÔI',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20, top: 20),
          child: FormHelper.inputFielWidget(
              context, Icon(Icons.person), "email", "Email", (onValidateVal) {
            if (onValidateVal.isEmpty) {
              return 'Email không được để trống';
            } else if (!onValidateVal.contains("@") ||
                !onValidateVal.contains(".")) {
              return "Email không đúng định dạng.";
            }
            return null;
          }, (onSavedVal) {
            _email = onSavedVal.toString().trim();
          }),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: FormHelper.inputFielWidget(
              context, Icon(Icons.lock), "password", "Mật khẩu",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "Mật khẩu không được rỗng!";
                }
                if(onValidateVal.length<8){
                  return "Mật khẩu ít nhất 8 ký tự!";
                }
            return null;
          }, (onSavedVal) {
            _pwd = onSavedVal.toString().trim();
          },
              initialValue: "",
              obscureText: hidePassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                color: Colors.lightBlue.withOpacity(0.4),
                icon: Icon(
                    hidePassword ? Icons.visibility_off : Icons.visibility),
              )),
        ),
        Padding(padding: EdgeInsets.only(bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: new FlatButton(
                  child: new Text(
                    "Quên mật khẩu?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  onPressed: () => {
                    Navigator.of(context).pushReplacementNamed('/forgot')
                  },
                ),
              ),
            ],
          ),

        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: FormHelper.saveButton("ĐĂNG NHẬP", () {
            if (validateAndSave()) {
              print("Email: $_email");
              print("Pass: $_pwd");
              setState(() {
                this.isApiCallProcess = true;
              });
              APIServices.loginCustomer(_email, _pwd).then((response) async {
                setState(() {
                  this.isApiCallProcess = false;
                });
                if (response) {
                  globalFromKey.currentState.reset();

                  Navigator.of(context).pushReplacementNamed('/home');

                  print("$response àd");
                } else {
                  print(response);
                  FormHelper.showMessage(context, "Cảnh báo",
                      "Email hoặc mật khẩu không đúng ", "Đồng ý", () {
                    Navigator.of(context).pop();
                  });
                }
              });
            }
          }),
        )
      ],
    );
  }

  bool validateAndSave() {
    final form = globalFromKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}

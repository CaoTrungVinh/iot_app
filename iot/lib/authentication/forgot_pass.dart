import 'package:flutter/material.dart';
import 'package:iot/network/request_login.dart';
import 'package:iot/authentication/ProgressHUD.dart';
import 'package:iot/authentication/form_helper.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key key}) : super(key: key);

  @override
  ForgotPassrClass createState() => new ForgotPassrClass();
}

class ForgotPassrClass extends State<ForgotPass> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static final GlobalKey<FormState> globalFromKey = GlobalKey<FormState>();
  String _email = "";
  bool isApiCallProcess = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      body: ProgressHUD(
        child: ForgotPassUISetup(context),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
      ),
    ));
  }

  Widget ForgotPassUISetup(BuildContext context) {
    return new SingleChildScrollView(
      child: Container(
        child: Form(
          key: globalFromKey,
          child: _forgotPass(context),
        ),
      ),
    );
  }

  Widget _forgotPass(BuildContext context) {
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
              'HỆ THỐNG QUẢN LÝ AO NUÔI',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 0, top: 20),
            child: Text(
              'Hãy điền Email để được cấp mật khẩu mới!',
              style: TextStyle(fontSize: 15, color: Colors.blue),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 0, top: 5),
          child: FormHelper.inputFielWidget(
              context, Icon(Icons.email), "email", "Email", (onValidateVal) {
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
        SizedBox(
          height: 20,
        ),
        Center(
          child: FormHelper.saveButton("GỬI MAIL", () {
            print(_email);
            if (validateAndSave()) {
              print("Email: $_email");
              setState(() {
                this.isApiCallProcess = true;
              });
              APIServices.forgotCustomer(_email).then((response) {
                setState(() {
                  this.isApiCallProcess = false;
                });
                if (response) {
                  globalFromKey.currentState.reset();
                  FormHelper.showMessage(
                      context,
                      "Thành công!",
                      "Vui lòng check mail để lấy mật khẩu đăng nhập.",
                      "OK", () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed('/login');
                  });
                } else {
                  print(response);
                  FormHelper.showMessage(
                      context, "Thông báo", "Gửi mail thất bại!!! ", "Đồng ý",
                      () {
                    Navigator.of(context).pop();
                  });
                }
              });
            }
          }),
        ),
        Padding(
          padding: EdgeInsets.only(top: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new FlatButton(
                child: new Text(
                  "Quay về Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                    fontSize: 15.0,
                  ),
                ),
                onPressed: () =>
                    {Navigator.of(context).pushReplacementNamed('/login')},
                // ),
              ),
            ],
          ),
        ),
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

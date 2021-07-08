import 'package:flutter/material.dart';
import 'package:iot/authentication/ProgressHUD.dart';
import 'package:iot/authentication/form_helper.dart';
import 'package:iot/network/request_login.dart';
import 'package:iot/network/shared_service.dart';

class ChangePassPage extends StatefulWidget {
  const ChangePassPage({Key key}) : super(key: key);

  @override
  ChangPassClass createState() => ChangPassClass();
}

class ChangPassClass extends State<ChangePassPage>  {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static final GlobalKey<FormState> globalFromKey = GlobalKey<FormState>();
  String currentPassword = "";
  String newPassword = "";
  String newPasswordConfirm = "";
  bool hidePassword = true;
  bool isApiCallProcess = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Đổi mật khẩu",
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        elevation: 3,
      ),
      key: _scaffoldKey,
      body: ProgressHUD(
        child: ChangePassUISetup(context),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
      ),
    ));
  }

  Widget ChangePassUISetup(BuildContext context) {
    return new SingleChildScrollView(
      child: Container(
        child: Form(
          key: globalFromKey,
          child: ChangePassUI(context),
        ),
      ),
    );
  }

  Widget ChangePassUI(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 20, top: 50),
          child: FormHelper.inputFielWidget(
              context, Icon(Icons.lock), "password", "Mật khẩu cũ",
              (onValidateVal) {
            if (onValidateVal.isEmpty) {
              return "Mật khẩu cũ không được rỗng!";
            }
            if (onValidateVal.length < 8) {
              return "Mật khẩu cũ ít nhất 8 ký tự!";
            }
            return null;
          }, (onSavedVal) {
            currentPassword = onSavedVal.toString().trim();
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
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: FormHelper.inputFielWidget(
              context, Icon(Icons.lock), "password", "Mật khẩu mới",
              (onValidateVal) {
            if (onValidateVal.isEmpty) {
              return "Mật khẩu mới không được rỗng!";
            }
            if (onValidateVal.length < 8) {
              return "Mật khẩu mới ít nhất 8 ký tự!";
            }
            return null;
          }, (onSavedVal) {
            newPassword = onSavedVal.toString().trim();
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
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: FormHelper.inputFielWidget(
              context, Icon(Icons.lock), "password", "Xác nhận mật khẩu mới",
              (onValidateVal) {
            if (onValidateVal.isEmpty) {
              return 'Mật khẩu không được để trống';
            }
            return null;
          }, (onSavedVal) {
            newPasswordConfirm = onSavedVal.toString().trim();
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
        SizedBox(
          height: 20,
        ),
        Center(
          child: FormHelper.saveButton("Đổi mật khẩu", () {
            print(currentPassword);
            print(newPassword);
            print(newPasswordConfirm);
            if (validateAndSave()) {
              setState(() {
                this.isApiCallProcess = true;
              });
              APIServices.changePassCustomer(
                      currentPassword, newPassword, newPasswordConfirm)
                  .then((response) {
                setState(() {
                  this.isApiCallProcess = false;
                });
                if (response) {
                  globalFromKey.currentState.reset();
                  FormHelper.showMessage(
                      context, "Thành công!", "Vui lòng đăng nhập lại.", "OK",
                      () {
                    Navigator.of(context).pop();
                    SharedService.logout(context);
                  });
                } else {
                  print(response);
                  FormHelper.showMessage(context, "Thất bại",
                      "Đổi mật khẩu không thành công!!! ", "Đồng ý", () {
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

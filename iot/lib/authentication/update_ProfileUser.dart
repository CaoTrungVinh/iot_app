import 'package:flutter/material.dart';
import 'package:iot/network/request_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfileUserPage extends StatefulWidget {
  const UpdateProfileUserPage({Key key}) : super(key: key);

  @override
  UpdateProfileUserClass createState() => UpdateProfileUserClass();
}

class UpdateProfileUserClass extends State<UpdateProfileUserPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  bool isApiCallProcess = false;
  static final GlobalKey<FormState> globalFromKey = GlobalKey<FormState>();
  String name = "", birthday = "", gender = "", address = "";
  String up_name = "", up_birthday = "", up_gender = "", up_address = "", up_phone = "";
  int phone = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfileUser();
  }

  Future<void> getProfileUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        name = prefs.getString("name");
        birthday = prefs.getString("birthday");
        gender = prefs.getString("gender");
        address = prefs.getString("address");
        phone = prefs.getInt("phone");
        up_name = name;
        up_birthday = birthday;
        up_gender = gender;
        up_address = address;
        up_phone = phone.toString();
        print(name);
      });
    } catch (error) {}
  }

  void _showScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Cập nhật thông tin",
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        elevation: 3,
      ),
      key: _scaffoldKey,
      body: Form(
        key: formKey,
        child: ChangePassUI(context),
      ),
    ));
  }

  Widget ChangePassUI(BuildContext context) {
    return new ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            // new Container(
            //   // height: 250.0,
            //   // color: Colors.black26,
            //   child: new Column(
            //     children: <Widget>[
            //       // Padding(
            //       //   padding: EdgeInsets.only(bottom: 10.0),
            //       //   child: new Stack(fit: StackFit.loose, children: <
            //       //       Widget>[
            //       //     // Image(
            //       //     //   image: new AssetImage(
            //       //     //       'assets/images/profile_bg.jpg'),
            //       //     //   fit: BoxFit.contain,
            //       //     //   height: 185,
            //       //     //   width: 1000,
            //       //     // ),
            //       //     new Row(
            //       //       crossAxisAlignment: CrossAxisAlignment.center,
            //       //       mainAxisAlignment: MainAxisAlignment.center,
            //       //       children: <Widget>[
            //       //         new Container(
            //       //             width: 140.0,
            //       //             height: 140.0,
            //       //             margin:
            //       //             const EdgeInsets.only(top: 20.0),
            //       //             decoration: new BoxDecoration(
            //       //               shape: BoxShape.circle,
            //       //               image: new DecorationImage(
            //       //                 image: new ExactAssetImage(
            //       //                     'assets/images/logo_mobile.jpg'),
            //       //                 fit: BoxFit.cover,
            //       //               ),
            //       //             )),
            //       //       ],
            //       //     ),
            //       //     Padding(
            //       //         padding: EdgeInsets.only(
            //       //             top: 110.0, left: 100.0),
            //       //         child: new Row(
            //       //           mainAxisAlignment:
            //       //           MainAxisAlignment.center,
            //       //           children: <Widget>[
            //       //             new CircleAvatar(
            //       //               backgroundColor: Colors.black45,
            //       //               radius: 25.0,
            //       //               child: new Icon(
            //       //                 Icons.camera_alt,
            //       //                 color: Colors.white,
            //       //               ),
            //       //             )
            //       //           ],
            //       //         )),
            //       //   ]),
            //       // )
            //     ],
            //   ),
            // ),
            new Container(
              color: Color(0xffFFFFFF),
              child: Padding(
                padding: EdgeInsets.only(bottom: 25.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 0.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  'Thông tin cá nhân ',
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                              ],
                            ),
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Container(),
                              ],
                            )
                          ],
                        )),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.account_box_outlined, size: 16.0),
                            Expanded(
                              child: Container(
                                padding: new EdgeInsets.only(left: 5.0),
                                child: new Text(
                                  'Họ Tên',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              flex: 2,
                            ),
                            Icon(Icons.accessibility_new_outlined, size: 16.0),
                            Expanded(
                              child: Container(
                                padding: new EdgeInsets.only(left: 5.0),
                                child: new Text(
                                  'Giới tính',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              flex: 2,
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 1.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: new TextFormField(
                                  textAlign: TextAlign.left,
                                  onChanged: (text) {
                                    if (text.isEmpty) {
                                      up_name = name;
                                    } else {
                                      up_name = text;
                                    }
                                  },
                                  decoration: InputDecoration(hintText: name),
                                ),
                              ),
                              flex: 2,
                            ),
                            Flexible(
                              child: new TextFormField(
                                // controller: profileController
                                //     .lastname_controller,
                                textAlign: TextAlign.left,
                                onChanged: (text) {
                                  if (text.isEmpty) {
                                    up_gender = gender;
                                  } else {
                                    up_gender = text;
                                  }
                                },
                                decoration: InputDecoration(hintText: gender),
                                // enabled: _status== false,
                              ),
                              flex: 2,
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.wallet_giftcard_outlined, size: 16.0),
                            Expanded(
                              child: Container(
                                padding: new EdgeInsets.only(left: 5.0),
                                child: new Text(
                                  'Ngày sinh',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              flex: 2,
                            ),
                            Icon(Icons.phone_callback, size: 16.0),
                            Expanded(
                              child: Container(
                                padding: new EdgeInsets.only(left: 5.0),
                                child: new Text(
                                  'Số điện thoại',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              flex: 2,
                            ),
                          ],
                        )),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.0, right: 25.0, top: 1.0),
                      child: new Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: new TextFormField(
                                textAlign: TextAlign.left,
                                onChanged: (text) {
                                  if (text.isEmpty) {
                                    up_birthday = birthday;
                                  } else {
                                    up_birthday = text;
                                  }
                                },
                                // controller:
                                // profileController.id_controller,
                                decoration: InputDecoration(hintText: birthday),
                                // enabled: _status == false,
                              ),
                            ),
                            flex: 2,
                          ),
                          Flexible(
                            child: new TextFormField(
                              // controller:
                              // profileController.phone_controller,
                              onChanged: (text) {
                                if (text.isEmpty) {
                                  up_phone = phone.toString();
                                } else {
                                  up_phone = text;
                                }
                              },
                              decoration: InputDecoration(hintText: '${phone}'),
                              keyboardType: TextInputType.number,
                            ),
                            flex: 2,
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //     padding: EdgeInsets.only(
                    //         left: 25.0, right: 25.0, top: 15.0),
                    //     child: new Row(
                    //       mainAxisSize: MainAxisSize.max,
                    //       children: <Widget>[
                    //         Icon(Icons.email_outlined, size: 16.0),
                    //         SizedBox(width: 5),
                    //         new Column(
                    //           mainAxisAlignment:
                    //           MainAxisAlignment.start,
                    //           mainAxisSize: MainAxisSize.min,
                    //           children: <Widget>[
                    //             new Text(
                    //               'Email',
                    //               style: TextStyle(
                    //                   fontSize: 16.0,
                    //                   fontWeight: FontWeight.bold),
                    //             ),
                    //           ],
                    //         ),
                    //       ],
                    //     )),
                    // Padding(
                    //     padding: EdgeInsets.only(
                    //         left: 25.0, right: 25.0, top: 1.0),
                    //     child: new Row(
                    //       mainAxisSize: MainAxisSize.max,
                    //       children: <Widget>[
                    //         new Flexible(
                    //           child: new TextFormField(
                    //             // controller: profileController
                    //             //     .email_controller,
                    //             decoration: const InputDecoration(
                    //                 hintText: "nguyenvana@gmail.com"),
                    //             // enabled: _status == false,
                    //           ),
                    //         ),
                    //       ],
                    //     )),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Icon(Icons.location_on_outlined, size: 16.0),
                            SizedBox(
                              width: 5,
                            ),
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  'Địa chỉ',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 1.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Flexible(
                              child: new TextFormField(
                                onChanged: (text) {
                                  if (text.isEmpty) {
                                    up_address = address;
                                  } else {
                                    up_address = text;
                                  }
                                },
                                // controller: profileController
                                //     .adress_controller,
                                decoration: InputDecoration(hintText: address),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 30.0),
                      child: Center(
                        child: new RaisedButton(
                          child: new Text("Cập nhật thông tin"),
                          textColor: Colors.white,
                          color: Colors.blue,
                          onPressed: () {
                            print(up_name + "," + "${up_phone}");
                            if (formKey.currentState.validate()) {
                              // formKey.currentState.validate();
                              return showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  // title: Text("Alert Dialog Box"),
                                  content: Text(
                                    "Xác nhận thay đổi thông tin ?",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  backgroundColor: Colors.white,
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                      child: Text("CANCEL",
                                          style: TextStyle(
                                              color: Colors.lightBlueAccent,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)),
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        APIServices.updateProfile(
                                                up_name,
                                                up_phone,
                                                up_gender,
                                                up_birthday,
                                                up_address)
                                            .then((response) {
                                          setState(() {
                                            this.isApiCallProcess = false;
                                          });
                                          if (response) {
                                            Navigator.of(ctx).pop();
                                            _showScaffold(
                                                "Thay đổi thông tin thành công!");
                                          } else {
                                            print(response);
                                            Navigator.of(ctx).pop();
                                            _showScaffold(
                                                "Thay đổi thông tin thất bại!");
                                          }
                                        });
                                      },
                                      child: Text("OK",
                                          style: TextStyle(
                                              color: Colors.lightBlueAccent,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0)),
                        ),
                      ),
                    ),
                    // _getActionButtons(context),
                  ],
                ),
              ),
            ),
            // _status==true ? _getActionButtons(context) : new Container(),
          ],
        ),
      ],
    );
  }

// bool validateAndSave() {
//   final form = globalFromKey.currentState;
//   if (form.validate()) {
//     form.save();
//     return true;
//   }
//   return false;
// }
}

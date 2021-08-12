import 'package:flutter/material.dart';

class DieuKhoan extends StatefulWidget {
  const DieuKhoan({Key key}) : super(key: key);

  @override
  _DieuKhoanState createState() => _DieuKhoanState();
}

class _DieuKhoanState extends State<DieuKhoan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff2E3A59),
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Điều khoản và sử dụng',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text(
              'Hệ thống xây dựng với tiêu chí giúp đỡ người dùng trong khó khăn việc nuôi thủy sản. Chúng tôi cam kết nỗ lực phát triển và luôn luôn chú trọng cho người dùng. Hệ thống bảo mật cho người dùng hoàn toàn.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              '1. Người dùng phải trung thực trong quá trình hoạt động hợp tác hai bên.',
              textAlign: TextAlign.justify,
              style: TextStyle(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Text(
              '2. Nếu có bất kì rủi ro, lỗi. Cần liên hệ ngay cho chúng tôi để hướng dẫn.',
              textAlign: TextAlign.justify,
              style: TextStyle(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Text(
              '3. Tôn trọng lẫn nhau.',
              style: TextStyle(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Text(
              '4. Không mạo danh người khác.',
              style: TextStyle(),
            ),
          ),
        ],
      ),
    );
  }
}

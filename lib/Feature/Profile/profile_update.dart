import 'package:capstone_ui/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Constant/textfield_widget.dart';
import '../../Constant/profile_widget.dart';

class ProfileUpdate extends StatefulWidget {
  ProfileUpdate({Key? key}) : super(key: key);

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            leading: BackButton(color: Colors.white),
            title: Text(
              'Chỉnh sửa tài khoản',
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {},
                child: Text(
                  'Lưu',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              physics: BouncingScrollPhysics(),
              children: [
                ProfileWidget(
                  imagePath:
                      "https://sg.cdnki.com/anh-dai-dien-dep-cho-nam-ngau---aHR0cHM6Ly90aGllcG5oYW5haS5jb20vd3AtY29udGVudC91cGxvYWRzLzIwMjEvMDUvaGluaC1hbmgtZGFpLWRpZW4tZGVwLTEuanBn.webp",
                  isEdit: true,
                  onClicked: () {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Họ tên',
                  text: 'Nguyễn Văn A',
                  onChanged: () {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Ngày sinh',
                  text: '16/06/2000',
                  onChanged: () {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Địa chỉ',
                  text: 'Bình Dương',
                  onChanged: () {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Tình trạng',
                  text: 'Mất giọng nói',
                  maxLines: 4,
                  onChanged: () {},
                ),
              ],
            ),
          ),
        ),
      );
}

import 'package:capstone_ui/Register/register_screen.dart';
import 'package:capstone_ui/Register/register_supporter_screen.dart';
import 'package:flutter/material.dart';

import '../Constant/constant.dart';
import '../Login/login_screen.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({Key? key}) : super(key: key);

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          title: Image.asset(
            'assets/images/logo_als2.png',
            fit: BoxFit.contain,
            height: 70,
          ),
          centerTitle: true,
          backgroundColor: const Color(0xffffffff),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                'Đăng ký với vai trò',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            // Column(
            //   children: [
            //     Card(
            //       clipBehavior: Clip.antiAlias,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(24),
            //       ),
            //       child: Expanded(
            //         child: Stack(
            //           alignment: Alignment.center,
            //           children: [
            //             Ink.image(
            //                 height: MediaQuery.of(context).size.height * 0.27,
            //                 width: MediaQuery.of(context).size.width * 0.8,
            //                 fit: BoxFit.cover,
            //                 child: InkWell(
            //                   onTap: () {
            //                     Navigator.push(
            //                         context,
            //                         MaterialPageRoute(
            //                             builder: (context) =>
            //                                 RegisterScreenPatient()));
            //                   },
            //                 ),
            //                 image: AssetImage('assets/images/role_patient.png'),
            //                 colorFilter: ColorFilter.mode(
            //                   Colors.grey.withOpacity(0.85),
            //                   BlendMode.modulate,
            //                 )),
            //             Text(
            //               'BỆNH NHÂN',
            //               style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 color: Color.fromARGB(255, 251, 252, 251),
            //                 fontSize: 28.0,
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //     ),
            //     SizedBox(
            //       width: 12,
            //     )
            //   ],
            // ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.02,
            // ),
            // Column(
            //   children: [
            //     Card(
            //       clipBehavior: Clip.antiAlias,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(24),
            //       ),
            //       child: Expanded(
            //         child: Stack(
            //           alignment: Alignment.center,
            //           children: [
            //             Ink.image(
            //                 height: MediaQuery.of(context).size.height * 0.27,
            //                 width: MediaQuery.of(context).size.width * 0.8,
            //                 fit: BoxFit.cover,
            //                 child: InkWell(
            //                   onTap: () {
            //                     Navigator.push(
            //                         context,
            //                         MaterialPageRoute(
            //                             builder: (context) =>
            //                                 RegisterScreenSupporter()));
            //                   },
            //                 ),
            //                 image:
            //                     AssetImage('assets/images/role_supporter.png'),
            //                 colorFilter: ColorFilter.mode(
            //                   Colors.grey.withOpacity(0.85),
            //                   BlendMode.modulate,
            //                 )),
            //             Text(
            //               'NGƯỜI HỖ TRỢ',
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   color: Color.fromARGB(255, 251, 252, 251),
            //                   fontSize: 28.0),
            //             )
            //           ],
            //         ),
            //       ),
            //     ),
            //     SizedBox(
            //       width: 12,
            //     )
            //   ],
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Đã có tài khoản?',
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
                    child: Text('Đăng nhập',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

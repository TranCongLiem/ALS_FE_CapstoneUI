// import 'package:capstone_ui/Register/register_screen.dart';
// import 'package:capstone_ui/Register/register_supporter_screen.dart';
// import 'package:flutter/material.dart';
// class RoleScreen extends StatefulWidget {
//   const RoleScreen({Key? key}) : super(key: key);

//   @override
//   State<RoleScreen> createState() => _RoleScreenState();
// }

// class _RoleScreenState extends State<RoleScreen> {

//   @override
//   Widget build(BuildContext context) {
//     final Size size= MediaQuery.of(context).size;
//     return Scaffold(
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(70.0),
//           child: AppBar(
//               title: Image.asset('assets/images/logo_als2.png', fit: BoxFit.contain, height: 70,),
//               centerTitle: true,
//               backgroundColor: const Color(0xffffffff),
//           ),
//         ),
//         // appBar: AppBar(
//         //
//         //   title: Image.asset('assets/images/logo_als2.png', width: 100,),
//         //   centerTitle: true,
//         //   backgroundColor: const Color(0xffffffff),
//         // ),

//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 20),
//               child: Text('Đăng ký với vai trò', style: TextStyle(
//                 fontSize: 35
//               ),),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 20),
//               child: Material(
//                 elevation: 8,
//                 borderRadius: BorderRadius.circular(20),
//                 clipBehavior: Clip.antiAliasWithSaveLayer,
//                 color: Colors.green,
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     InkWell(
//                       splashColor: Colors.white70,
//                       onTap: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
//                       },
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Ink.image(
//                             image: const AssetImage('assets/images/role_patient.png'),
//                             height: 150,
//                             width: 300,
//                             fit: BoxFit.cover,
//                           ),
//                           SizedBox(height: 6,),
//                           Text(
//                             'Bệnh nhân',
//                             style: TextStyle(
//                                 color: Colors.white70,
//                                 fontSize: 28,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Material(
//               elevation: 8,
//               borderRadius: BorderRadius.circular(20),
//               clipBehavior: Clip.antiAliasWithSaveLayer,
//               color: Colors.green,
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   InkWell(
//                     splashColor: Colors.black26,
//                     onTap: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterSupporter()));
//                     },
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Ink.image(
//                           image: const AssetImage('assets/images/role_supporter.png'),
//                           height: 150,
//                           width: 300,
//                           fit: BoxFit.cover,
//                         ),
//                         SizedBox(height: 6,),
//                         Text(
//                           'Người hỗ trợ',
//                           style: TextStyle(
//                             color: Colors.white70,
//                             fontSize: 28,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

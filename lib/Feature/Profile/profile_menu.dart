// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter/material.dart';

// class ProfileMenu extends StatelessWidget {
//   const ProfileMenu({Key? key, this.iconSrc, this.label, this.press})
//       : super(key: key);
//   final String? iconSrc, label;
//   final Function? press;

//   String checkIconSrc(iconSrc) {
//     if (iconSrc != null) return iconSrc;
//     return "";
//   }

//   String checkLabel(label) {
//     if (label != null) return label;
//     return "";
//   }

//   void checkFunction(press) {
//     if (press != null) press();
//     () {};
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         checkFunction(press);
//       },
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//         child: SafeArea(
//           child: Row(
//             children: <Widget>[
//               SvgPicture.asset(checkIconSrc(iconSrc)),
//               SizedBox(width: 20),
//               Text(
//                 checkLabel(label),
//                 style: TextStyle(fontSize: 16, color: Colors.black),
//               ),
//               Spacer(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    Key? key,
    required this.iconSrc,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String iconSrc, title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        press;
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Row(
          children: [
            SvgPicture.asset(
              iconSrc,
              height: 16,
              width: 16,
            ),
            SizedBox(width: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}

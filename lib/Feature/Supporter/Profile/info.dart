import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Info extends StatelessWidget {
  const Info({Key? key, this.name, this.image}) : super(key: key);
  final String? name, image;

  String checkName(name) {
    if (name != null) return name;
    return "";
  }

  String checkImage(image) {
    if (image != null) return image;
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Stack(children: <Widget>[
        ClipPath(
          child: Container(
            height: 150,
            color: Colors.green,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 8,
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(checkImage(image)),
                  ),
                ),
              ),
              Text(
                checkName(name),
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

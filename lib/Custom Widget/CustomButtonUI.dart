import 'package:flutter/material.dart';
import 'package:mentaltraining/Resources/color_resource.dart';

// ignore: must_be_immutable
class CustomButtonUI extends StatelessWidget {
  String? btnLabel;
  GestureTapCallback? onTap;
  Color? color;

  CustomButtonUI({
    Key? key,
    this.btnLabel,
    this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Center(
          child: Container(
              alignment: Alignment.center,
              height: 50.0,
              decoration: BoxDecoration(
                color: color!,
                borderRadius: BorderRadius.circular(40),
              ),
              width: MediaQuery.of(context).size.width,
              child: Text(
                btnLabel!,
                style: TextStyle(
                    color: AppColor.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )),
        ),
      ),
    );
  }
}

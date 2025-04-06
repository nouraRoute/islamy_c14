import 'package:flutter/material.dart';
import 'package:islamy_c14/common/app_colors.dart';

class BackGroundGradient extends StatelessWidget {
  const BackGroundGradient(
      {super.key, required this.child, required this.bgImage});
  final Widget child;
  final String bgImage;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        bgImage,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                stops: const [.5, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.blackColor.withOpacity(.7),
                  AppColors.blackColor
                ])),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
            ),
            Expanded(child: child)
          ],
        ),
      ),
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamy_c14/common/app_asset.dart';
import 'package:islamy_c14/common/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({required this.hintText, super.key, this.controller});
  final String hintText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              width: 15,
              height: 20,
              AppAsset.quranIcon,
              colorFilter:
                  ColorFilter.mode(AppColors.mainColor, BlendMode.srcIn),
            ),
          ),
          fillColor: AppColors.blackColor.withOpacity(.7),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.mainColor)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.mainColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.mainColor))),
    );
  }
}

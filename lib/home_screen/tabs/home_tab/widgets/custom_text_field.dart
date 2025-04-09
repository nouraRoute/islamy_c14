import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamy_c14/common/app_asset.dart';
import 'package:islamy_c14/common/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {this.suffix,
      required this.hintText,
      super.key,
      this.controller,
      this.onChanged});
  final String hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.white.withOpacity(.5),
              fontWeight: FontWeight.w600,
              fontSize: 16),
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
          suffix: suffix,
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

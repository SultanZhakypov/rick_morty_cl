import 'package:flutter/material.dart';
import 'package:rick_morty/resources/app_colors.dart';

abstract class AppTextStyle {
  static const textfieldStyle = TextStyle(
    color: AppColors.backgroundColor,
    fontSize: 16,
    letterSpacing: 0.44,
  );
  static const textfieldhintStyle = TextStyle(
    color: AppColors.hintColor,
    fontSize: 16,
    letterSpacing: 0.44,
  );
  static const speciesAndGenderStyle = TextStyle(
    color: AppColors.hintColor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );
  static const nameStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );
  static const buttonStyleSettings = TextStyle(
    color: Colors.blue,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );
  static const nameDetailStyle = TextStyle(
    color: Colors.white,
    fontSize: 32,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
  static const statusStyle = TextStyle(
    color: AppColors.hintColor,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
  );
  static const detailscreenTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 14,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w400,
  );
  static const errorstateText = TextStyle(
    color: AppColors.hintColor,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.5,
  );
  static const errorstateText2 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0.15,
  );
  static const textApperanceOverline = TextStyle(
    color: Color(0xff5b6975),
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
  );
  static const textApperanceSubtitle = TextStyle(
    color: Color(0xffffffff),
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );
}

import 'package:bloc_clean_tdd_demo/core/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final textStyleTitle = TextStyle(
  // fontFamily: 'ProximaNova',
  fontWeight: FontWeight.bold,
  fontSize: 40.sp,
);

final appBarTitleStyle = TextStyle(
  // fontFamily: 'ProximaNova',
  fontWeight: FontWeight.bold,
  fontSize: 20.sp,
);
final textStyle16Medium = TextStyle(
  // fontFamily: 'ProximaNova',
  fontWeight: FontWeight.w500,
  fontSize: 16.sp,
);
final textStyle16Bold = TextStyle(
  // fontFamily: 'ProximaNova',
  fontWeight: FontWeight.bold,
  fontSize: 16.sp,
);
final textStyle16 = TextStyle(
  // fontFamily: 'ProximaNova',
  fontSize: 16.sp,
);
final textStyle14 = TextStyle(
  // fontFamily: 'ProximaNova',
  fontSize: 14.sp,
);
final textStyle15 = TextStyle(
  // fontFamily: 'ProximaNova',
  fontSize: 15.sp,
);
final textStyle13 = TextStyle(
  // fontFamily: 'ProximaNova',
  fontSize: 13.sp,
);

final textStyle14Medium = TextStyle(
    // fontFamily: 'ProximaNova',
    fontSize: 14.sp,
    fontWeight: FontWeight.w400);

final textStyle14semiBold = TextStyle(
    fontFamily: 'ProximaNova', fontSize: 14.sp, fontWeight: FontWeight.w600);

final textStyle14SemiBold = TextStyle(
  // fontFamily: 'ProximaNova',
  fontSize: 14.sp,
  fontWeight: FontWeight.w600,
);
final textStyle15Bold = TextStyle(
  // fontFamily: 'ProximaNova',
  fontSize: 15.sp,
  fontWeight: FontWeight.bold,
);

final textStyle12 = TextStyle(
  // fontFamily: 'ProximaNova',
  fontSize: 12.sp,
);

final textStyle11 = TextStyle(
  // fontFamily: 'ProximaNova',
  fontSize: 11.sp,
);

final textStyle20 = TextStyle(
  // fontFamily: 'ProximaNova',
  fontSize: 20.sp,
);

final textStyle18 = TextStyle(fontSize: 18.sp);

final textStyle18SemiBold = TextStyle(
    //fontFamily: 'ProximaNova',
    fontSize: 18.sp,
    fontWeight: FontWeight.w600);

final textStyle20Bold = TextStyle(
  //fontFamily: 'ProximaNova',
  fontSize: 20.sp, fontWeight: FontWeight.bold,
);

final textStyle40Bold = TextStyle(
  //fontFamily: 'ProximaNova',
  fontSize: 40.sp, fontWeight: FontWeight.bold,
);

final primaryTextButtonTheme = TextButton.styleFrom(
  backgroundColor: AppColors.primaryColor,
  foregroundColor: Colors.white,
  // fixedSize: Size(ScreenUtil().screenWidth, 48.h),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
  textStyle: TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  ),
);
final primaryElevatedButtonTheme = ElevatedButton.styleFrom(
  // elevation: 0,
  backgroundColor: AppColors.primaryColor,
  foregroundColor: Colors.white,
  fixedSize: Size(ScreenUtil().screenWidth, 48.h),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
  textStyle: TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  ),
);

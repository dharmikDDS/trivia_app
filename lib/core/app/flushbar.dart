import 'package:another_flushbar/flushbar.dart';
import 'package:bloc_clean_tdd_demo/core/app/app_colors.dart';
import 'package:bloc_clean_tdd_demo/core/app/text_styles.dart';
import 'package:flutter/material.dart';

Flushbar flushbar({
  required String description,
  Color backgroundColor = AppColors.black,
  int duration = 2,
}) =>
    Flushbar(
      messageText: Text(
        description,
        style: textStyle16Bold.copyWith(color: AppColors.white),
      ),
      margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
      padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 15.0),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      backgroundColor: backgroundColor.withOpacity(0.8),
      duration: Duration(seconds: duration),
      isDismissible: true,
      flushbarPosition: FlushbarPosition.BOTTOM,
      barBlur: 2.0,
    );

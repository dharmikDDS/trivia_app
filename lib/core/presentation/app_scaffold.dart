import 'package:bloc_clean_tdd_demo/core/app/app_colors.dart';
import 'package:bloc_clean_tdd_demo/core/app/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.child,
    this.actions,
    this.title,
  });

  final Widget child;
  final List<Widget>? actions;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor.withAlpha(50),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.transperent,
        title: Text(title ?? 'Number Trivia App', style: appBarTitleStyle),
        actions: actions ?? [],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: child,
      ),
    );
  }
}

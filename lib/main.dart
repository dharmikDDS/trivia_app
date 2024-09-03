import 'package:bloc_clean_tdd_demo/core/app/app_colors.dart';
import 'package:bloc_clean_tdd_demo/core/app/hive_helper.dart';
import 'package:bloc_clean_tdd_demo/core/app/routes.dart';
import 'package:bloc_clean_tdd_demo/features/main_injection_container.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/presentation/blocs/number_trivia_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveHelper.instance.init();
  await Injectioncontainer().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NumberTriviaBloc>(
      create: (context) => GetIt.I<NumberTriviaBloc>(),
      child: ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (context, _) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.dark,
                    statusBarColor: Colors.transparent,
                  ),
                ),
                colorScheme: ColorScheme.fromSeed(
                  seedColor: AppColors.primaryColor,
                ),
                useMaterial3: true,
              ),
              routerConfig: AppNavigator.router,
            );
          }),
    );
  }
}

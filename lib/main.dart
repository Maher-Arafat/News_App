// ignore_for_file: avoid_print

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/layout/news_app/newslaout.dart';
import 'package:newapp/network/local/cach_helper.dart';
import 'package:newapp/network/remote/dio_helper.dart';
import 'package:newapp/shared/components/constants.dart';
import 'package:newapp/shared/cubit/appcubit/cubit.dart';
import 'package:newapp/shared/cubit/appcubit/states.dart';
import 'package:newapp/shared/bloc_oserver.dart';
import 'package:newapp/shared/styles/themes.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'shared/cubit/newcubit/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows)
    await DesktopWindow.setMinWindowSize(
      Size(
        350,
        650,
      ),
    );
  Bloc.observer = MyBlocObserver();
  NDioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getBool(key: 'isDark');

  bool? Onboarding = CacheHelper.getData(key: 'OnBoarding');
  token = CacheHelper.getData(key: 'token');
  print(token);

  runApp(MyApp(
    isDark: isDark,
    startWidget: null,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget? startWidget;

  const MyApp({super.key, required this.isDark, required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AppCubit()..changeModeState(darkfromShared: isDark),
        ),
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getSports()
            ..getScience(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: Directionality(
              textDirection: TextDirection.ltr,
              child: newsLayout(),
            ),
          );
        },
      ),
    );
  }
}

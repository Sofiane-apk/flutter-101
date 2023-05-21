import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/layout/todo-app/to-do-layout.dart';
import 'package:flutter_application_1/modules/bmi_screen/bmi_screen.dart';
import 'package:flutter_application_1/modules/messengerscreen/messangerscreen.dart';
import 'package:flutter_application_1/modules/userscreen/user_screen.dart';
import 'package:flutter_application_1/shared/Network/Locale/cach_helper.dart';
import 'package:flutter_application_1/shared/Network/Remote/dio_helper.dart';
import 'package:flutter_application_1/shared/cubit/cubit.dart';
import 'package:flutter_application_1/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/news_app/news_layout.dart';
import 'modules/bmi_screen_result/bmi_screen_result.dart';
import 'modules/loginscreen/loginscreen.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // يتأكد أن كل شيء جاهز في mthod main و بعدها يقوم برفع  الأبليكيشن 
  // Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashHelper.init();
  bool isDark = CashHelper.getBoolean(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          AppCubit()..changeAppMode(fromShared: isDark),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) => () {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange,
                ),
                scaffoldBackgroundColor: Colors.white,
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  elevation: 20.0,
                ),
                appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.black),
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
                textTheme: const TextTheme(
                    bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ))),
            darkTheme: ThemeData(
                appBarTheme: const AppBarTheme(
                  backgroundColor: Color.fromARGB(255, 89, 95, 99),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                ),
                scaffoldBackgroundColor: const Color.fromARGB(255, 89, 95, 99),
                primarySwatch: Colors.deepOrange,
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange,
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Color.fromARGB(255, 89, 95, 99),
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  elevation: 20.0,
                ),
                textTheme: const TextTheme(
                    bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ))),
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}

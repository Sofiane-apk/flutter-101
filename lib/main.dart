import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/layout/todo-app/to-do-layout.dart';
import 'package:flutter_application_1/modules/shop_app/on_boarding_screen/on_boarding_screen.dart';

import 'package:flutter_application_1/shared/Network/Locale/cach_helper.dart';
import 'package:flutter_application_1/shared/Network/Remote/dio_helper.dart';
import 'package:flutter_application_1/shared/cubit/cubit.dart';
import 'package:flutter_application_1/shared/cubit/states.dart';
import 'package:flutter_application_1/shared/styles/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/news_layout.dart';


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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getbusiness()
            ..getScience()
            ..getSports(),
        ),
        BlocProvider(
          create: (context) => AppCubit()..changeAppMode(fromShared: isDark),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) => () {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lighttheme,
            darkTheme: darktheme,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: OnBoardingScreen(),
          );
        },
      ),
    );
  }
}

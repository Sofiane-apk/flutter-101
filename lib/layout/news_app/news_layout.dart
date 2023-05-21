import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/layout/news_app/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/Search/search_screen.dart';
import '../../shared/Network/Locale/cach_helper.dart';
import '../../shared/Network/Remote/dio_helper.dart';
import '../../shared/component/components.dart';
import '../../shared/cubit/cubit.dart';
import 'cubit/states.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()
        ..getbusiness()
        ..getScience()
        ..getSports(),
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) => {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text('News App'),
                actions: [
                  IconButton(
                      onPressed: () {
                        navigateTo(context, SearchScreen());
                      },
                      icon: Icon(
                        Icons.search,
                      )),
                  IconButton(
                      onPressed: () {
                        AppCubit.get(context).changeAppMode();
                      },
                      icon: Icon(
                        Icons.brightness_4_outlined,
                      )),
                ],
              ),
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                items: cubit.bottomItems,
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeBottomNavBar(index);
                },
              ),
            );
          }),
    );
  }
}

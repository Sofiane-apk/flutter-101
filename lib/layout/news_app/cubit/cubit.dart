import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/news_app/cubit/states.dart';



import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../modules/news_app/buisnesse/buisness_screen.dart';
import '../../../modules/news_app/science/science_screen.dart';
import '../../../modules/news_app/sports/sports_screen.dart';
import '../../../shared/Network/Remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'buisness'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
  List<Widget> screens = [
    BuisnessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;

    if (index == 1) getSports();
    if (index == 2) getScience();
    emit(NewsButtomNavState());
  }

////---------------- business----------------- //-
  List<dynamic> business = [];
  void getbusiness() {
    emit(NewsGetbusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': 'b98ce195c64d452ebb7caa8eced97e0f'
      },
    ).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetbusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetbusinessErrorState(error.toString()));
    });
  }

////---------------- Sports----------------- //-
  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': 'b98ce195c64d452ebb7caa8eced97e0f'
      },
    ).then((value) {
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  ////---------- Science-------------- /////-
  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'Science',
        'apiKey': 'b98ce195c64d452ebb7caa8eced97e0f'
      },
    ).then((value) {
      science = value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  ////---------- Search-------------- /////-
  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsGetScienceLoadingState());

    DioHelper.getData(
      url: 'v2/everything',
      query: {'q': '$value', 'apiKey': 'b98ce195c64d452ebb7caa8eced97e0f'},
    ).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/shop_app/login/cubit/states.dart';
import 'package:flutter_application_1/shared/Network/Remote/dio_helper2.dart';
import 'package:flutter_application_1/shared/Network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());
  static ShopLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(
      url: 'login',
      data: {'email': email, 'password': password},
    ).then((value) {
      print(value.data);

      emit(ShopLoginSuccessState());
    }).catchError((error) {
      emit(ShopLoginErrorState(error.toString()));
    });
  }
}




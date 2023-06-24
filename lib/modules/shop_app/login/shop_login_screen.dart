import 'package:buildcondition/buildcondition.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/modules/shop_app/login/cubit/cubit.dart';
import 'package:flutter_application_1/modules/shop_app/login/cubit/states.dart';
import 'package:flutter_application_1/shared/component/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Registartion/shop_register_screen.dart';

class ShopLoginScreen extends StatelessWidget {
  ShopLoginScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
        create: (BuildContext context) => ShopLoginCubit(),
        child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                  appBar: AppBar(),
                  body: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'LOGIN',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      ?.copyWith(color: Colors.black),
                                ),
                                Text(
                                  'Login now to browse our hot offer',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                defaultFormField(
                                    controller: emailController,
                                    type: TextInputType.emailAddress,
                                    onTap: (String value) {
                                      if (value.isEmpty) {
                                        return 'please entre your email adress';
                                      }
                                    },
                                    label: 'Email Adresse',
                                    prefix: Icons.email),
                                const SizedBox(
                                  height: 20,
                                ),
                                defaultFormField(
                                  controller: passwordController,
                                  type: TextInputType.visiblePassword,
                                  onTap: (String value) {
                                    if (value.isEmpty) {
                                      return 'please entre your password adress';
                                    }
                                  },
                                  label: 'password',
                                  prefix: Icons.lock_outline,
                                  suffix: Icons.visibility_outlined,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),

                                // ElevatedButton(
                                //   onPressed: () {
                                //     // Validate returns true if the form is valid, or false otherwise.
                                //     if (formKey.currentState!.validate()) {
                                //       // If the form is valid, display a snackbar. In the real world,

                                //       ShopLoginCubit.get(context).userLogin(
                                //         email: emailController.text,
                                //         password: passwordController.text,
                                //       );
                                //       // you'd often call a server or save the information in a database.
                                //       ScaffoldMessenger.of(context)
                                //           .showSnackBar(
                                //         const SnackBar(
                                //             content: Text('Processing Data')),
                                //       );
                                //     }
                                //   },
                                //   child: const Text('LOGIN'),
                                // ),

                                BuildCondition(
                                    condition: true,
                                    builder: (context) {
                                      return defaultButton(
                                        function: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            ShopLoginCubit.get(context)
                                                .userLogin(
                                              email: emailController.text,
                                              password: passwordController.text,
                                            );
                                          }
                                        },
                                        text: 'Login',
                                        isUpperCASE: true,
                                      );
                                    },
                                    fallback: (context) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }),
                                // ConditionalBuilder(
                                //   condition: state is! ShopLoginLoadingState,
                                //   builder: (context) => defaultButton(
                                //     function: () {
                                //       if (formKey.currentState!.validate()) {
                                //         ShopLoginCubit.get(context).userLogin(
                                //           email: emailController.text,
                                //           password: passwordController.text,
                                //         );
                                //       }
                                //     },
                                //     text: 'Login',
                                //     isUpperCASE: true,
                                //   ),
                                //   fallback: (context) => const Center(
                                //       child: CircularProgressIndicator()),
                                // ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Don\'t have account ?'),
                                    defaultTextButton(
                                        onPressed: () {
                                          // navigateTo(context, RegisterScreen());
                                        },
                                        text: 'Registartion'),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ));
            }));
  }
}

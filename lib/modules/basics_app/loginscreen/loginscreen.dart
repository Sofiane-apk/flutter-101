import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/component/components.dart';

class LoginScreen extends StatelessWidget {
  //LoginScreen({@required super.key});

  var formeKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Text('LoginScreen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email Adresse',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                  ),

//----------------------------------

                  defaultFormField(
                    onTap: () {  print("task");},
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      label: 'Password',
                      prefix: Icons.email,
                      suffix: Icons.remove_red_eye_outlined,
                      isPassword: true,
                      //   onSubmit: () {
                      //   print(emailController.text);
                      //   print(passwordController.text);
                      // },
                      // onChange: () {
                      //   print(emailController.text);
                      //   print(passwordController.text);
                      // },
                              ),
                  



//----------------------------------
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.blueAccent,
                    child: MaterialButton(
                      onPressed: () {
                        // ignore: avoid_print
                        print(emailController.text);

                        print(passwordController.text);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  defaultButton(
                    radius: 10,
                    text: 'Login',
                    function: () {
                      // ignore: avoid_print
                      print(emailController.text);

                      print(passwordController.text);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('don\'t have account ?'),
                      // TextButton(onPressed:func(), child: Text("Refistration"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

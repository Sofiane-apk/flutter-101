import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
 
 

 const  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
     var emailController= TextEditingController();
     var passwordController= TextEditingController();

    
    return Scaffold(
      appBar: AppBar(title: const Text('LoginScreen'),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Login',style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                ),
                ),
                const SizedBox(height: 50.0,),
                TextFormField(
                  controller: emailController,
                  keyboardType:TextInputType.emailAddress,
                
                    decoration:InputDecoration(labelText: 'Email Adresse',
                prefixIcon: const Icon(Icons.email),
                border:const  OutlineInputBorder(),
                
                 ),),
          
           const SizedBox(height: 10,),
          
            TextFormField(
              controller:passwordController,
                  keyboardType:TextInputType.visiblePassword,
                obscureText: true,
                    decoration:InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: const Icon(Icons.remove_red_eye,),
                border:const  OutlineInputBorder(),
                
                 ),),
            const SizedBox(height: 10,),
            Container(
              width: double.infinity,
              color: Colors.blueAccent,
              child: MaterialButton(onPressed: (){
                
              
                // ignore: avoid_print
                print(emailController.text);
              
              print(passwordController.text);
              },
              child: const Text('Login',
              style: TextStyle(
               fontSize: 20,
               color: Colors.white, 
              ),),),
            ),
               const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                 Text('don\'t have account ?'),
                // TextButton(onPressed:func(), child: Text("Refistration"))
              ],)
              ],
              
            ),
          ),
        ),
      )
    );
  }
}
import 'package:e_learning_app/widgets/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.3,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withOpacity(0.8),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                ),
              ),

              child: const Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.school,
                          size: 50,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'WelcomeBack!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),
                   ),
                ],
              ),
            ),

            Padding(
              padding:const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:  BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),

                   const SizedBox(height: 20),
                   TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: const Icon(Icons.visibility_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:  BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: (){},
                       child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        
                        ),
                       )
                       ),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: 'Login', 
                    onPressed: (){},
                    ),

                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: (){},
                         child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                         )
                         ),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
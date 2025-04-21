import 'package:e_learning_app/bloc/auth/auth_bloc.dart';
import 'package:e_learning_app/bloc/auth/auth_event.dart';
import 'package:e_learning_app/bloc/auth/auth_state.dart';
import 'package:e_learning_app/core/utils/validators.dart';
import 'package:e_learning_app/models/user_model.dart';
import 'package:e_learning_app/routes/app_routes.dart';
import 'package:e_learning_app/widgets/common/custom_button.dart';
import 'package:e_learning_app/widgets/common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void _handleLogin() {
    if (_formkey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        LoginRequested(email: _emailController.text, password: _passwordController.text),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error!), 
            backgroundColor: Colors.red
            ),
          );
        } else if (state.userModel != null) {
          if (state.userModel!.role == UserRole.teacher) {
            Get.offAllNamed(AppRoutes.teacherHome);
          } else {
            Get.offAllNamed(AppRoutes.main);
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
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
                          Icon(Icons.school, size: 50, color: Colors.white),
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
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          CustomTextfield(
                            label: 'Email',
                            prefixIcon: Icons.email_outlined,
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: FormValidator.validateEmail,
                          ),

                          const SizedBox(height: 20),
                          CustomTextfield(
                            label: 'Password',
                            prefixIcon: Icons.lock_outline,
                            controller: _passwordController,
                            obscureText: true,
                            validator: FormValidator.validatePassword,
                          ),

                          const SizedBox(height: 20),

                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed:
                                  () => Get.toNamed(AppRoutes.forgotPassword),
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              return CustomButton(
                                text: 'Login',
                                isFullWidth: true,
                                height: 50,
                                onPressed: _handleLogin,
                                isLoading: state.isLoading,
                              );
                            },
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey.shade300)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('Or Continue with'),
                        ),
                        Expanded(child: Divider(color: Colors.grey.shade300)),
                      ],
                    ),

                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _socialLoginButton(
                          icon: Icons.g_mobiledata,
                          onPressed: () {},
                        ),
                        _socialLoginButton(
                          icon: Icons.facebook,
                          onPressed: () {},
                        ),
                        _socialLoginButton(icon: Icons.apple, onPressed: () {}),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account?'),

                        TextButton(
                          onPressed: () => Get.toNamed(AppRoutes.register),
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialLoginButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return CustomButton(
      icon: icon,
      isFullWidth: false,
      height: 50,
      text: '',
      onPressed: onPressed,
      isOutlined: true,
    );
  }
}

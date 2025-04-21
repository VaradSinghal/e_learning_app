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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  UserRole? _selectedRole;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error!), backgroundColor: Colors.red),
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
                height: Get.height * 0.25,
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
                    bottomRight: Radius.circular(100),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 50,
                      left: 20,
                      child: IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Create Account',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 10),
                          Text(
                            'Start your learning journey',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
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
                            label: 'Full Name',
                            prefixIcon: Icons.person_outline,
                            controller: _fullNameController,
                            validator: FormValidator.validateFullName,
                          ),
                          const SizedBox(height: 20),
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
                            validator: FormValidator.validatePassword,
                            obscureText: true,
                          ),
                          const SizedBox(height: 20),
                          CustomTextfield(
                            label: 'Confirm Password',
                            prefixIcon: Icons.lock_outline,
                            controller: _confirmPasswordController,
                            obscureText: true,
                            validator:
                                (value) =>
                                    FormValidator.validateConfirmPassword(
                                      value,
                                      _passwordController.text,
                                    ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    DropdownButtonFormField<UserRole>(
                      decoration: InputDecoration(
                        labelText: 'Role',
                        prefixIcon: const Icon(Icons.person_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      value: _selectedRole,
                      items:
                          UserRole.values.map((UserRole role) {
                            return DropdownMenuItem<UserRole>(
                              value: role,
                              child: Text(
                                role.toString().split('.').last.capitalize!,
                              ),
                            );
                          }).toList(),
                      onChanged: (UserRole? value) {
                        setState(() {
                          _selectedRole = value;
                        });
                      },
                    ),

                    const SizedBox(height: 30),

                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return CustomButton(
                          text: 'Register',
                          isFullWidth: true,
                          onPressed: _handleRegister,
                          isLoading: state.isLoading,
                        );
                      },
                    ),

                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Login",
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

  void _handleRegister() {
    if (_formkey.currentState!.validate() && _selectedRole != null) {
      context.read<AuthBloc>().add(
        RegisterRequested(
          email: _emailController.text,
          password: _passwordController.text,
          fullName: _fullNameController.text,
          role: _selectedRole!,
        ),
      );
    } else if (_selectedRole == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a role'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

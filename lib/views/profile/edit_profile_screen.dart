import 'package:e_learning_app/bloc/profile/profile_bloc.dart';
import 'package:e_learning_app/bloc/profile/profile_state.dart';
import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:e_learning_app/views/profile/widgets/edit_profile_app_bar.dart';
import 'package:e_learning_app/views/profile/widgets/profile_picture_bottom_sheet.dart';
import 'package:e_learning_app/widgets/common/custom_button.dart';
import 'package:e_learning_app/widgets/common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:shimmer/shimmer.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final profile = context.read<ProfileBloc>().state.profile;
    if (profile != null) {
      _fullNameController.text = profile.fullName;
      _phoneController.text = profile.phoneNumber ?? '';
      _bioController.text = profile.bio ?? '';
    }
  }

  dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final profile = state.profile;

        if(profile == null) {
          return const Scaffold();
        }

        return Scaffold(
          appBar: EditProfileAppBar(
            onSave: () {
              Get.back();
            },
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.primary, AppColors.primaryLight],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    padding: const EdgeInsets.only(top: 20, bottom: 40),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: AppColors.accent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.primary,
                                  width: 3,
                                ),
                              ),
                              child: state.isPhotoUploading ? 
                              Shimmer.fromColors(
                                baseColor: AppColors.primary.withOpacity(0.3), 
                                highlightColor: AppColors.accent,
                                child: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 60,
                                ),
                                ) : CircleAvatar(
                                  radius: 60,
                                  backgroundColor: AppColors.accent,
                                  backgroundImage: profile.photoUrl != null
                                      ? NetworkImage(profile.photoUrl!)
                                      : null,
                                      child: profile.photoUrl == null ? Text(profile.fullName.split(' ').map((e)=> e[0]).take(2).join().toUpperCase(), style:Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold, 
                                      ) ) : null,
                                ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: CircleAvatar(
                                  backgroundColor: AppColors.accent,
                                  radius: 20,
                                  child: IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20),
                                          ),
                                        ),
                                        builder:
                                            (context) =>
                                                const ProfilePictureBottomSheet(),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.camera_alt,
                                      color: AppColors.primary,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Edit Your Profile',
                          style: Theme.of(
                            context,
                          ).textTheme.headlineSmall?.copyWith(
                            color: AppColors.accent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 16, left: 4),
                          child: Text(
                            'Personal Information',
                            style: Theme.of(
                              context,
                            ).textTheme.headlineSmall?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(20),
                          child:  Column(
                            children: [
                              CustomTextfield(
                                label: 'Full Name',
                                prefixIcon: Icons.person_outline,
                                controller: _fullNameController,
                              ),
                              const SizedBox(height: 16),
                              const CustomTextfield(
                                label: 'Email',
                                prefixIcon: Icons.email_outlined,
                                initialValue: 'john@gmail.com',
                                enabled: false,
                              ),
                              const SizedBox(height: 16),
                              CustomTextfield(
                                label: 'Phone',
                                prefixIcon: Icons.phone_outlined,
                               controller: _phoneController,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Padding(
                          padding: EdgeInsets.only(bottom: 16, left: 4),
                          child: Text(
                            'About You',
                            style: Theme.of(
                              context,
                            ).textTheme.headlineSmall?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(20),
                          child: CustomTextfield(
                            label: 'Bio',
                            prefixIcon: Icons.info_outline,
                            maxLines: 3,
                            controller: _bioController,
                          ),
                        ),
                        const SizedBox(height: 32),
                        CustomButton(
                          text: 'Save Changes',
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icons.check_circle_outline,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

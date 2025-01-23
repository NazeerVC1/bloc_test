import 'package:bloc_test/presentation/ui/pages/widgets/custom_button.dart';
import 'package:bloc_test/presentation/ui/pages/widgets/custom_text_field.dart';
import 'package:bloc_test/presentation/ui/pages/widgets/remember_me_checkbox.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final bool rememberMe;
  final ValueChanged<bool?> onRememberMeChanged;
  final VoidCallback onSubmit;
  final bool isLoading;

  const LoginForm({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.passwordController,
    required this.rememberMe,
    required this.onRememberMeChanged,
    required this.onSubmit,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            controller: usernameController,
            label: 'Username',
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter username';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: passwordController,
            label: 'Password',
            isPassword: true,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter password';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          RememberMeCheckbox(
            value: rememberMe,
            onChanged: onRememberMeChanged,
          ),
          const SizedBox(height: 24),
          CustomButton(
            onPressed: onSubmit,
            isLoading: isLoading,
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:bloc_test/core/constants/app_constants.dart';
import 'package:bloc_test/presentation/blocs/login/login_bloc.dart';
import 'package:bloc_test/presentation/blocs/login/login_event.dart';
import 'package:bloc_test/presentation/blocs/login/login_state.dart';
import 'package:bloc_test/presentation/ui/pages/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.login)),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginInvalidCredentials) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is LoginSuccess) {
            Navigator.of(context).pushReplacementNamed('/home');
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return LoginForm(
                  formKey: _formKey,
                  usernameController: _usernameController,
                  passwordController: _passwordController,
                  rememberMe: _rememberMe,
                  onRememberMeChanged: (value) {
                    setState(() {
                      _rememberMe = value ?? false;
                    });
                  },
                  onSubmit: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      context.read<LoginBloc>().add(
                            LoginSubmitted(
                                username: _usernameController.text,
                                password: _passwordController.text,
                                // rememberMe: _rememberMe,
                                languageId: 1),
                          );
                    }
                  },
                  isLoading: state is LoginLoading,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

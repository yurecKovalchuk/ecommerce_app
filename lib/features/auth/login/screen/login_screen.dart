import 'package:ecommerce_app/features/auth/auth.dart';
import 'package:ecommerce_app/theme/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/app.dart';
import '../../../../widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc get _bloc => BlocProvider.of<LoginBloc>(context);
  final bool _obscurePassword = true;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          _navigatorPushToHomeScreen(context);
        }
        if (state.status == LoginStatus.error) {
          showErrorDialog(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomBackButton(
                    onPressed: () {
                      _navigatorPushToWelcomeScreen(context);
                    },
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Welcome back! Glad\nto see you, Again!',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 32),
                  CustomInputField(
                    labelText: 'Enter your username',
                    controller: usernameController,
                  ),
                  const SizedBox(height: 16),
                  CustomInputField(
                    labelText: 'Enter your password',
                    controller: passwordController,
                    obscureText: _obscurePassword,
                    onChanged: (password) {},
                  ),
                  const SizedBox(height: 32),
                  CustomButton(
                    text: 'Login',
                    width: double.infinity,
                    backgroundColor: customDark,
                    onPressed: () {
                      _bloc.login(
                        username: usernameController.text,
                        password: passwordController.text,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _navigatorPushToWelcomeScreen(BuildContext context) {
    context.pushNamed(AppRoutInfo.welcomeScreen.name);
  }

  void _navigatorPushToHomeScreen(BuildContext context) {
    context.go(AppRoutInfo.homeScreen.path);
  }
}

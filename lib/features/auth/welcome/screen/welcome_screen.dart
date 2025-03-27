import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/app.dart';
import '../../../../theme/theme.dart';
import '../../../../widgets/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallDevice = size.height < 1000;

    return Scaffold(
      body: Stack(
        children: [
          if (isSmallDevice)
            Positioned.fill(
              child: Image.asset(
                backgroundWelcomeScreen,
                fit: BoxFit.cover,
              ),
            ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const Spacer(),
                  Image.asset(
                    logoBrand,
                    height: 64,
                    width: 64,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Fake Store',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: 'Login',
                      backgroundColor: customDark,
                      onPressed: () => _navigatorPushToLoginScreen(context),
                    ),
                  ),
                  SizedBox(height: size.height * 0.15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigatorPushToLoginScreen(BuildContext context) {
    context.pushNamed(AppRoutInfo.loginScreen.name);
  }
}

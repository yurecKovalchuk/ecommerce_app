import 'package:ecommerce_app/features/auth/welcome/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../domain/domain.dart';
import '../features/features.dart';
import '../injection.dart';
import 'app.dart';

class ApplicationWidget extends StatelessWidget {
  ApplicationWidget({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: AppRoutInfo.welcomeScreen.path,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoutInfo.homeScreen.path,
        name: AppRoutInfo.homeScreen.name,
        builder: (context, state) => BlocProvider(
          create: (_) => HomeBloc(),
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutInfo.loginScreen.path,
        name: AppRoutInfo.loginScreen.name,
        builder: (context, state) => BlocProvider(
          create: (_) => LoginBloc(
            authRepository: getIt<AuthRepository>(),
          ),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutInfo.cartScreen.path,
        name: AppRoutInfo.cartScreen.name,
        builder: (context, state) => BlocProvider(
          create: (_) => CartBloc(),
          child: const CartScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutInfo.productPageScreen.path,
        name: AppRoutInfo.productPageScreen.name,
        builder: (context, state) => BlocProvider(
          create: (_) => ProductPageBloc(),
          child: const ProductPageScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutInfo.wishlistScreen.path,
        name: AppRoutInfo.wishlistScreen.name,
        builder: (context, state) => BlocProvider(
          create: (_) => WishlistBloc(),
          child: const WishlistScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutInfo.welcomeScreen.path,
        name: AppRoutInfo.welcomeScreen.name,
        builder: (context, state) => WelcomeScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/app/app.dart';
import 'package:ecommerce_app/domain/domain.dart';
import 'package:ecommerce_app/features/features.dart';
import 'package:ecommerce_app/injection.dart';

import 'app_bloc/app_bloc.dart';
import 'app_bloc/app_state.dart';

class ApplicationWidget extends StatefulWidget {
  const ApplicationWidget({super.key});

  @override
  State<ApplicationWidget> createState() => _ApplicationWidgetState();
}

class _ApplicationWidgetState extends State<ApplicationWidget> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = _setupRouter();
  }

  GoRouter _setupRouter() => GoRouter(
        initialLocation: AppRoutInfo.homeScreen.path,
        debugLogDiagnostics: true,
        refreshListenable: _GoRouterRefreshStream(getIt<AppBloc>().stream),
        redirect: (context, state) => _handleRedirect(state),
        routes: [
          GoRoute(
            path: AppRoutInfo.homeScreen.path,
            name: AppRoutInfo.homeScreen.name,
            builder: (context, state) => BlocProvider(
              create: (_) => HomeBloc(
                productRepository: getIt<ProductRepository>(),
              ),
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
              create: (_) => CartBloc(
                localStorageRepository: getIt<LocalStorageRepository>(),
              ),
              child: const CartScreen(),
            ),
          ),
          GoRoute(
            path: '${AppRoutInfo.productPageScreen.path}/:id',
            name: AppRoutInfo.productPageScreen.name,
            builder: (context, state) => _buildProductPage(state),
          ),
          GoRoute(
            path: AppRoutInfo.wishlistScreen.path,
            name: AppRoutInfo.wishlistScreen.name,
            builder: (context, state) => BlocProvider(
              create: (_) => WishlistBloc(
                localStorageRepository: getIt<LocalStorageRepository>(),
                productRepository: getIt<ProductRepository>(),
              ),
              child: const WishlistScreen(),
            ),
          ),
          GoRoute(
            path: AppRoutInfo.welcomeScreen.path,
            name: AppRoutInfo.welcomeScreen.name,
            builder: (context, state) => const WelcomeScreen(),
          ),
        ],
      );

  String? _handleRedirect(GoRouterState state) {
    final status = getIt<AppBloc>().state.status;

    final isLoggingIn = state.matchedLocation == AppRoutInfo.loginScreen.path;
    final isWelcome = state.matchedLocation == AppRoutInfo.welcomeScreen.path;

    if (status == AppStatus.initial) return null;

    if (status == AppStatus.unauthenticated) {
      return isLoggingIn || isWelcome ? null : AppRoutInfo.welcomeScreen.path;
    }

    if (isLoggingIn || isWelcome) {
      return AppRoutInfo.homeScreen.path;
    }

    return null;
  }

  Widget _buildProductPage(GoRouterState state) {
    final id = int.tryParse(state.pathParameters['id'] ?? '') ?? 0;

    return BlocProvider(
      create: (_) => ProductPageBloc(
        productRepository: getIt<ProductRepository>(),
        productId: id,
      ),
      child: const ProductPageScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AppBloc>(),
      child: MaterialApp.router(
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        ),
      ),
    );
  }
}

class _GoRouterRefreshStream extends ChangeNotifier {
  _GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (_) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

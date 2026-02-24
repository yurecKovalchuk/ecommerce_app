class RouteData {
  final String name;
  final String path;

  const RouteData({
    required this.name,
    required this.path,
  });
}

abstract class AppRoutInfo {
  static const homeScreen = RouteData(
    name: 'home_screen',
    path: '/',
  );
  static const loginScreen = RouteData(
    name: 'login_screen',
    path: '/login',
  );
  static const cartScreen = RouteData(
    name: 'cart_screen',
    path: '/cart',
  );
  static const productPageScreen = RouteData(
    name: 'product_page_screen',
    path: '/product_page',
  );
  static const wishlistScreen = RouteData(
    name: 'wishlist_screen',
    path: '/wishlist',
  );
  static const welcomeScreen = RouteData(
    name: 'welcome_screen',
    path: '/welcome',
  );
}

import 'package:flutter/material.dart';
import 'package:myapp/providers/shopping_list_provider.dart';
import 'package:myapp/ui/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CartProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShopMe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: SafeArea(child: const HomePage()),
    );
  }
}



// API DOCS: https://fakeapi.platzi.com/en/rest/products/

// DESIGN : https://dribbble.com/shots/25506720-E-commerce-Mobile-App

// API fetching https://medium.com/@raphaelrat_62823/consuming-rest-api-in-flutter-a-guide-for-developers-2460d90320aa

// defautl Styling: https://medium.com/@kanellopoulos.leo/a-simple-way-to-organize-your-styles-themes-in-flutter-a0e7eba5b297

// Products styling: https://medium.com/design-bootcamp/building-beautiful-product-item-widget-in-flutter-a-step-by-step-guide-ed890a53cff4
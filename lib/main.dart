import 'package:flutter/material.dart';
import 'package:moc_2024_3/api_calls/api_calls_screen.dart';
import 'package:moc_2024_3/api_calls/product.dart';
import 'package:moc_2024_3/navigation/navigation_screen.dart';
import 'package:moc_2024_3/navigation/screen_a.dart';
import 'package:moc_2024_3/navigation/screen_b.dart';
import 'package:moc_2024_3/navigation/screen_c.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 30,
            color: Colors.orange,
          ),
          displayMedium: TextStyle(
            fontSize: 25,
            color: Colors.orange,
          ),
        ),
      ),
      routes: {
        '/': (context) => const ApiCallsScreen(),
        '/screenB': (context) => const ScreenB(),
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/screenC':
            final arguments = settings.arguments;
            if (arguments is Product) {
              return MaterialPageRoute(
                builder: (context) => ScreenC(product: arguments),
              );
            }
            break;
          default:
            return MaterialPageRoute(builder: (context) => const SizedBox());
        }
      },
      //home: const NavigationScreen(),
    );
  }
}

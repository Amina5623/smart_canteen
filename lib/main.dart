// import 'package:flutter/material.dart';
// import 'login_page.dart';
// import 'signup_page.dart';
// import 'home_page.dart';
// import 'order_page.dart';
// import 'cart_page.dart';
// import 'profile_page.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Canteen Management App',
//       debugShowCheckedModeBanner: false, // Remove the debug banner

//       theme: ThemeData(
//         primarySwatch: Colors.teal, // Use a predefined color swatch or your custom color
//         primaryColor: const Color.fromRGBO(14, 175, 186, 1), // Set the primary color
//         scaffoldBackgroundColor: Colors.white,

//         textTheme: const TextTheme(
//           displayLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 32), // Changed from headline1 to displayLarge
//           bodyMedium: TextStyle(color: Colors.black, fontSize: 16), // Changed from bodyText1 to bodyMedium
//         ),
//         appBarTheme: const AppBarTheme(
//           elevation: 0,
//           backgroundColor: Color.fromRGBO(14, 175, 186, 1), // Set consistent AppBar color
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
//             padding: const EdgeInsets.symmetric(vertical: 16),
//             backgroundColor: Color.fromRGBO(14, 175, 186, 1), // Use your primary color for buttons
//             foregroundColor: Colors.white,
//           ),
//         ),
//       ),
//       initialRoute: '/login',
//       routes: {
//         '/login': (context) => LoginPage(),
//         '/signup': (context) => SignUpPage(),
//         '/home': (context) => HomePage(),
//         '/order': (context) => OrderPage(),
//         '/cart': (context) => CartPage(),
//         '/profile': (context) => ProfilePage(),
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'home_page.dart';
import 'order_page.dart';
import 'cart_page.dart';
import 'profile_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Canteen Management App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: const Color.fromRGBO(14, 175, 186, 1),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 32),
          bodyMedium: TextStyle(color: Colors.black, fontSize: 16),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color.fromRGBO(14, 175, 186, 1),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Color.fromRGBO(14, 175, 186, 1),
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: AuthenticationWrapper(),
     routes: {
  '/login': (context) => LoginPage(),
  '/signup': (context) => SignUpPage(),
  '/home': (context) => HomePage(),
  '/order': (context) => OrderPage(),
  '/cart': (context) => CartPage(),
  '/profile': (context) => ProfilePage(),
}
,
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) {
            return LoginPage();
          }
          return HomePage();
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_screen.dart';
import 'coffee_quiz_screen.dart';
import 'settings_screen.dart';
import 'theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Bubblegum',
            theme: ThemeData(
              primarySwatch: Colors.brown,
              scaffoldBackgroundColor: themeProvider.backgroundColor,
              textTheme: GoogleFonts.bebasNeueTextTheme(
                Theme.of(context).textTheme,
              ),
            ),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Tip'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            const Image(
              image: AssetImage('assets/coffee_logo.png'),
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 10),
            const Text(
              'Coffee Tip',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CoffeeQuizScreen()),
                );
              },
              child: const Text('Kahve Oluştur'),
            ),
          ],
        ),
      ),
    );
  }
}

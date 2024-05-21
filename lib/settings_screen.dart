import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayarlar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Ayarlar Ekranı',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Arka Plan Rengini Seçin:',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            DropdownButton<Color>(
              value: Provider.of<ThemeProvider>(context).backgroundColor,
              onChanged: (Color? newColor) {
                if (newColor != null) {
                  Provider.of<ThemeProvider>(context, listen: false).setBackgroundColor(newColor);
                }
              },
              items: [
                DropdownMenuItem(
                  value: Colors.brown[100],
                  child: Container(
                    height: 20,
                    width: 100,
                    color: Colors.brown[100],
                  ),
                ),
                DropdownMenuItem(
                  value: Colors.brown[200],
                  child: Container(
                    height: 20,
                    width: 100,
                    color: Colors.brown[200],
                  ),
                ),
                DropdownMenuItem(
                  value: Colors.brown[300],
                  child: Container(
                    height: 20,
                    width: 100,
                    color: Colors.brown[300],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

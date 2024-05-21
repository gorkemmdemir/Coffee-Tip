import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  final VoidCallback onLoadComplete;

  LoadingScreen({required this.onLoadComplete});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() async {
    await Future.delayed(Duration(seconds: 2));
    widget.onLoadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Kahveniz oluşturuluyor...', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

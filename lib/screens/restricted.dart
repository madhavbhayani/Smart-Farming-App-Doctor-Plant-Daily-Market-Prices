import 'package:flutter/material.dart';

class RestrictedScreen extends StatelessWidget {
  const RestrictedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        title: const Text(
          'Visit Our Project For This Section',
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Lexend'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/restricted.png',
              scale: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text('This Feature is locked by the developer !'),
                  Text('Make sure you follow Galorithm-21 on Github'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

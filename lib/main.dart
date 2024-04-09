import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_theory/riverpod/provider_observer.dart';
import 'package:riverpod_theory/screen/home_screen.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [
        // 여러개도 가능
        Logger(),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    ),
  );
}

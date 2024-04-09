import 'package:flutter_riverpod/flutter_riverpod.dart';

// <int> 적어줘도 되고, 안해도 되고,,, 자동인식
final numberProvider = StateProvider<int>((ref) => 0);

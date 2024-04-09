import 'package:flutter/material.dart';

@immutable
class ShoppingItemModel {
  final String name;    // 제품명
  final int quantity;   // 개수
  final bool hasBought; // 구매했는지
  final bool isSpicy;   // 매운지


  /// 생성자
  const ShoppingItemModel({
    required this.name,
    required this.quantity,
    required this.hasBought,
    required this.isSpicy,
  });

  /// copyWith 생성자
  /// copyWith => 입력받은 값만 변경하고 남은 값들은 그대로 둔다
  ShoppingItemModel copyWith({
    String? name,
    int? quantity,
    bool? hasBought,
    bool? isSpicy,
  }) {
    return ShoppingItemModel(
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      hasBought: hasBought ?? this.hasBought,
      isSpicy: isSpicy ?? this.isSpicy,
    );
  }
}

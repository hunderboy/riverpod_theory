import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


/// 데이터 모니터링에 활용
class Logger extends ProviderObserver {
  // @override 를 할수 있는 3가지
  // didAddProvider
  // didDisposeProvider
  // didUpdateProvider


  /// Provider 가 Update 될때 마다 실행
  @override
  void didUpdateProvider(
      ProviderBase provider,
      Object? previousValue,
      Object? newValue,
      ProviderContainer container,
      ) {
    print(
      '[Provider Updated] provider : $provider / previousValue : $previousValue / newValue : $newValue / container : $container',
    );
  }


  /// Provider 가 새롭게 추가 되었을때
  @override
  void didAddProvider(
    ProviderBase provider, // 생성된 Provider
    Object? value,         // Provider 상태값
    ProviderContainer container, // Provider를 담고있는 Container (Flutter 사용시 신경 X)
  ) {
    print(
      '[Provider Added] provider : $provider / value : $value / container : $BoxFit.contain'
    );
  }

  /// Provider 가 삭제됐을때
  @override
  void didDisposeProvider(
    ProviderBase provider,  // 삭제된 Provider
    ProviderContainer containers, // Provider를 담고있는 Container (Flutter 사용시 신경 X)
  ) {
    print(
      '[Provider Disposed] provider : $provider / containers : $containers'
    );
  }
}

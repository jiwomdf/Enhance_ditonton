

import 'package:core/utils/encrypt/encrypt.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return list of Movie Model when the response code is 200', () {
    const inputString = "test";
    final String encryptStr = encrypt(inputString);
    expect(encryptStr, isNot(equals(inputString)));
  });
}
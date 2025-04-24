import 'package:flutter_test/flutter_test.dart';
import 'package:mini_github/presentation/core/formatter.dart';

void main() {
  test('format number should return correctly', () {
    expect(MyFormatter.numberFormatter(1000000), '1,000,000');
  });
}

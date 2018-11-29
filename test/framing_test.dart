import 'package:fluttery/framing.dart';
import 'package:test/test.dart';

void main() {
  test('How To: Generate Random Color', () {
    final randomColor = RandomColor.next();
    assert(randomColor != null);
    assert(randomColor.alpha == 0xFF);
  });
}

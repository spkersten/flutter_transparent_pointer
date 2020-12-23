import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transparent_pointer/src/transparent_pointer.dart';

import 'package:transparent_pointer/transparent_pointer.dart';

void main() {
  testWidgets("invisible to parent when transparent", (tester) async {
    await tester.pumpWidget(SizedBox(
      child: TransparentPointer(
        child: Container(
          color: Color(0xffff0000),
        ),
      ),
    ));

    final result = tester.hitTestOnBinding(tester.getCenter(find.byType(Container)));

    expect(result.path.any((element) => element.target == tester.renderObject(find.byType(Container))), true);
    expect(result.path.any((element) => element.target == tester.renderObject(find.byType(SizedBox))), false);
  });

  testWidgets("visible to parent when not transparent", (tester) async {
    await tester.pumpWidget(SizedBox(
      child: TransparentPointer(
        transparent: false,
        child: Container(
          color: Color(0xffff0000),
        ),
      ),
    ));

    final result = tester.hitTestOnBinding(tester.getCenter(find.byType(Container)));

    expect(result.path.any((element) => element.target == tester.renderObject(find.byType(Container))), true);
    expect(result.path.any((element) => element.target == tester.renderObject(find.byType(SizedBox))), true);
  });
}

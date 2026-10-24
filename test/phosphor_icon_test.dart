import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

void main() {
  test('icons are plain IconData in the style font', () {
    final icon = PhosphorIcons.house();
    expect(icon.fontFamily, 'PhosphorRegular');
    expect(icon.fontPackage, 'phosphor_flutter');
    expect(
      PhosphorIcons.house(PhosphorIconsStyle.bold).fontFamily,
      'PhosphorBold',
    );
  });

  testWidgets('duotone renders a secondary layer, other styles do not',
      (tester) async {
    Future<int> iconCount(PhosphorIconsStyle style) async {
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: PhosphorIcon(PhosphorIcons.acorn(style)),
        ),
      );
      return find
          .descendant(
              of: find.byType(PhosphorIcon), matching: find.byType(Opacity))
          .evaluate()
          .length;
    }

    expect(await iconCount(PhosphorIconsStyle.duotone), 1);
    expect(await iconCount(PhosphorIconsStyle.regular), 0);
  });
}

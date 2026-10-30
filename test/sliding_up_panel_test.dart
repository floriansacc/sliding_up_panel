/*
Name: Akshath Jain
Date: 3/18/19
Purpose: defines the package: grouped_buttons
Copyright: © 2019, Akshath Jain. All rights reserved.
Licensing: More information can be found here: https://github.com/akshathjain/sliding_up_panel/blob/master/LICENSE
*/

import 'package:flutter/material.dart' as legacy;
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

const Key _bodyKey = Key('body');

SlidingUpPanel _panel({PanelController? controller, bool parallax = false}) {
  return SlidingUpPanel(
    controller: controller,
    parallaxEnabled: parallax,
    panel: const SizedBox(),
    body: const SizedBox.expand(key: _bodyKey),
  );
}

void main() {
  // default test surface is 800x600
  testWidgets('body fills the space below a material_ui AppBar', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(appBar: AppBar(), body: _panel()),
      ),
    );

    expect(tester.getSize(find.byKey(_bodyKey)), const Size(800, 600 - 56));
    expect(tester.getTopLeft(find.byKey(_bodyKey)), const Offset(0, 56));
  });

  testWidgets('body fills the space below a package:flutter/material AppBar', (
    tester,
  ) async {
    await tester.pumpWidget(
      legacy.MaterialApp(
        home: legacy.Scaffold(appBar: legacy.AppBar(), body: _panel()),
      ),
    );

    expect(tester.getSize(find.byKey(_bodyKey)), const Size(800, 600 - 56));
  });

  testWidgets('body fills the screen without any Scaffold', (tester) async {
    await tester.pumpWidget(
      Directionality(textDirection: TextDirection.ltr, child: _panel()),
    );

    expect(tester.getSize(find.byKey(_bodyKey)), const Size(800, 600));
  });

  testWidgets('parallax translates the body without resizing it', (
    tester,
  ) async {
    final PanelController controller = PanelController();
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: _panel(controller: controller, parallax: true),
      ),
    );

    controller.panelPosition = 1.0;
    await tester.pump();

    // (maxHeight - minHeight) * parallaxOffset = (500 - 100) * 0.1
    expect(tester.getTopLeft(find.byKey(_bodyKey)), const Offset(0, -40));
    expect(tester.getSize(find.byKey(_bodyKey)), const Size(800, 600));
  });
}

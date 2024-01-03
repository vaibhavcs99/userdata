
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:userdata/presentation/widgets/user_details_row_widget.dart';

void main() {
  group('UserDetailsRowWidget Tests', () {
    late String title;
    late String description;

    setUp(() {
      title = 'First Name';
      description = 'Janet';
    });

    testWidgets('UserDetailsRowWidget rendered correctly', (tester) async {
      //Act
      await tester.pumpWidget(MaterialApp(
          home: UserDetailsRowWidget(title: title, description: description)));

      //Assert
      expect(find.text('$title :'), findsOneWidget);
      expect(find.text(description), findsOneWidget);
    });

    testWidgets('UserDetailsRowWidget should handle null values',
        (tester) async {
      //Act
      await tester.pumpWidget(MaterialApp(
          home: UserDetailsRowWidget(title: title, description: null)));

      //Assert
      expect(find.text('$title :'), findsOneWidget);
      expect(find.text(''), findsOneWidget);
    });
  });
}

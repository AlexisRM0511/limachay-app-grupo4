import 'package:flutter/material.dart';

class SueCase {
  final String subject;
  final List<String> images;
  final DateTime when;
  final String where;
  final String description;
  final String publisher;
  final bool iKnow;

  SueCase({
    required this.subject,
    this.images = const <String>[
      'https://drive.google.com/file/d/1CNdYR8afLltEr1xuHXNha6UTfg_nYmOs/view?usp=sharing',
    ],
    required this.when,
    required this.where,
    required this.description,
    required this.publisher,
    this.iKnow = false,
  });

  static List<SueCase> samples = List<SueCase>.generate(10, (index) =>
    SueCase(
      subject: 'Sue #$index',
      when: DateTime(2022, 1, 1),
      where: 'Calle $index',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      publisher: 'Publisher #$index',
    )
  );
}


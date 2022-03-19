import 'package:flutter/material.dart';

class UnknownStateScreen extends StatelessWidget {
  const UnknownStateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('An error occurred: unknown state.'),
    );
  }
}

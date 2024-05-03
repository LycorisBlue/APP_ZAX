import 'package:flutter/material.dart';

class ModifierCarte extends StatelessWidget {
  const ModifierCarte({super.key});

  @override
  Widget build(BuildContext context) {
    BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.height,
    );
    return Scaffold();
  }
}
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AppBarTittle extends StatelessWidget {
  const AppBarTittle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Movie App',
      style: TextStyle(
        color: ColorsConstants.grey,
      ),
    );
}
}
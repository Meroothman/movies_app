import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class BuildAppBarTittle extends StatelessWidget {
  const BuildAppBarTittle({super.key});

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
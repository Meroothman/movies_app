// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

final searchTextController = TextEditingController();

class SearchText extends StatelessWidget {
  const SearchText({
    super.key,
    required this.onChange,
    this.focusNode,
  });

  final Function(String? value) onChange;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: ColorsConstants.yellow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        focusNode: focusNode,
        controller: searchTextController,
        cursorColor: ColorsConstants.grey,
        decoration: const InputDecoration(
          hintText: 'Find your character',
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: ColorsConstants.grey,
          ),
        ),
        onChanged: onChange,
      ),
    );
  }
}

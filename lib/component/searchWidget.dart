import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.hint,
  });

  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: const Icon(
          Icons.search,
        ),
      ),
      onChanged: (text) {},
    );
  }
}

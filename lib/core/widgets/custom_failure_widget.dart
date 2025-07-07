import 'package:flutter/material.dart';

class CustomFailureWidget extends StatelessWidget {
  final String errorMessage;
  const CustomFailureWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessage, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}

import 'package:flutter/material.dart';

class LoadingWrapper extends StatelessWidget {
  final bool isLoaded;
  final Widget child;
  const LoadingWrapper({required this.isLoaded, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return isLoaded ? child : const Center(child: CircularProgressIndicator.adaptive());
  }
}

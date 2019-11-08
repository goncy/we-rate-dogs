import 'package:flutter/material.dart';

/// Loading page
class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).canvasColor,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
}

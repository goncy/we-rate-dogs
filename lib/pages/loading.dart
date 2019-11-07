import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).canvasColor,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
}

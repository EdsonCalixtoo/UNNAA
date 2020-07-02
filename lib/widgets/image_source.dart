import 'dart:io';

import 'package:flutter/material.dart';

class ImageSourceSheet extends StatelessWidget {
  ImageSourceSheet(this.onImageSelected);

  final Function(File) onImageSelected;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[

          ],
        );
      },
    );
  }
}

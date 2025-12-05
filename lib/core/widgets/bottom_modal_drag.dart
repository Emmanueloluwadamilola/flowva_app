
import 'package:flowva_app/core/resources/colors.dart';
import 'package:flutter/material.dart';

class BottomModalDragWidget extends StatelessWidget {
  const BottomModalDragWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
  
    return Center(
      child: Container(
        width: 100,
        height: 5,
        decoration: BoxDecoration(
          color: dragHandleColor,
          borderRadius: BorderRadius.circular(150),
        ),
      ),
    );
  }
}
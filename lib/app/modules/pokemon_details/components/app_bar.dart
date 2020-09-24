import 'package:flutter/material.dart';

class DetailsAppBar extends StatelessWidget with PreferredSizeWidget {
  final String name;

  DetailsAppBar(this.name);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Text(name, style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}

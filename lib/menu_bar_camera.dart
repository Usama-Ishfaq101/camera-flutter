import 'package:flutter/material.dart';

class MenuBarCamera extends StatefulWidget {
  const MenuBarCamera({Key? key}) : super(key: key);

  @override
  State<MenuBarCamera> createState() => _MenuBarCameraState();
}

class _MenuBarCameraState extends State<MenuBarCamera> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[700],
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.flash_on_rounded),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.swipe),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.grid_on_rounded,
          ),
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:routeradar/pages/menu.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final dynamic title;

  const CustomAppBar({
    super.key,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      toolbarHeight: 100,
      centerTitle: true,
      actions: [
        Container(
          margin: EdgeInsets.only(right: 10),
          child: IconButton(
              icon: Icon(HeroIcons.bars_4),
              onPressed: () {
                Get.to(
                  () => MenuPage(),
                  transition: Transition.rightToLeftWithFade,
                  duration: Duration(milliseconds: 1300),
                );
              }),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

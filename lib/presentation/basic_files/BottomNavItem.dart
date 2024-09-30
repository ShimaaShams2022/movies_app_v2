
import 'package:flutter/material.dart';

import 'utilities.dart';


class BottomNavItem extends BottomNavigationBarItem {
  BottomNavItem(
      String title,
      String iconPath,
      ) : super(
      icon: ImageIcon(AssetImage(getFullPathImage(iconPath))),
      label: title,
  );

}

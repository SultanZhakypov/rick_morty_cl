import 'package:flutter/cupertino.dart';
import 'package:rick_morty/feature/settings/presentation/pages/change_name_screen/change_name_screen.dart';
import 'package:rick_morty/feature/settings/presentation/pages/edit_screen/edit_screen.dart';
import 'package:rick_morty/feature/settings/presentation/pages/settings_screen/settings_screen.dart';

import '../pages/user_screen/user_screen.dart';

class RickMortyProvider extends ChangeNotifier {
  int currentIndex = 0;
  bool toListOrToGrid = false;

  List<Widget> pages = [
    const UserScreen(),
    const ChangeNameScreen(),
    const EditScreen(),
    const SettingsScreen(),
  ];

  void changeIcon() {
    toListOrToGrid = !toListOrToGrid;
    notifyListeners();
  }

  void currentindex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  Color? colorStatus(String statusColor) {
    switch (statusColor) {
      case 'Alive':
        return const Color(0xff43D049);
      case 'Dead':
        return const Color(0xffEB5757);
      case 'Unknown':
        return const Color(0xff22A2BD);
    }
    return const Color(0xff22A2BD);
  }
}

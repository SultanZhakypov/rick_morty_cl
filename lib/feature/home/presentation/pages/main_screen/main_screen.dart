import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty/feature/home/presentation/providers/rick_morty_provider.dart';
import 'package:rick_morty/resources/app_colors.dart';
import '../../../../../resources/resources.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<RickMortyProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: vm.pages[vm.currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: AppColors.backgroundColor,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: const TextStyle(color: Colors.yellow))),
        child: BottomNavigationBar(
          onTap: vm.currentindex,
          type: BottomNavigationBarType.fixed,
          currentIndex: vm.currentIndex,
          unselectedItemColor: AppColors.unselectedColorNavBar,
          fixedColor: AppColors.selectedColorNavBar,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Svgs.homepage,
                  color: vm.currentIndex == 0
                      ? AppColors.selectedColorNavBar
                      : AppColors.unselectedColorNavBar,
                ),
                label: 'Персонажи'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Svgs.location,
                  color: vm.currentIndex == 1
                      ? AppColors.selectedColorNavBar
                      : AppColors.unselectedColorNavBar,
                ),
                label: 'Локации'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Svgs.episodes,
                  color: vm.currentIndex == 2
                      ? AppColors.selectedColorNavBar
                      : AppColors.unselectedColorNavBar,
                ),
                label: 'Эпизоды'),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Svgs.settings,
                color: vm.currentIndex == 3
                    ? AppColors.selectedColorNavBar
                    : AppColors.unselectedColorNavBar,
              ),
              label: 'Настройки',
            ),
          ],
        ),
      ),
    );
  }
}

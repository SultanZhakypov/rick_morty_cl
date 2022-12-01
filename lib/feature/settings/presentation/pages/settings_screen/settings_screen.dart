import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_morty/resources/app_textstyle.dart';
import 'package:rick_morty/resources/extensions.dart';
import 'package:rick_morty/resources/resources.dart';

import '../../../../../resources/app_colors.dart';
import '../../../../home/presentation/widgets/cached_image.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: const Text('Настройки'),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: context.height),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height / 7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.textfieldColor,
                        radius: height / 20,
                        child: const CachedImage(imageUrl: Images.noAvatar),
                      ),
                      const SizedBox(width: 18),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: context.width / 2,
                            child: const Text(
                              'Oleg',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.speciesAndGenderStyle,
                            ),
                          ),
                          const Text(
                            'Rick',
                            style: AppTextStyle.speciesAndGenderStyle,
                          ),
                          const SizedBox(height: 3)
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        side: const BorderSide(color: Colors.blue),
                        backgroundColor: AppColors.backgroundColor),
                    onPressed: () {},
                    child: const Text(
                      'Редактировать',
                      style: AppTextStyle.buttonStyleSettings,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Divider(
                    color: AppColors.hintColor,
                  ),
                ),
                const Text(
                  'ВНЕШНИЙ ВИД',
                  style: AppTextStyle.speciesAndGenderStyle,
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: SvgPicture.asset(Svgs.themeIcon),
                  title: const Text(
                    'Темная тема',
                    style: AppTextStyle.nameStyle,
                  ),
                  subtitle: const Text(
                    'Включена',
                    style: AppTextStyle.speciesAndGenderStyle,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: ((context) {
                          return const _AppShowDialog();
                        }),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_right_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Divider(
                    color: AppColors.hintColor,
                  ),
                ),
                const Text(
                  'О ПРИЛОЖЕНИИ',
                  style: AppTextStyle.speciesAndGenderStyle,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концентрированной темной материи.',
                  style: AppTextStyle.detailscreenTextStyle,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Divider(
                    color: AppColors.hintColor,
                  ),
                ),
                const Text(
                  'ВЕРСИЯ ПРИЛОЖЕНИЯ',
                  style: AppTextStyle.speciesAndGenderStyle,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Rick Morty v1.0.0',
                  style: AppTextStyle.detailscreenTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AppShowDialog extends StatelessWidget {
  const _AppShowDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.backgroundColor,
      title: const Text('Темная тема'),
      contentPadding: const EdgeInsets.only(top: 12),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            _CheckBoxWidget(
              value: true,
              title: 'Выключена',
              onTap: () {},
            ),
            _CheckBoxWidget(
              value: false,
              title: 'Включена',
              onTap: () {},
            ),
            _CheckBoxWidget(
              value: false,
              title: 'Следовать настройкам системы',
              onTap: () {},
            ),
            _CheckBoxWidget(
              value: false,
              title: 'В режиме энергосбережения',
              onTap: () {},
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              context.router.pop();
            },
            child: const Text('ОТМЕНА'))
      ],
    );
  }
}

class _CheckBoxWidget extends StatelessWidget {
  const _CheckBoxWidget({
    Key? key,
    required this.value,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final bool value;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      onChanged: onTap(),
      title: Text(title),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}

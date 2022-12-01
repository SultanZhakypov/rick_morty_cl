import 'package:flutter/material.dart';
import 'package:rick_morty/resources/app_colors.dart';

import '../../../../../resources/app_textstyle.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: const Text('Изменить ФИО'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Имя'),
            const CustomTextFieldWidget(title: 'Имя'),
            const SizedBox(height: 15),
            const Text('Фамилия'),
            const CustomTextFieldWidget(title: 'Фамилия'),
            const SizedBox(height: 15),
            const Text('Отчество'),
            const CustomTextFieldWidget(title: 'Отчество'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {},
                child: const Text(
                  'Сохранить',
                  style: AppTextStyle.nameStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyle.nameStyle,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        hintText: title,
        hintStyle: AppTextStyle.textfieldhintStyle,
        fillColor: AppColors.textfieldColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rick_morty/resources/app_colors.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
        title: const Text('Редактировать профиль'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (() {}),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Center(
                  child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
              )),
              SizedBox(height: 10),
              Center(child: Text('Изменить фото')),
              SizedBox(height: 35),
              Text('ПРОФИЛЬ'),
              SizedBox(height: 10),
              Text('Изменить ФИО'),
              Text('Oleg'),
              SizedBox(height: 10),
              Text('Логин'),
              Text('Rick'),
            ],
          ),
        ),
      ),
    );
  }
}

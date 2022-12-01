import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/feature/home/domain/entities/person_entity.dart';
import 'package:rick_morty/feature/home/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:rick_morty/feature/home/presentation/bloc/search_bloc/search_event.dart';
import 'package:rick_morty/feature/home/presentation/pages/user_screen/user_screen.dart';
import 'package:rick_morty/resources/app_textstyle.dart';

import '../../../../resources/app_colors.dart';
import '../bloc/search_bloc/search_state.dart';

class CustomSearchScreen extends StatefulWidget {
  const CustomSearchScreen({super.key, required this.value2});

  final String value2;

  @override
  State<CustomSearchScreen> createState() => _CustomSearchScreenState();
}

class _CustomSearchScreenState extends State<CustomSearchScreen> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.value2;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PersonSearchBloc>(context, listen: false)
        .add(SearchPersons(_controller.text));
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _controller,
              style: AppTextStyle.nameStyle,
              onChanged: (value) {
                BlocProvider.of<PersonSearchBloc>(context, listen: false)
                    .add(SearchPersons(_controller.text));
              },
              decoration: InputDecoration(
                hintText: 'Найти персонажа',
                hintStyle: AppTextStyle.textfieldhintStyle,
                prefixIcon: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.hintColor,
                  ),
                  onPressed: () {
                    context.router.pop();
                  },
                ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: AppColors.hintColor,
                  ),
                  onPressed: () {
                    _controller.clear();
                  },
                ),
                fillColor: AppColors.textfieldColor,
                filled: true,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'РЕЗУЛЬТАТЫ ПОИСКА',
                style: AppTextStyle.statusStyle,
              ),
            ),
            BlocBuilder<PersonSearchBloc, PersonSearchState>(
              builder: (context, state) {
                if (state is PersonSearchSuccess) {
                  if (state.persons.isEmpty) {
                    return const Center(child: Text('Загрузка'));
                  }
                  return Expanded(
                    child: ListView.separated(
                        itemCount:
                            state.persons.isNotEmpty ? state.persons.length : 0,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 24),
                        itemBuilder: (context, index) {
                          PersonEntity result = state.persons[index];
                          return ListItem(person: result);
                        }),
                  );
                }
                if (state is PersonSearchLoading ||
                    state is PersonSearchError) {
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) => const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        child: ShimmerLoadingList(),
                      ),
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

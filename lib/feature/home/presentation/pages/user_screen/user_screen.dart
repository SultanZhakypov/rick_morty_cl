import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty/feature/home/domain/entities/person_entity.dart';
import 'package:rick_morty/feature/home/presentation/bloc/person_cubit/person_cubit.dart';
import 'package:rick_morty/feature/home/presentation/providers/rick_morty_provider.dart';
import 'package:rick_morty/feature/home/presentation/widgets/cached_image.dart';
import 'package:rick_morty/resources/app_colors.dart';
import 'package:rick_morty/resources/app_textstyle.dart';
import 'package:rick_morty/resources/extensions.dart';
import 'package:rick_morty/resources/resources.dart';
import 'package:rick_morty/routes/app_routes.dart';
import 'package:shimmer/shimmer.dart';
import '../../bloc/person_cubit/person_state_cubit.dart';

part '../../widgets/app_bar.dart';
part '../user_screen/widgets/itemcard_widget.dart';
part '../user_screen/widgets/loading_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final scrollController = ScrollController();

  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          context.read<PersonListCubit>().loadingPerson();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);

    final vm = Provider.of<RickMortyProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: DefaultAppBar(),
      body: BlocBuilder<PersonListCubit, PersonState>(
        builder: (context, state) {
          List<PersonEntity> persons = [];
          bool isLoading = false;
          if (state is PersonLoadingState && state.isFirstFetch) {
            return vm.toListOrToGrid
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) => const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      child: ShimmerLoadingGrid(),
                    ),
                    itemCount: 6,
                  )
                : ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) => const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      child: ShimmerLoadingList(),
                    ),
                  );
          }
          if (state is PersonLoadingState) {
            persons = state.oldPersonsList;
            isLoading = true;
          }
          if (state is PersonSuccessState) {
            persons = state.personList;
          }
          if (state is PersonErrorState) {
            return Center(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 50),
                children: [
                  Image.asset(
                    Images.nodata,
                    height: 224,
                    width: 134,
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    'По данным фильтра ничего \n      не найдено',
                    style: AppTextStyle.errorstateText2,
                  )
                ],
              ),
            );
          }
          return vm.toListOrToGrid
              ? GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  itemCount: persons.length + (isLoading ? 1 : 0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    if (index < persons.length) {
                      return ListGridView(
                          key: const PageStorageKey(1), person: persons[index]);
                    } else {
                      Timer(const Duration(milliseconds: 30), (() {
                        scrollController
                            .jumpTo(scrollController.position.maxScrollExtent);
                      }));
                    }
                    return const ShimmerLoadingGrid();
                  })
              : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  itemCount: persons.length + (isLoading ? 1 : 0),
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 24);
                  },
                  itemBuilder: (context, index) {
                    if (index < persons.length) {
                      return ListItem(
                          key: const PageStorageKey(1), person: persons[index]);
                    } else {
                      Timer(const Duration(milliseconds: 30), () {
                        scrollController
                            .jumpTo(scrollController.position.maxScrollExtent);
                      });
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: ShimmerLoadingList(),
                      );
                    }
                  },
                );
        },
      ),
    );
  }
}

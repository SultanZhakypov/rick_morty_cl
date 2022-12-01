import 'package:auto_route/auto_route.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/feature/home/domain/entities/person_entity.dart';
import 'package:rick_morty/feature/home/presentation/providers/rick_morty_provider.dart';
import 'package:rick_morty/resources/app_colors.dart';
import 'package:rick_morty/resources/app_textstyle.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
    required this.person,
  }) : super(key: key);
  final PersonEntity person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverPersistentHeader(
                delegate: MySliverAppBar(
                  expandedHeight: 200,
                  image: person.image,
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                Center(
                  child: Text(
                    person.name,
                    style: AppTextStyle.nameDetailStyle,
                  ),
                ),
                const SizedBox(height: 4),
                Center(
                  child: Text(
                    person.status.toUpperCase(),
                    style: AppTextStyle.statusStyle.copyWith(
                      color: context
                          .read<RickMortyProvider>()
                          .colorStatus(person.status),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Пол',
                          style: AppTextStyle.speciesAndGenderStyle,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          person.gender,
                          style: AppTextStyle.detailscreenTextStyle,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Расса',
                          style: AppTextStyle.speciesAndGenderStyle,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          person.species,
                          style: AppTextStyle.detailscreenTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  MySliverAppBar({
    required this.expandedHeight,
    required this.image,
  });
  final double expandedHeight;
  final String image;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ).blurred(
          blur: 2.5,
          blurColor: Colors.black,
          colorOpacity: 0.3,
        ),
        Positioned(
          top: 10,
          left: 10,
          child: IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 2 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 3,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: CircleAvatar(
              radius: 83,
              backgroundColor: AppColors.backgroundColor,
              child: CircleAvatar(
                radius: 73,
                backgroundImage: NetworkImage(image),
                child: const SizedBox(
                  height: 146,
                  width: 146,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;
  @override
  double get minExtent => kToolbarHeight;
  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

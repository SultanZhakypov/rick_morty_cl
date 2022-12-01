part of '../pages/user_screen/user_screen.dart';

class DefaultAppBar extends StatelessWidget with PreferredSizeWidget {
  DefaultAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<RickMortyProvider>(context);
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            children: [
              const SizedBox(
                height: 48,
                child: DefaultTextField(),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<PersonListCubit, PersonState>(
                      builder: (context, state) {
                    if (state is PersonLoadingState ||
                        state is PersonErrorState) {
                      return const Text(
                        'ВСЕГО ПЕРСОНАЖЕЙ : ',
                        style: AppTextStyle.statusStyle,
                      );
                    }
                    if (state is PersonSuccessState) {
                      return Text(
                        'ВСЕГО ПЕРСОНАЖЕЙ : ${state.personList.length.toString()}',
                        style: AppTextStyle.statusStyle,
                      );
                    }

                    return const Text(
                      'ВСЕГО ПЕРСОНАЖЕЙ : ',
                      style: AppTextStyle.statusStyle,
                    );
                  }),
                  IconButton(
                    onPressed: () {
                      vm.changeIcon();
                    },
                    icon: vm.toListOrToGrid
                        ? SvgPicture.asset(Svgs.toListView)
                        : SvgPicture.asset(Svgs.togridview),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(140);
}

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: ((value) {
        context.router.push(CustomSearchScreenRoute(value2: value));
      }),
      style: AppTextStyle.nameStyle,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        hintText: 'Найти персонажа',
        hintStyle: AppTextStyle.textfieldhintStyle,
        prefixIcon: IconButton(
          icon: SvgPicture.asset(Svgs.search),
          onPressed: () {},
        ),
        suffixIcon: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            const VerticalDivider(
              color: AppColors.hintColor,
              indent: 14,
              endIndent: 14,
              width: 3,
            ),
            const SizedBox(height: 14),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(Svgs.filter),
            ),
          ],
        ),
        fillColor: AppColors.textfieldColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}

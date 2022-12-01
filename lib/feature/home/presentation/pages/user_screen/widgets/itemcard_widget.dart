part of '../user_screen.dart';

class ListGridView extends StatelessWidget {
  const ListGridView({
    Key? key,
    required this.person,
  }) : super(key: key);

  final PersonEntity person;

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<RickMortyProvider>(context);
    double height = context.height;
    double width = context.width;
    return GestureDetector(
      onTap: () => context.router.push(DetailScreenRoute(person: person)),
      child: SizedBox(
        height: height / 2,
        width: width / 2,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.textfieldColor,
              radius: height / 15,
              child: CachedImage(imageUrl: person.image),
            ),
            const SizedBox(height: 17),
            Text(
              person.status.toUpperCase(),
              style: AppTextStyle.statusStyle.copyWith(
                color: vm.colorStatus(person.status),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              person.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.nameStyle,
            ),
            const SizedBox(height: 5),
            Text(
              '${person.species} ${person.gender}',
              style: AppTextStyle.speciesAndGenderStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.person,
  }) : super(key: key);

  final PersonEntity person;

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;

    final vm = Provider.of<RickMortyProvider>(context);
    return GestureDetector(
      onTap: () => context.router.push(DetailScreenRoute(person: person)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: height / 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.textfieldColor,
                    radius: height / 20,
                    child: CachedImage(imageUrl: person.image),
                  ),
                  const SizedBox(width: 18),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 3),
                      Text(
                        person.status.toUpperCase(),
                        style: AppTextStyle.statusStyle.copyWith(
                          color: vm.colorStatus(person.status),
                        ),
                      ),
                      SizedBox(
                        width: context.width / 2,
                        child: Text(
                          person.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.nameStyle,
                        ),
                      ),
                      Text(
                        '${person.species} ${person.gender}',
                        style: AppTextStyle.speciesAndGenderStyle,
                      ),
                      const SizedBox(height: 3)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

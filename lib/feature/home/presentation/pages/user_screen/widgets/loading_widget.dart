part of '../user_screen.dart';

class ShimmerLoadingList extends StatelessWidget {
  const ShimmerLoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 3000),
      baseColor: AppColors.textfieldColor,
      highlightColor: AppColors.hintColor,
      child: SizedBox(
        height: height / 7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(radius: height / 20),
            const SizedBox(width: 18),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2),
                Container(
                  color: Colors.white,
                  height: height / 50,
                  width: width / 10,
                ),
                Container(
                  color: Colors.white,
                  height: height / 50,
                  width: width / 3,
                ),
                Container(
                  color: Colors.white,
                  height: height / 60,
                  width: width / 7,
                ),
                const SizedBox(height: 3),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerLoadingGrid extends StatelessWidget {
  const ShimmerLoadingGrid({super.key});

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 3000),
      baseColor: AppColors.textfieldColor,
      highlightColor: AppColors.hintColor,
      child: SizedBox(
        height: height / 2,
        width: width / 2,
        child: Column(
          children: [
            CircleAvatar(
              radius: height / 15,
            ),
            const SizedBox(height: 17),
            Container(
              color: Colors.white,
              height: height / 50,
              width: width / 10,
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.white,
              height: height / 50,
              width: width / 3,
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.white,
              height: height / 60,
              width: width / 7,
            ),
          ],
        ),
      ),
    );
  }
}

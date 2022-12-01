import 'package:flutter/cupertino.dart';

extension AppSize on BuildContext {
  get height => MediaQuery.of(this).size.height;
  get width => MediaQuery.of(this).size.width;
}

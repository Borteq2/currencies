import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

void badNavigation(Object? previousIndex, BuildContext context, int thisPageIndex) {
  try {
    switch (previousIndex) {
      case 0:
        Navigator.pushNamed(context, '/', arguments: thisPageIndex);
        break;
      case 1:
        Navigator.pushNamed(context, '/favorites',
            arguments: thisPageIndex);
        break;
      case 2:
        Navigator.pushNamed(context, '/list', arguments: thisPageIndex);
        break;
      case 3:
        Navigator.pushNamed(context, '/crypto',
            arguments: thisPageIndex);
        break;
      default:
        GetIt.I<Talker>().error('WRONG BOTTOM NAV INDEX');
    }
  } catch (e, st) {
    GetIt.instance<Talker>().handle(e, st);
  }
}
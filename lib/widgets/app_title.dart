import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';

class AppTtile extends StatefulWidget {
  const AppTtile({super.key});

  @override
  State<AppTtile> createState() => _AppTtileState();
}

class _AppTtileState extends State<AppTtile> {
  final String _appTtile = "PokeDex";
  final String _imagePath = "images/pokeball.png";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.getGetTitleWidgetHeight(),
      child: Stack(
        children: [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _appTtile,
                style: Constans.getTitleTextStyle(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              _imagePath,
              width: ScreenUtil().orientation == Orientation.portrait
                  ? 0.2.sh
                  : 0.2.sw,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}

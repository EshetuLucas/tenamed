import 'package:flutter/material.dart';
import 'package:health/ui/shared/app_colors.dart';
import 'package:health/ui/shared/shared_styles.dart';

class ActionsItem extends StatelessWidget {
  const ActionsItem({
    required this.title,
    required this.iconData,
    this.hasTrailingIcon = true,
    this.iconColor = kcPrimaryColor,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String title;
  final void Function()? onTap;
  final IconData iconData;
  final bool hasTrailingIcon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 1),
      onTap: onTap,
      horizontalTitleGap: 2,
      leading: Icon(
        iconData,
        color: iconColor,
      ),
      title: Text(
        title,
        style: ktsDarkSmallTextStyle,
      ),
      trailing: hasTrailingIcon
          ? Icon(
              Icons.navigate_next_sharp,
              color: kcPrimaryColor,
            )
          : null,
    );
  }
}

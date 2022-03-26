import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/ui/shared/app_colors.dart';
import 'package:health/ui/shared/ui_helpers.dart';
import 'package:health/ui/widgets/dumb_widgets/input_field.dart';
import 'package:stacked/stacked.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChange;
  final Function()? onClose;
  final String placeHolder;
  const SearchBar({
    this.onChange,
    required this.loading,
    required this.controller,
    this.placeHolder = 'Search for medicines',
    this.onClose,
    Key? key,
  }) : super(key: key);

  final bool loading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: SkeletonLoader(
          startColor: kcAppBackgroundColor.withOpacity(0.5),
          endColor: kcAppBackgroundColor,
          loading: loading,
          child: InputField(
            boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.all(
              Radius.circular(50),
            )),
            prefixIcon: Icon(
              CupertinoIcons.search,
              color: kcPrimaryColor,
              size: 20,
            ),
            textInputAction: TextInputAction.done,
            onChanged: onChange,
            controller: controller,
            placeholder: placeHolder,
            hasFocusedBorder: false,
            hasInputDecoration: false,
            maxLine: 1,
            suffixIcon: controller.text.isNotEmpty
                ? GestureDetector(
                    onTap: onClose,
                    child: Icon(
                      CupertinoIcons.clear,
                      color: kcPrimaryColor,
                      size: 20,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

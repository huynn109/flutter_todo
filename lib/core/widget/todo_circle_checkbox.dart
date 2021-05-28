import 'package:flutter/material.dart';

class CircularCheckBox extends StatelessWidget {
  final bool? isChecked;
  final Widget? checkedWidget;
  final Widget? uncheckedWidget;
  final Color? checkedColor;
  final Color? uncheckedColor;
  final Color? borderColor;
  final double? size;
  final Duration? animationDuration;
  final Function onChange;

  const CircularCheckBox({
    Key? key,
    this.isChecked,
    this.checkedWidget = const Icon(
      Icons.check,
      color: Colors.white,
      size: 19,
    ),
    this.uncheckedWidget = const SizedBox.shrink(),
    this.checkedColor,
    this.uncheckedColor,
    this.borderColor,
    this.size = 25,
    this.animationDuration,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChange(isChecked);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size! / 2),
        child: AnimatedContainer(
          duration: animationDuration ?? Duration(milliseconds: 500),
          height: size,
          width: size,
          decoration: BoxDecoration(
            color: isChecked! ? checkedColor : uncheckedColor,
            border: Border.all(
              color: isChecked! ? checkedColor! : borderColor!,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(size! / 2),
          ),
          child: isChecked! ? checkedWidget : uncheckedWidget,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final TextStyle textStyle;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color primaryBackgroundColor;
  final Color secondaryBackgroundColor;
  final String label;
  final bool isSelected;
  final Function(String)? onSelect;

  const Option({
    super.key,
    required this.textStyle,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.primaryBackgroundColor,
    required this.secondaryBackgroundColor,
    required this.label,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      constraints: const BoxConstraints(minWidth: 72),
      margin: const EdgeInsets.only(top: 16, right: 6),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? primaryBackgroundColor : secondaryBackgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: GestureDetector(
        onTap: () {
          onSelect!(label);
        },
        child: Text(label,
            style: textStyle.copyWith(
              color: isSelected ? primaryTextColor : secondaryTextColor,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/app_typo.dart';

class AppSearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final bool isTyping;
  final Function onChangeTypingState;
  final Function(String)? onSearch;

  const AppSearchBar(
      {super.key,
      required this.searchController,
      required this.isTyping,
      required this.onChangeTypingState,
      required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SizedBox(
            height: 40,
            child: TextField(
              style: AppTypo.small,
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Xem khuyến nghị theo mã",
                contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                hintStyle:
                    AppTypo.small.copyWith(color: AppColor.secondaryTextColor),
                suffixIcon: IconButton(
                  icon: isTyping
                      ? const Icon(
                          Icons.clear,
                          color: Color(0xFF4F4F4F),
                        )
                      : const Icon(
                          Icons.search,
                          color: Color(0xFF4F4F4F),
                        ),
                  onPressed: () {
                    if (isTyping) searchController.clear();
                    onChangeTypingState();
                  },
                ),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: AppColor.secondaryBackgroundColor,
              ),
              onChanged: onSearch,
            )));
  }
}

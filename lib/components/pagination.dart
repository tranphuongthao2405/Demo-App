import 'package:demo_app/constants/app_color.dart';
import 'package:demo_app/constants/app_data.dart';
import 'package:flutter/material.dart';

class Pagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int) onPageSelected;

  const Pagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildPaginationArrow(true),
        ...List<int>.generate(totalPages, (int index) => index + 1,
                growable: false)
            .skip(currentPage - 1)
            .take(MAX_ITEMS_PER_PAGE)
            .map((e) => buildPageButton(e))
            .toList(),
        buildPaginationArrow(false)
      ],
    );
  }

  Widget buildPaginationArrow(bool isLeft) {
    handleChangePage() {
      if (isLeft) {
        if (currentPage > 1) {
          onPageSelected(currentPage - 1);
        }
      } else {
        if (currentPage < totalPages) {
          onPageSelected(currentPage + 1);
        }
      }
      return null;
    }

    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: IconButton(
        hoverColor: AppColor.secondaryBackgroundColor,
        focusColor: AppColor.secondaryBackgroundColor,
        color: AppColor.primaryBlue,
        icon: isLeft
            ? const Icon(Icons.chevron_left)
            : const Icon(Icons.chevron_right),
        onPressed: handleChangePage,
      ),
    );
  }

  Widget buildPageButton(int page) {
    return Container(
      decoration: BoxDecoration(
        color:
            (page == currentPage) ? AppColor.primaryBlue : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Text(
          page.toString(),
          style: TextStyle(color: AppColor.primaryTextColor),
        ),
        onPressed: () => onPageSelected(page),
      ),
    );
  }
}

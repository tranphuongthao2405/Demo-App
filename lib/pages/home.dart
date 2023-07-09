import 'package:demo_app/components/StockList.dart';
import 'package:demo_app/components/option.dart';
import 'package:demo_app/components/pagination.dart';
import 'package:demo_app/components/searchBar.dart';
import 'package:demo_app/constants/app_data.dart';
import 'package:flutter/material.dart';
import '../constants/app_color.dart';
import '../constants/app_typo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  bool isTyping = false;
  String searchTerm = '';
  String sessionSelected = sessions.first;
  String floorSelected = floors.first;
  int currentPage = 1;
  int pageRowSkip = 0;

  handleSearchChange(value) {
    currentPage = 1;
    if (value.isNotEmpty) {
      setState(() {
        searchTerm = value;
        isTyping = true;
      });
    }
  }

  handleTypingState() {
    setState(() {
      isTyping = !isTyping;
    });
  }

  handleSelectSession(value) {
    setState(() {
      sessionSelected = value;
      floorSelected = floors.first;
      currentPage = 1;
    });
  }

  handleSelectFloor(value) {
    setState(() {
      floorSelected = value;
      currentPage = 1;
    });
  }

  handlePageChange(value) {
    setState(() {
      currentPage = value;
    });
  }

  List<Map<String, String>> get stockList {
    List<Map<String, String>> res = stockData;
    if (floorSelected != "ALL") {
      res = stockData
          .where((element) => element["floor"] == floorSelected)
          .toList();
    }

    if (searchTerm.isNotEmpty) {
      res = res
          .where((element) =>
              element["code"].toString().toLowerCase().contains(searchTerm))
          .toList();
    }

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 16),
                child: Text(
                  "Đột biến khối lượng giao dịch",
                  style: AppTypo.small.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              AppSearchBar(
                searchController: _searchController,
                isTyping: isTyping,
                onChangeTypingState: handleTypingState,
                onSearch: handleSearchChange,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: sessions
                    .map((session) => Option(
                        textStyle: AppTypo.small,
                        primaryTextColor: AppColor.primaryTextColor,
                        secondaryTextColor: AppColor.secondaryTextColor,
                        primaryBackgroundColor: AppColor.primaryBlue,
                        secondaryBackgroundColor:
                            AppColor.secondaryBackgroundColor,
                        label: session,
                        isSelected: sessionSelected == session,
                        onSelect: handleSelectSession))
                    .toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: floors
                    .map((floor) => Option(
                        textStyle: AppTypo.caption,
                        primaryTextColor: AppColor.primaryTextColor,
                        secondaryTextColor: AppColor.secondaryTextColor,
                        primaryBackgroundColor:
                            AppColor.secondaryBackgroundColor,
                        secondaryBackgroundColor: Colors.transparent,
                        label: floor,
                        isSelected: floorSelected == floor,
                        onSelect: handleSelectFloor))
                    .toList(),
              ),
              Expanded(
                child: StockList(
                  data: stockList.length > MAX_ITEMS_PER_PAGE
                      ? stockList
                          .skip(
                            (currentPage - 1) * MAX_ITEMS_PER_PAGE,
                          )
                          .take(MAX_ITEMS_PER_PAGE)
                          .toList()
                      : stockList,
                  headerColumns: headerColumns,
                ),
              ),
              Pagination(
                  currentPage: currentPage,
                  totalPages: (stockList.length / MAX_ITEMS_PER_PAGE).ceil(),
                  onPageSelected: handlePageChange)
            ],
          ),
        ),
      ),
    );
  }
}

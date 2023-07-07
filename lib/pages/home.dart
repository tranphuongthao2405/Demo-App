import 'package:demo_app/components/SearchBar.dart';
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
  String searchKey = '';

  handleSearchChange(value) {
    setState(() {
      searchKey = value;
      isTyping = true;
    });
  }

  handleTypingState() {
    setState(() {
      isTyping = !isTyping;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: session.length,
      child: Scaffold(
          backgroundColor: AppColor.backgroundColor,
          appBar: AppBar(
            toolbarHeight: 120,
            backgroundColor: AppColor.backgroundColor,
            title: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: 16),
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
              ],
            ),
            bottom: TabBar(
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColor.primaryBlue,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: AppColor.secondaryTextColor,
              unselectedLabelStyle: AppTypo.small,
              labelStyle: AppTypo.small.copyWith(fontWeight: FontWeight.w600),
              tabs: session
                  .map((text) => Tab(
                        text: text,
                      ))
                  .toList(),
            ),
          ),
          body: const SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: TabBarView(
                children: <Widget>[
                  NestedTabBar('Flights'),
                  NestedTabBar('Trips'),
                  NestedTabBar('Explore'),
                ],
              ),
            ),
          )),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  const NestedTabBar(this.outerTab, {super.key});

  final String outerTab;

  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar.secondary(
          controller: _tabController,
          dividerColor: Colors.transparent,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColor.secondaryBackgroundColor,
          ),
          labelStyle: AppTypo.caption.copyWith(fontWeight: FontWeight.w600),
          labelColor: Colors.white,
          unselectedLabelColor: AppColor.secondaryTextColor,
          unselectedLabelStyle: AppTypo.caption,
          tabs: floor.map((text) => Tab(text: text)).toList(),
          padding: EdgeInsets.only(bottom: 24),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Card(
                child: Center(child: Text('${widget.outerTab}: Overview tab')),
              ),
              Card(
                child: Center(
                    child: Text('${widget.outerTab}: Specifications tab')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

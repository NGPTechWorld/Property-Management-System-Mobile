import 'package:flutter/material.dart';

class TabTitle extends StatelessWidget {
  const TabTitle({super.key, required this.tabController, required this.tabs});

  final TabController tabController;
  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: tabs.map((name) => Tab(text: name)).toList(),
    );
  }
}

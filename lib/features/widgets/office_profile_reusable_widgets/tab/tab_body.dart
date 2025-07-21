import 'package:flutter/material.dart';

class TabBody extends StatelessWidget {
  const TabBody({
    super.key,
    required this.tabController,
    required this.children,
  });

  final TabController tabController;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(controller: tabController, children: children),
    );
  }
}

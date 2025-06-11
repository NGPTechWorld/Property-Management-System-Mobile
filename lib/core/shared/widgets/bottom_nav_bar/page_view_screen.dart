import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_ms/core/shared/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:property_ms/core/shared/widgets/bottom_nav_bar/cubit/navigation_bar_cubit.dart';

class PageViewScreen extends StatelessWidget {
  PageViewScreen({super.key});

  final List<Widget> screens = [
    const CurrentCourse(),
    const Reports(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarCubit, int>(
      builder: (context, selectedIndex) {
        return Scaffold(
          body: screens[selectedIndex],
          bottomNavigationBar: BottomNavBar(
            selectedIndex: selectedIndex,
            onTabChange:
                (i) => context.read<NavigationBarCubit>().updateIndex(i),
          ),
        );
      },
    );
  }
}

//Todo! Replace this:
class CurrentCourse extends StatelessWidget {
  const CurrentCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('CurrentCourse'));
  }
}

//Todo! Replace this:
class Reports extends StatelessWidget {
  const Reports({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Reports'));
  }
}

//Todo! Replace this:
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile'));
  }
}

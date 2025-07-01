import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NormalAppBar(title: "HomePage"),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          itemCount: 4,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return _buildWideCard(
                  title: 'مكاتب عقارية',
                  imagePath: 'assets/images/office.png',
                );
              case 1:
                return _buildCard(
                  title: 'خدمات',
                  imagePath: 'assets/images/services.png',
                );
              case 2:
                return _buildCard(
                  title: 'عقارات',
                  imagePath: 'assets/images/realestate.png',
                );
              case 3:
                return _buildCard(
                  title: 'سياحة',
                  imagePath: 'assets/images/tourism.png',
                );
              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget _buildWideCard({required String title, required String imagePath}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.blue.shade100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({required String title, required String imagePath}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.blue.shade50,
      ),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

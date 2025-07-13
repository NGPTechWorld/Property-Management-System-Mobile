import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/models/office_profile_model.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/all_office_properties_tab.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/office_profile_tab.dart';

class TabBody extends StatelessWidget {
  const TabBody({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: [
          const AllOfficePropertiesTab(),
          OfficeProfileTab(
            //! @OsamaZerkawi here should only pass a model from the controller like controller.model
            model: OfficeProfileModel(
              title: 'مكتب الطاحون',
              image: Assets.images.officePropertyCard,
              serviceType: 'عقاري',
              rate: '4.5',
              location: 'دمشق ميدان',
              startWork: '09:30',
              endWork: '09:00',
              officeNumber: '0987654321',
            ),
          ),
        ],
      ),
    );
  }
}

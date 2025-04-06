import 'package:flutter/material.dart';
import 'package:islamy_c14/common/app_asset.dart';
import 'package:islamy_c14/common/widgets/back_ground_gradient.dart';
import 'package:islamy_c14/home_screen/tabs/home_tab/views/most_recent_suras_view.dart';
import 'package:islamy_c14/home_screen/tabs/home_tab/views/suras_list_view.dart';
import 'package:islamy_c14/home_screen/tabs/home_tab/widgets/custom_text_field.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGroundGradient(
        bgImage: AppAsset.homeTabBg,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(hintText: 'Sura Name'),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  children: [MostRecentSurasView(), SurasListView()],
                ),
              ),
            ],
          ),
        ));
  }
}

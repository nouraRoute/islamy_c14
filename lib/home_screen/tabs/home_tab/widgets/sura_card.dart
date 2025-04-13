import 'package:flutter/material.dart';
import 'package:islamy_c14/common/app_asset.dart';
import 'package:islamy_c14/common/app_colors.dart';
import 'package:islamy_c14/home_screen/models/sura_model.dart';
import 'package:islamy_c14/home_screen/tabs/home_tab/sura_details_screen.dart';
import 'package:islamy_c14/home_screen/tabs/home_tab/views/suras_list_view.dart';

class SuraCard extends StatelessWidget {
  const SuraCard(
      {super.key, required this.suraModel, required this.onSuraClicked});
  final SuraModel suraModel;
  final onClick onSuraClicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSuraClicked(suraModel.suraCount);
        Navigator.of(context)
            .pushNamed(SuraDetailsScreen.routname, arguments: suraModel);
      },
      child: Card(
        color: AppColors.cardColor, //background: #E2BE7F;

        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Container(
          width: MediaQuery.of(context).size.width * .7,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      suraModel.enName,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blackColor),
                    ),
                    Text(
                      suraModel.arName,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blackColor),
                    ),
                    Text(
                      '${suraModel.versesCount} Verses  ',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Image.asset(
                    AppAsset.suraLogo,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

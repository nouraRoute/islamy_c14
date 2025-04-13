import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamy_c14/common/app_asset.dart';
import 'package:islamy_c14/home_screen/models/sura_model.dart';
import 'package:islamy_c14/home_screen/tabs/home_tab/sura_details_screen.dart';
import 'package:islamy_c14/home_screen/tabs/home_tab/views/suras_list_view.dart';

class SuraTile extends StatelessWidget {
  const SuraTile(
      {super.key, required this.suraModel, required this.onSuraClicked});
  final SuraModel suraModel;
  final onClick onSuraClicked;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onSuraClicked(suraModel.suraCount);
        Navigator.of(context)
            .pushNamed(SuraDetailsScreen.routname, arguments: suraModel);
      },
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: SizedBox(
        width: 50,
        height: 50,
        child: Stack(
          children: [
            SvgPicture.asset(AppAsset.suraVerseIco),
            Center(
              child: Text(
                (suraModel.suraCount).toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            )
          ],
        ),
      ),
      title: Text(
        suraModel.enName,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
      ),
      subtitle: Text(
        '${suraModel.versesCount} Verses',
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14),
      ),
      trailing: Text(
        suraModel.arName,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
      ),
    );
  }
}

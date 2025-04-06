import 'package:flutter/material.dart';
import 'package:islamy_c14/home_screen/models/sura_model.dart';
import 'package:islamy_c14/home_screen/tabs/home_tab/widgets/sura_tile.dart';

class SurasListView extends StatelessWidget {
  const SurasListView({super.key});

  @override
  Widget build(BuildContext context) {
    // List<SuraModel> suras = List.generate(
    //   10,
    //   (index) => SuraModel(
    //       suraCount: index,
    //       arName: 'arName$index',
    //       enName: 'enName$index',
    //       versesCount: index),
    // );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Suras List',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
        ),

        // ...suras.map(
        //   (e) => SuraTile(suraModel: e),
        // )

        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) => SuraTile(
            suraModel: SuraModel(
                arName: 'arName',
                enName: 'enName',
                versesCount: 10,
                suraCount: index + 1),
          ),
          separatorBuilder: (BuildContext context, int index) => const Divider(
            color: Colors.white,
            endIndent: 40,
            indent: 40,
          ),
        )
      ],
    );
  }
}

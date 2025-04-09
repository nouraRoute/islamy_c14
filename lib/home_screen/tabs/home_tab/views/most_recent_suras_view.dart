import 'package:flutter/material.dart';
import 'package:islamy_c14/home_screen/models/sura_model.dart';
import 'package:islamy_c14/home_screen/tabs/home_tab/widgets/sura_card.dart';

class MostRecentSurasView extends StatelessWidget {
  const MostRecentSurasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Most Recently',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: SuraModel.suras.length,
            itemBuilder: (context, index) => SuraCard(
              suraModel: SuraModel.suras[index],
            ),
          ),
        )
      ],
    );
  }
}

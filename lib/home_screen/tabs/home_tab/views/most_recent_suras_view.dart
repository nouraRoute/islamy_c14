import 'package:flutter/material.dart';
import 'package:islamy_c14/home_screen/models/sura_model.dart';
import 'package:islamy_c14/home_screen/tabs/home_tab/views/suras_list_view.dart';
import 'package:islamy_c14/home_screen/tabs/home_tab/widgets/sura_card.dart';

class MostRecentSurasView extends StatelessWidget {
  const MostRecentSurasView(
      {super.key, required this.mostRecent, required this.onSuraClicked});
  final List<int> mostRecent; //[1,5.6]
  final onClick onSuraClicked;
  @override
  Widget build(BuildContext context) {
    List<SuraModel> temp = mostRecent
        .map(
          (e) => SuraModel.suras[e - 1],
        )
        .toList();
    return mostRecent.isEmpty
        ? const SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Most Recently',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: temp.length,
                  itemBuilder: (context, index) => SuraCard(
                    key: UniqueKey(),
                    suraModel: temp[index],
                    onSuraClicked: onSuraClicked,
                  ),
                ),
              )
            ],
          );
  }
}

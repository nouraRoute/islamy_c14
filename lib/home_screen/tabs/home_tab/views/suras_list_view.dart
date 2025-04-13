import 'package:flutter/material.dart';
import 'package:islamy_c14/home_screen/models/sura_model.dart';
import 'package:islamy_c14/home_screen/tabs/home_tab/widgets/sura_tile.dart';

typedef onClick = void Function(int);

class SurasListView extends StatelessWidget {
  const SurasListView(
      {super.key,
      required this.search,
      this.onTap,
      required this.onSuraClicked});
  final String? search;
  final String Function()? onTap;
  final onClick onSuraClicked;
  @override
  Widget build(BuildContext context) {
    List<SuraModel> filterdSuras = SuraModel.suras
        .where(
          (element) => (element.enName
                  .toLowerCase()
                  .contains((search ?? '').toLowerCase()) ||
              element.arName.contains((search ?? ''))),
        )
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Suras List',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: filterdSuras.length,
          itemBuilder: (context, index) => SuraTile(
            onSuraClicked: onSuraClicked,
            suraModel: filterdSuras[index],
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

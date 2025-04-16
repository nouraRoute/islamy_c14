import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_c14/common/app_asset.dart';
import 'package:islamy_c14/common/widgets/back_ground_gradient.dart';
import 'package:islamy_c14/home_screen/models/hadeeth_model.dart';
import 'package:islamy_c14/home_screen/tabs/hadeeth_tab/widgets/hadeeth_card.dart';

class HadeethTab extends StatefulWidget {
  const HadeethTab({super.key});

  @override
  State<HadeethTab> createState() => _HadeethTabState();
}

class _HadeethTabState extends State<HadeethTab> {
  List<HadeethModel> hadeethList = [];
  int currantIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAhadeeth();
  }

  @override
  Widget build(BuildContext context) {
    return BackGroundGradient(
      bgImage: AppAsset.hadeethTabBg,
      alignment: Alignment.topCenter,
      fit: BoxFit.fitWidth,
      child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              currantIndex = value;
            });
          },
          itemCount: hadeethList.length,
          padEnds: true,
          controller: PageController(viewportFraction: 0.8),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(
                    vertical: index == currantIndex ? 0 : 20.0),
                child: HadeethCard(
                  hadeethModel: hadeethList[index],
                ),
              )),
    );
  }

  Future loadAhadeeth() async {
    String fileContent = await rootBundle.loadString(AppAsset.hadeethFile);
    List<String> content = fileContent.trim().split('#');
    for (var i = 0; i < content.length; i++) {
      String temp = content[i].trim();
      String name = temp.split('\n').first;
      String details = temp.substring(name.length);

      hadeethList.add(HadeethModel(count: i + 1, details: details, name: name));
    }
    setState(() {});
  }
}

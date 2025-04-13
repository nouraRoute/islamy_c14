import 'package:flutter/material.dart';
import 'package:islamy_c14/common/app_asset.dart';
import 'package:islamy_c14/common/app_colors.dart';
import 'package:islamy_c14/common/consts.dart';
import 'package:islamy_c14/common/widgets/back_ground_gradient.dart';
import 'package:islamy_c14/home_screen/tabs/home_tab/views/most_recent_suras_view.dart';
import 'package:islamy_c14/home_screen/tabs/home_tab/views/suras_list_view.dart';
import 'package:islamy_c14/home_screen/tabs/home_tab/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  TextEditingController controller = TextEditingController();
  List<int> mostRecentList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  Future<void> getData() async {
    SharedPreferences prf = await SharedPreferences.getInstance();
    List<String>? data = prf.getStringList(AppConsts.mostRecentKey);
    mostRecentList = (data ?? [])
        .map(
          (e) => int.parse(e),
        )
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // print('XXXX');
    return BackGroundGradient(
        bgImage: AppAsset.homeTabBg,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                suffix: InkWell(
                    onTap: () {
                      controller.clear();
                      FocusScope.of(context).unfocus();
                      setState(() {});
                    },
                    child: Icon(
                      Icons.close_outlined,
                      color: AppColors.greyColor,
                    )),
                controller: controller,
                hintText: 'Sura Name',
                onChanged: (p0) {
                  if (p0.length > 3) {
                    setState(() {});
                  } else if (p0.isEmpty) {
                    setState(() {});
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  children: [
                    MostRecentSurasView(
                      mostRecent: mostRecentList,
                      onSuraClicked: addToMostRecent,
                    ),
                    SurasListView(
                      search: controller.text.trim(),
                      onSuraClicked: addToMostRecent,
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void addToMostRecent(int id) {
    mostRecentList.insert(0, id);
    Set<int> temp = mostRecentList.toSet();
    mostRecentList = temp.toList();
    SharedPreferences.getInstance().then(
      (prifrances) {
        prifrances.setStringList(
            AppConsts.mostRecentKey,
            mostRecentList
                .map<String>(
                  (e) => e.toString(),
                )
                .toList());
      },
    );
    // print(mostRecentList);
    setState(() {});
  }
}



///////values=['xx','dd','v','vd']
///print();
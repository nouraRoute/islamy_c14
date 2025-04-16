import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_c14/common/app_asset.dart';
import 'package:islamy_c14/common/app_colors.dart';
import 'package:islamy_c14/home_screen/models/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});
  static const String routname = 'suraDetailsScreen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> suraContent = [];
  bool loadContent = true;
  late SuraModel suraModel;
  bool error = false, success = false, loading = false;
  String? errorText;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSuraContent();
  }

  @override
  Widget build(BuildContext context) {
    suraModel = ModalRoute.of(context)!.settings.arguments as SuraModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(suraModel.enName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AppAsset.suraHeaderTwo,
                  width: 90,
                  height: 90,
                ),
                Text(
                  suraModel.arName,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                Image.asset(AppAsset.suraHeaderOne, width: 90, height: 90),
              ],
            ),
            loading
                ? Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : success
                    ? Expanded(
                        child: SingleChildScrollView(
                          child: RichText(
                              textDirection: TextDirection.rtl,
                              text: TextSpan(
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(color: AppColors.mainColor),
                                  children: List.generate(
                                    suraContent.length,
                                    (index) => TextSpan(
                                        text: suraContent[index] +
                                            ' (${index + 1}) '),
                                  )

                                  //  suraContent
                                  //     .map(
                                  //       (virse) => TextSpan(text: virse + ' * '),
                                  //     )
                                  //     .toList()
                                  )),
                        ),
                      )
                    : Expanded(
                        child: Center(
                            child: Column(
                        children: [
                          (Text(
                            errorText ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: AppColors.mainColor),
                          )),
                          ElevatedButton(
                              onPressed: () => loadSuraContent(),
                              child: Text('Try again'))
                        ],
                      ))),
            Image.asset(AppAsset.suraFotter)
          ],
        ),
      ),
    );
  }

  Future<void> loadSuraContent() async {
    setState(() {
      loading = true;
    });
    try {
      // await Future.delayed(
      //   Duration(seconds: 10),
      // );

      String fileContent = await rootBundle
          .loadString('assets/files/Suras/${suraModel.suraCount}.txt');
      suraContent = fileContent.trim().split('\n');
      loading = false;
      success = true;
      setState(() {});
      //   print('##=>${fileContent}');
      // print('##=>${suraContent.length}');
    } catch (e) {
      loading = false;
      error = true;
      errorText = e.toString();
      setState(() {});
    }
  }
}
/// Future  asinc await
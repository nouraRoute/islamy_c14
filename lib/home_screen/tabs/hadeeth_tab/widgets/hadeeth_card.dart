import 'package:flutter/material.dart';
import 'package:islamy_c14/common/app_asset.dart';
import 'package:islamy_c14/common/app_colors.dart';
import 'package:islamy_c14/home_screen/models/hadeeth_model.dart';

class HadeethCard extends StatelessWidget {
  const HadeethCard({super.key, required this.hadeethModel});
  final HadeethModel hadeethModel;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: AppColors.cardColor,
        child: Stack(
          alignment: const Alignment(0, 0),
          children: [
            Image.asset(
              AppAsset.hadeethCardBg,
              height: size.height * .8,
              width: size.width * .6,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Image.asset(AppAsset.hadeethCardFotter)),
            Positioned(
              top: 40,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    // maxLines: 1,
                    // overflow: TextOverflow.ellipsis,
                    hadeethModel.name,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AppAsset.suraHeaderTwo,
                        width: 90,
                        height: 90,
                        color: Colors.black,
                      ),
                      Image.asset(
                        AppAsset.suraHeaderOne,
                        width: 90,
                        height: 90,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          hadeethModel.details,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

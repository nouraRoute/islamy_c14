import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamy_c14/common/app_asset.dart';
import 'package:islamy_c14/common/app_colors.dart';
import 'package:islamy_c14/home_screen/tabs/hadeeth_tab/hadeeth_tab.dart';
import 'package:islamy_c14/home_screen/tabs/home_tab/home_tab.dart';
import 'package:islamy_c14/home_screen/tabs/radio_tab/radio_tab.dart';
import 'package:islamy_c14/home_screen/tabs/sebha_tab/sebha_tab.dart';
import 'package:islamy_c14/home_screen/tabs/time_tab/time_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/homeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    const HomeTab(),
    const HadeethTab(),
    const SebhaTab(),
    const RadioTab(),
    const TimeTab()
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Stack(
            children: [
              tabs[index],
              Positioned(
                  left: 0,
                  right: 0,
                  top: 10,
                  child: Image.asset(
                    AppAsset.logoImage,
                    height: MediaQuery.of(context).size.height * .2,
                  )),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              print('XX$value');
              index = value;
              setState(() {});
            },
            currentIndex: index,
            items: [
              BottomNavigationBarItem(
                  activeIcon: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: AppColors.blackColor.withOpacity(.6)),
                    child: SvgPicture.asset(
                      AppAsset.quranIcon,
                      colorFilter:
                          ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                  icon: SvgPicture.asset(
                    AppAsset.quranIcon,
                  ),
                  label: 'home'),
              BottomNavigationBarItem(
                  activeIcon: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: AppColors.blackColor.withOpacity(.6)),
                    child: SvgPicture.asset(
                      AppAsset.bookIcon,
                      color: Colors.white,
                    ),
                  ),
                  icon: SvgPicture.asset(
                    AppAsset.bookIcon,
                  ),
                  label: 'hadeeth'),
              BottomNavigationBarItem(
                  activeIcon: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: AppColors.blackColor.withOpacity(.6)),
                    child: SvgPicture.asset(
                      AppAsset.sebhaIcon,
                      color: Colors.white,
                    ),
                  ),
                  icon: SvgPicture.asset(
                    AppAsset.sebhaIcon,
                  ),
                  label: 'sebha'),
              BottomNavigationBarItem(
                  activeIcon: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: AppColors.blackColor.withOpacity(.6)),
                    child: SvgPicture.asset(
                      AppAsset.radioIcon,
                      color: Colors.white,
                    ),
                  ),
                  icon: SvgPicture.asset(
                    AppAsset.radioIcon,
                  ),
                  label: 'radio'),
              BottomNavigationBarItem(
                  activeIcon: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: AppColors.blackColor.withOpacity(.6)),
                    child: SvgPicture.asset(
                      AppAsset.vectorIcon,
                      color: Colors.white,
                    ),
                  ),
                  icon: SvgPicture.asset(
                    AppAsset.vectorIcon,
                  ),
                  label: 'time'),
            ],
          ),
        ),
      ),
    );
  }
}

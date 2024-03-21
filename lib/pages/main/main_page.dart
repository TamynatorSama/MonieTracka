import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monie_tracka/pages/main/home/home.dart';
import 'package:monie_tracka/shared/utils/app_theme.dart';
import 'package:monie_tracka/shared/utils/bottom_navigator_controller.dart';
import 'package:monie_tracka/shared/utils/icons.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<PageInfo> pageInfo = [
    PageInfo(widget: const HomePage(), icon: CustomIcons.home, label: "Home"),
    PageInfo(widget: const Column(), icon: CustomIcons.budget, label: "Budget"),
    PageInfo(
        widget: const Column(), icon: CustomIcons.savings, label: "Savings"),
    PageInfo(
        widget: const Column(), icon: CustomIcons.payments, label: "Payment"),
    PageInfo(
        widget: const Column(), icon: CustomIcons.profile, label: "Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: navigatorController,
        builder: (context, child)=>Scaffold(
          backgroundColor: const Color(0xffFAFAFA),
          body: pageInfo[navigatorController.pageIndex].widget,
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(horizontal:24,vertical: 15),
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 1, color: Color(0xffDDDBDB))),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  pageInfo.length,
                  (index) => Theme(
                    data: ThemeData().copyWith(
                      splashColor: Colors.transparent
                    ),
                    child: InkWell(
                      onTap: () => navigatorController.changePage(index),
                      child: _buildBottomNavItems(
                          isSelected: index == navigatorController.pageIndex,
                          icon: pageInfo[index].icon,
                          label: pageInfo[index].label)),
                ),
                  )
              ),
            ),
          )
        );
  }
}
Widget _buildBottomNavItems(
    {required bool isSelected, required String icon, required String label})=>AnimatedOpacity(
      opacity: isSelected ? 1 : 0.3,
      duration: const Duration(milliseconds: 200),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(icon),
          Text(label,style: AppTheme.bodyTextBold.copyWith(fontWeight: FontWeight.w700,color: Colors.black),)
        ],
      ));


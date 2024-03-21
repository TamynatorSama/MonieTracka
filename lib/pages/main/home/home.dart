import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monie_tracka/shared/utils/app_theme.dart';
import 'package:monie_tracka/shared/utils/icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool obscureBalance = false;
  void updatePassword() => setState(() => obscureBalance = !obscureBalance);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top + 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 20,
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        AssetImage("assets/images/profile-image.jpeg"),
                  ),
                  Text(
                    "Hi John",
                    style: AppTheme.headerStyle
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SvgPicture.asset(CustomIcons.notification)
            ],
          ),
          const SizedBox(
            height: 11,
          ),
          Expanded(
              child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: SingleChildScrollView(
              // physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Your Balance",
                        style: AppTheme.bodyTextBold.copyWith(fontSize: 13),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: updatePassword,
                        child: SvgPicture.asset(obscureBalance
                            ? CustomIcons.eyeSlash
                            : CustomIcons.eyeOpen),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Transform.translate(
                        offset: const Offset(0, -10),
                        child: Text(
                          "NGN",
                          style: AppTheme.bodyText.copyWith(fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      RichText(
                        text: TextSpan(
                            children: [
                              const TextSpan(text: "0."),
                              TextSpan(
                                  text: "00",
                                  style: AppTheme.bodyText.copyWith(
                                      fontSize: 20,
                                      color: const Color(0xff2E2E2E))),
                            ],
                            style: AppTheme.bodyText.copyWith(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff2E2E2E))),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Wrap(
                    spacing: 15,
                    runAlignment: WrapAlignment.start,
                    children: [
                      _quickActionButton(
                          icon: CustomIcons.add, label: "Fund Wallet"),
                      _quickActionButton(
                          icon: CustomIcons.send, label: "Send Money")
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Daily Budget",
                        style: AppTheme.headerStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff6E6E6E)),
                      ),
                      const SizedBox(
                              height: 15,
                            ),
                      Container(
                        alignment: Alignment.center,
                        height: (MediaQuery.of(context).size.width*0.5),
                        width:(MediaQuery.of(context).size.width*0.5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(CustomIcons.filledCircle),
                            const SizedBox(
                              height: 8,
                            ),
                            Text("Create Budget",style: AppTheme.bodyTextBold.copyWith(color: const Color(0xff9E9E9E),fontSize: 14),)
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Menu",
                        style: AppTheme.headerStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff6E6E6E)),
                      ),
                      const SizedBox(
                              height: 15,
                            ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                _menuButton(
                                  label: "Airtime",
                                  icon: CustomIcons.phone,
                                ),
                                _menuButton(
                                    label: "Data", icon: CustomIcons.data),
                                _menuButton(
                                    label: "Bills", icon: CustomIcons.bills),
                                _menuButton(
                                    label: "Electricity",
                                    icon: CustomIcons.electricity),
                                _menuButton(label: "TV", icon: CustomIcons.tv),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                _menuButton(
                                  label: "Cards",
                                  icon: CustomIcons.cards,
                                ),
                                _menuButton(
                                    label: "Cash Backs",
                                    icon: CustomIcons.cashBack),
                                _menuButton(
                                    label: "Group Budget",
                                    icon: CustomIcons.groupBudget),
                                _menuButton(
                                    label: "Contribution",
                                    icon: CustomIcons.contribution),
                                _menuButton(
                                    label: "More", icon: CustomIcons.more),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                
                const SizedBox(
                    height: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                      
                      child:Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                        "All Transactions",
                        style: AppTheme.headerStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff6E6E6E)),
                      ),
                      const SizedBox(width: 20,),
                      SvgPicture.asset(CustomIcons.downArrow)
                        ],
                      )),
                      const SizedBox(
                              height: 15,
                            ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        width: double.maxFinite,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                      )
                    ],
                  ),
                  const SizedBox(
                              height: 25,
                            ),
                
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

Widget _quickActionButton(
        {required String icon, required String label, Function()? onTap}) =>
    Theme(
        data: ThemeData().copyWith(
            // splashColor: Colors.transparent
            ),
        child: InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 15,
                        color: Color.fromARGB(134, 158, 158, 158))
                  ]),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    icon,
                    width: 22,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(label,
                      style: AppTheme.bodyTextBold.copyWith(fontSize: 13))
                ],
              ),
            )));

Widget _menuButton(
        {required String icon, required String label, Function()? onTap}) =>
    Expanded(
      child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: const Color(0xffFAFAFA),
                    borderRadius: BorderRadius.circular(15)),
                child: SvgPicture.asset(
                  icon,
                  width: 34,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                label,
                textAlign: TextAlign.center,
                style: AppTheme.bodyTextBold.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 9,
                    color: const Color(0xff4E4E4E)),
              )
            ],
          )),
    );

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_project/config/app_fonts.dart';
import 'package:sample_project/config/size_config.dart';
import 'package:sample_project/routes/app_route.dart';
import 'package:sample_project/utils/app_images.dart';
import 'package:sample_project/utils/colors.dart';
import 'package:sample_project/utils/secure_storage.dart';
import 'package:sample_project/utils/utils.dart';
import 'package:sample_project/widgets/drawer_listtile.dart';

import '../screens/home/repository/home_repository.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<HomeRepository>().advancedDrawerController.hideDrawer();
                        // Get.toNamed(Routes.PROFILE);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: getProportionateScreenHeight(90),
                            width: getProportionateScreenWidth(90),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 40,
                                    color: Color(0xFFFFC529).withOpacity(0.25),
                                    offset: Offset(0.0, 8.0),
                                    spreadRadius: 0)
                              ],
                              image: DecorationImage(
                                image: AssetImage(AppImages.profile),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          Text(
                            "Mobilions Lab",
                            style: TextStyle(
                              fontFamily: AppFonts.font500,
                              fontSize: getProportionalFontSize(20),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                          Text(
                            "mobilionsteam@gmail.com",
                            style: TextStyle(
                              fontFamily: AppFonts.font400,
                              fontSize: getProportionalFontSize(14),
                              color: Color(0xFF9EA1B1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    DrawerListTile(
                      title: "My Orders",
                      onTap: () {
                        context.read<HomeRepository>().advancedDrawerController.hideDrawer();
                        // Get.toNamed(Routes.MYORDERS);
                      },
                      imageName: AppImages.drawerOrders,
                    ),
                    DrawerListTile(
                      title: "My Profile",
                      onTap: () {
                        context.read<HomeRepository>().advancedDrawerController.hideDrawer();
                        // Get.toNamed(Routes.PROFILE);
                      },
                      imageName: AppImages.drawerProfile,
                    ),
                    DrawerListTile(
                      title: "Delivery Address",
                      onTap: () {},
                      imageName: AppImages.drawerAddress,
                    ),
                    DrawerListTile(
                      title: "Payment Methods",
                      onTap: () {},
                      imageName: AppImages.drawerPayment,
                    ),
                    DrawerListTile(
                      title: "Contact Us",
                      onTap: () {},
                      imageName: AppImages.drawerContactUs,
                    ),
                    DrawerListTile(
                      title: "Settings",
                      onTap: () {},
                      imageName: AppImages.drawerSetting,
                    ),
                    DrawerListTile(
                      title: "Helps & FAQs",
                      onTap: () {},
                      imageName: AppImages.drawerHelp,
                      iconPadding: EdgeInsets.only(
                        left: getProportionateScreenWidth(2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 43,
              width: 117,
              // height: getProportionateScreenHeight(43),
              // width: getProportionateScreenWidth(117),
              margin: EdgeInsets.only(
                left: getProportionateScreenWidth(20),
                bottom: getProportionateScreenHeight(20),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(AppColors.primaryColor),
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(9),
                    ),
                  ),
                ),
                onPressed: () {
                  Utils.showCustomDialog(
                    bar: true,
                    context: context,
                    title: "Logout",
                    buttons: [
                      TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                            Colors.black.withOpacity(.1),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "No",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: getProportionalFontSize(14),
                              fontFamily: AppFonts.font400),
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                            AppColors.primaryColor.withOpacity(.1),
                          ),
                        ),
                        onPressed: () async {
                          await StorageService().deleteAllSecureData();

                          Navigator.pushNamedAndRemoveUntil(context, AppRoute.loginRoute, (route) => false);
                        },
                        child: Text(
                          "Yes",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: getProportionalFontSize(14),
                              fontFamily: AppFonts.font400),
                        ),
                      ),
                    ],
                    description: "Are you sure you want to logout?",
                  );
                },
                child: Row(
                  children: [
                    Image.asset(AppImages.logout),
                    SizedBox(
                      width: getProportionateScreenWidth(9),
                    ),
                    Text(
                      "Log Out",
                      style: TextStyle(
                        fontSize: getProportionalFontSize(16),
                        fontFamily: AppFonts.font400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

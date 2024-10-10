import 'package:dating_app/Core/Config/size_config.dart';
import 'package:dating_app/Resorces/app_assets.dart';
import 'package:dating_app/Resorces/app_color.dart';
import 'package:dating_app/Resorces/app_style.dart';
import 'package:dating_app/Views/detail_screen.dart';
import 'package:dating_app/Widgets/custom_textfields.dart';
import 'package:dating_app/controller/suggested_users_list.dart';
import 'package:dating_app/controller/user_listing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenView extends StatefulWidget {
  HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  TextEditingController _searchController = TextEditingController();

  AllUsersController allUsersController = Get.put(AllUsersController());

  SuggestedUsersController suggestedUsersController =
      Get.put(SuggestedUsersController());

  @override
  void initState() {
    // TODO: implement initState
    allUsersController.getAllUsers();
    suggestedUsersController.getSuggestedUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var size = MediaQuery.of(context).size;
    return GetBuilder<SuggestedUsersController>(builder: (sugCltr) {
      return sugCltr.isLoading
          ? Center(child: CircularProgressIndicator())
          : GetBuilder<AllUsersController>(builder: (controller) {
              return controller.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Scaffold(
                      backgroundColor: AppColors.white,
                      body: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "Intract With your ",
                                        style: AppStyles.of(context)
                                            .figtreeMedium
                                            .copyWith(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.grey1)),
                                    TextSpan(
                                        text: "Happiness !",
                                        style: AppStyles.of(context)
                                            .figtreeBold
                                            .copyWith(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.orange))
                                  ]),
                                ),
                              ),
                              vsBox1,
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  height: 60,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Center(
                                      child: CustomTextField(
                                        borderColor: AppColors.textFieldBgColor,
                                        cursorColor: AppColors.black,
                                        textColor: AppColors.black,
                                        hintStyle: AppStyles.of(context)
                                            .figtreeMedium
                                            .copyWith(
                                              color: const Color(0xFF252525),
                                              fontSize: 14,
                                              fontFamily: 'Figtree-Regular',
                                              fontWeight: FontWeight.w400,
                                              height: 1.3,
                                            ),
                                        controller: _searchController,
                                        onChanged: (value) {
                                          // Handle search functionality
                                        },
                                        fillColor: AppColors.fillColor,
                                        hintText: "Search Employee By Name",
                                        prifixIcon: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 12,
                                            top: 13,
                                            bottom: 13,
                                          ),
                                          child:
                                              _searchController.text.isNotEmpty
                                                  ? GestureDetector(
                                                      onTap: () {
                                                        // Clear the search field
                                                      },
                                                      child: const Icon(
                                                        Icons.close,
                                                        color: AppColors
                                                            .textColorBlack,
                                                      ),
                                                    )
                                                  : Image.asset(
                                                      AppAssets.searchIcon),
                                        ),
                                        obscureText: false,
                                        readOnly: false,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              vsBox1,
                              titleActionWidget(
                                  "All Matches", "See all", () {}),
                              vsBox1,
                              SizedBox(
                                height: size.height * 0.26,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.allUsers!.data!.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                        onTap: () {
                                          Get.to(() => DetailScreen(),
                                              transition:
                                                  Transition.circularReveal,
                                              duration:
                                                  Duration(milliseconds: 1000));
                                        },
                                        child: cartWidget(
                                            context, controller, index));
                                  },
                                ),
                              ),
                              vsBox1,
                              titleActionWidget(
                                  "Suggested Post", "See all", () {}),
                              vsBox1,
                              SizedBox(
                                height: size.height * 0.26,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.allUsers!.data!.length,
                                  itemBuilder: (context, index) {
                                    return cartWidget2(context, sugCltr, index);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
            });
    });
  }

  SizedBox cartWidget(
      BuildContext context, AllUsersController allUsers, int index) {
    var userDetails = allUsers.allUsers!.data![index];

    DateTime? dob = userDetails.dob;

    int age = 0;
    double? heightCm = userDetails.height;
    double heightInInches = heightCm! * 0.393701;

    String roundedHeightInInches = heightInInches.toStringAsFixed(2);
    print(roundedHeightInInches);

    if (dob != null) {
      int year = dob.year;
      age = 2024 - year;

      print(year);

      print("Age $age");
    }

    return SizedBox(
      width: 180,
      height: 200,
      child: Column(children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: 180,
                height: 170,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                    ),
                    BoxShadow(
                      color: Colors.white70,
                      spreadRadius: -10.0,
                      blurRadius: 30.0,
                    ),
                  ],
                ),
                child: Image.asset(
                  AppAssets.dummyBanner1,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 110,
              left: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 170,
                        child: Text(
                          "${userDetails.user!.firstName.toString()} ${userDetails.user!.lastName.toString()}",
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.of(context).figtreeMedium.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white),
                        ),
                      ),
                      hsBox0,
                      SizedBox(
                        height: 15,
                        width: 15,
                        child: Image.asset(AppAssets.verifyIcon),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 170,
                    child: Text(
                      "$age Yrs, $roundedHeightInInches\"",
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.of(context).figtreeMedium.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white),
                    ),
                  ),
                  SizedBox(
                    width: 190,
                    child: Text(
                      "${userDetails.city}, ${userDetails.state}",
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.of(context).figtreeMedium.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Container(
            width: 180,
            height: 30,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.orange)),
            child: Center(
                child: Text(
              "Sent Intrest",
              style: AppStyles.of(context).figtreeRegular.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.orange),
            )),
          ),
        )
      ]),
    );
  }

  SizedBox cartWidget2(
      BuildContext context, SuggestedUsersController suggestedUser, int index) {
    var userDetails = suggestedUser.suggestedUserList!.data![index];

    DateTime? dob = userDetails.dob;

    int age = 0;
    double? heightCm = userDetails.height;
    double heightInInches = heightCm! * 0.393701;

    String roundedHeightInInches = heightInInches.toStringAsFixed(2);
    print(roundedHeightInInches);

    if (dob != null) {
      int year = dob.year;
      age = 2024 - year;

      print(year);

      print("Age $age");
    }

    return SizedBox(
      width: 180,
      height: 200,
      child: Column(children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: 180,
                height: 170,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                    ),
                    BoxShadow(
                      color: Colors.white70,
                      spreadRadius: -10.0,
                      blurRadius: 30.0,
                    ),
                  ],
                ),
                child: Image.asset(
                  AppAssets.dummyBanner1,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 110,
              left: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 170,
                        child: Text(
                          "${userDetails.user!.firstName.toString()} ${userDetails.user!.lastName.toString()}",
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.of(context).figtreeMedium.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white),
                        ),
                      ),
                      hsBox0,
                      SizedBox(
                        height: 15,
                        width: 15,
                        child: Image.asset(AppAssets.verifyIcon),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 170,
                    child: Text(
                      "$age Yrs, $roundedHeightInInches\"",
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.of(context).figtreeMedium.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white),
                    ),
                  ),
                  SizedBox(
                    width: 190,
                    child: Text(
                      "${userDetails.city}, ${userDetails.state}",
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.of(context).figtreeMedium.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Container(
            width: 180,
            height: 30,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.orange)),
            child: Center(
                child: Text(
              "Sent Intrest",
              style: AppStyles.of(context).figtreeRegular.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.orange),
            )),
          ),
        )
      ]),
    );
  }

  Row titleActionWidget(
      String title, String butnTitle, final VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppStyles.of(context).figtreeMedium.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.black),
        ),
        TextButton(
            onPressed: onTap,
            child: Text(
              butnTitle,
              style: AppStyles.of(context).figtreeRegular.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.orange),
            ))
      ],
    );
  }
}

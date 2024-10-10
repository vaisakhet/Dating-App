import 'package:dating_app/Core/Config/size_config.dart';
import 'package:dating_app/Resorces/app_assets.dart';
import 'package:dating_app/Resorces/app_color.dart';
import 'package:dating_app/Resorces/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none, // Prevent the Stack from clipping children
            children: [
              // The image container
              Container(
                color: AppColors.white,
                width: size.width,
                height: size.height / 2.3,
                child: SizedBox(
                  child: Image.asset(
                    AppAssets.dummyBanner1,
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              // The "Sent Interest" button positioned over the image and outside
              Positioned(
                bottom: -25, // Move half of the button outside the image
                right: 10,
                child: Container(
                  width: 250,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 252, 74, 3),
                  ),
                  child: TextButton(
                    onPressed: () {
                      print("Pressed");
                    },
                    child: Center(
                      child: Text(
                        "Sent Interest",
                        style: AppStyles.of(context).figtreeMedium.copyWith(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                ),
              ),

              // The icons on top of the image
              Positioned(
                left: 15,
                top: 45,
                right: 15,
                child: Column(
                  children: [
                    SizedBox(
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(173, 127, 127, 127),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(173, 127, 127, 127),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(right: 5, left: 2),
                              child: Icon(
                                Icons.star,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    vsBox1,
                    SizedBox(
                      width: size.width,
                      child: Row(
                        children: [
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: AppColors.goldenYellow,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Image.asset(
                                    AppAssets.crownIcon,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          vsBox2,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Davis Baptista",
                    style: AppStyles.of(context).figtreeExBold.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Software Engineer,",
                    style: AppStyles.of(context).figtreeMedium.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey1),
                  ),
                ),
                vsBox2,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "About",
                    style: AppStyles.of(context).figtreeExBold.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey1),
                  ),
                ),
                const SizedBox(height: 4),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 55,
                    height: 3,
                    decoration: BoxDecoration(
                        color: AppColors.orange,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                vsBox0,
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: AppStyles.of(context).figtreeRegular.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromARGB(255, 131, 139, 153)),
                ),
                vsBox1,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hobbies and Interest",
                    style: AppStyles.of(context).figtreeExBold.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey1),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

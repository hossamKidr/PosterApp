import 'package:flutter/material.dart';
import 'package:go_plus/core/app_Strings.dart';
import 'package:go_plus/core/app_colors.dart';

import '../../../../core/sizse_views.dart';
import '../wedgits/cuostome_text.dart';
import '../wedgits/custom_button.dart';
import '../wedgits/custom_textField.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController platesNoController = TextEditingController();
  final TextEditingController cerealNumberController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.darkGryColor,
        appBar: AppBar(
            centerTitle: true,
            title: const CustomText(
              color: AppColors.darkGryColor,
              text: AppStrings.electronicPoster,
              fontSize: 20,
            )),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
            child: ListView(children: [
              SizedBox(
                height: SizesViews.height(context, 0.02),
              ),
              ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                        height: SizesViews.height(context, 0.01),
                      ),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                        width: double.infinity,
                        height: SizesViews.height(context, 0.2),
                        decoration: BoxDecoration(
                            color: AppColors.grayColor,
                            borderRadius: BorderRadius.circular(
                                SizesViews.height(context, 0.03))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 30,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.update,
                                      color: AppColors.goldColor,
                                      size: 30,
                                    )),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset(
                                      'assets/images/car.png',
                                      height: 40,
                                    ),
                                    const CustomText(
                                        text: AppStrings.platesNo,
                                        fontSize: 20,
                                        color: AppColors.darkGryColor),
                                  ],
                                ),
                                SizedBox(
                                  height: SizesViews.height(context, 0.02),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset(
                                      'assets/images/poster.png',
                                      height: 40,
                                    ),
                                    const CustomText(
                                        text: AppStrings.serialNumber,
                                        fontSize: 20,
                                        color: AppColors.darkGryColor),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ));
                  })
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColors.goldColor,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                      decoration: const BoxDecoration(
                        color: AppColors.darkGryColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: globalKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  text: AppStrings.addNewPoster,
                                  fontSize: 20,
                                  color: AppColors.goldColor),
                              SizedBox(height: SizesViews.height(context, 0.04),),
                              CustomTextField(
                                hintText: AppStrings.platesNo,
                                textInputType: TextInputType.text,
                                controller: platesNoController,
                              ),
                              SizedBox(
                                  height: SizesViews.height(context, 0.03)),
                              CustomTextField(
                                textInputType: TextInputType.number,
                                hintText: AppStrings.serialNumber,
                                controller: cerealNumberController,
                              ),
                              SizedBox(
                                height: SizesViews.height(context, 0.05),
                              ),
                              CustomButton(
                                customText: const CustomText(
                                  color: AppColors.darkGryColor,
                                  text: AppStrings.savingData,
                                  fontSize: 20,
                                ),
                                onTap: () {
                                  if (globalKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Hossam')),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
          },
          label: const CustomText(
            text: AppStrings.addPoster,
            fontSize: 16,
            color: AppColors.darkGryColor,
          ),
          icon: Icon(Icons.add,
              color: AppColors.darkGryColor,
              size: SizesViews.width(context, 0.07)),
        ));
  }
}

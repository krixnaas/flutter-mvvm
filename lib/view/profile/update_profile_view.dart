import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mvvm/model/user_profile.dart';
import 'package:mvvm/res/colors.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/res/image_strings.dart';
import 'package:mvvm/res/sizes.dart';
import 'package:mvvm/res/text_strings.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:mvvm/view_model/profile_view_model.dart';

class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({Key? key}) : super(key: key);

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  final profileViewModel = Get.put(ProfileViewModel());
  @override
  void initState() {
    super.initState();
    profileViewModel.getProfileData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileViewModel = Get.put(ProfileViewModel());
    return Obx(() => profileViewModel.loading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(LineAwesomeIcons.angle_left),
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                title: Text(
                  updateProfile,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                actions: [
                  IconButton(
                      onPressed: () {
                        print('clicked');
                        Get.changeThemeMode(
                            Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                      },
                      icon: Icon(Get.isDarkMode
                          ? LineAwesomeIcons.sun
                          : LineAwesomeIcons.moon))
                ],
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(tDefaultSize),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: const Image(
                                    image: AssetImage(userProfileImage))),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 0,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: AppColors.tPrimaryColor,
                              ),
                              child: const Icon(
                                LineAwesomeIcons.camera,
                                size: 20.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: tFormHeightSize,
                      ),
                      TextFormField(
                        initialValue:
                            profileViewModel.userProfileModel.data!.firstName,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: firstNameHint,
                          labelText: firstNameHint,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person_outline_rounded),
                        ),
                        onChanged: (value) {
                          profileViewModel.firstNameController.value.text =
                              value;
                        },
                        onFieldSubmitted: (value) {
                          Utils.fieldFocusChange(
                              context,
                              profileViewModel.firstNameFocusNode,
                              profileViewModel.lastNameFocusNode);
                        },
                      ),
                      const SizedBox(
                        height: tFormHeightSize - 20,
                      ),
                      TextFormField(
                        initialValue:
                            profileViewModel.userProfileModel.data!.lastName,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: lastNameHint,
                          labelText: lastNameHint,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person_outline_rounded),
                        ),
                        onChanged: (value) {
                          profileViewModel.lastNameController.value.text =
                              value;
                        },
                      ),
                      const SizedBox(
                        height: tFormHeightSize - 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: RoundButtonWidget(
                          loading: profileViewModel.loading.value,
                          onPress: () {
                            if (profileViewModel
                                .firstNameController.value.text.isEmpty) {
                              Utils.flushBarErrorMessage(
                                  'Please Enter Your First Name', context);
                            } else if (profileViewModel
                                .lastNameController.value.text.isEmpty) {
                              Utils.flushBarErrorMessage(
                                  'Please Enter Your Last Name', context);
                            } else {
                              profileViewModel.updateProfileData();
                            }
                          },
                          title: updateProfile.toUpperCase(),
                        ),
                      ),
                      const SizedBox(
                        height: tFormHeightSize - 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text.rich(
                            TextSpan(
                                text: joined,
                                style: const TextStyle(fontSize: 12),
                                children: [
                                  TextSpan(
                                    text:
                                        ' ${profileViewModel.userProfileModel.data!.createdAt.toString()}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  )
                                ]),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));
  }
}

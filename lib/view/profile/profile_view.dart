import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mvvm/res/colors.dart';
import 'package:mvvm/res/components/app_bar_widget.dart';
import 'package:mvvm/res/image_strings.dart';
import 'package:mvvm/res/sizes.dart';
import 'package:mvvm/res/text_strings.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/profile_view_model.dart';
import 'package:mvvm/view_model/user_preference/user_preference.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  UserPreference userPreference = UserPreference();
  final profileViewModel = Get.put(ProfileViewModel());
  @override
  void initState() {
    super.initState();
    profileViewModel.getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    var isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final txtTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: buildAppBar(profile, isDarkMode, txtTheme, context),
        body: Obx(
          () => profileViewModel.loading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(tDefaultSize),
                    child: Column(
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
                                  LineAwesomeIcons.alternate_pencil,
                                  size: 20.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${profileViewModel.userProfileModel.data!.firstName} ${profileViewModel.userProfileModel.data!.lastName}',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            profileViewModel.userProfileModel.data!
                                        .emailVerifiedAt !=
                                    null
                                ? const Icon(
                                    LineAwesomeIcons.check_circle,
                                    color: Colors.green,
                                    size: 20.0,
                                  )
                                : const SizedBox(), // This will render an empty space if the email is not verified.

                            Text(
                              ' ${profileViewModel.userProfileModel.data!.email}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            profileViewModel.userProfileModel.data!.phone !=
                                    null
                                ? Text(
                                    ' ${profileViewModel.userProfileModel.data!.phone}',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.tPrimaryColor,
                                  side: BorderSide.none,
                                  shape: const StadiumBorder(),
                                ),
                                child: const Text(
                                  addPhone,
                                  style: TextStyle(color: AppColors.tDarkColor),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.toNamed(RoutesName.update_profile);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.tPrimaryColor,
                                  side: BorderSide.none,
                                  shape: const StadiumBorder(),
                                ),
                                child: const Text(
                                  updateProfile,
                                  style: TextStyle(color: AppColors.tDarkColor),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 22,
                        ),
                        const Divider(),
                        //Menu
                        ProfileMenuWidget(
                            title: menu1,
                            icon: LineAwesomeIcons.cog,
                            onPress: () {}),
                        ProfileMenuWidget(
                            title: menu3,
                            icon: LineAwesomeIcons.wallet,
                            onPress: () {}),
                        ProfileMenuWidget(
                            title: menu4,
                            icon: LineAwesomeIcons.user_check,
                            onPress: () {}),
                        const Divider(color: Colors.grey),
                        const SizedBox(
                          height: 10,
                        ),
                        ProfileMenuWidget(
                            title: menu2,
                            icon: LineAwesomeIcons.info,
                            onPress: () {}),
                        ProfileMenuWidget(
                            title: logoutDialogHeading,
                            icon: LineAwesomeIcons.alternate_sign_out,
                            onPress: () {
                              userPreference.removeUser().then((value) {
                                Get.toNamed(RoutesName.login);
                              });
                            },
                            textColor: Colors.red,
                            endIcon: false),
                      ],
                    ),
                  ),
                ),
        ));
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.textColor,
    this.endIcon = true,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? AppColors.tPrimaryColor : AppColors.tAccentColor;
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: iconColor.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.apply(color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Icon(
                LineAwesomeIcons.angle_right,
                size: 10.0,
                color: iconColor,
              ),
            )
          : null,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mvvm/res/colors.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/res/image_strings.dart';
import 'package:mvvm/res/sizes.dart';
import 'package:mvvm/res/text_strings.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:mvvm/view_model/user_post_view_model.dart';
import 'package:provider/provider.dart';

class UserPostView extends StatefulWidget {
  const UserPostView({Key? key}) : super(key: key);

  @override
  State<UserPostView> createState() => _UserPostViewState();
}

class _UserPostViewState extends State<UserPostView> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  FocusNode titleFocusNode = FocusNode();
  FocusNode stateFocusNode = FocusNode();
  FocusNode categoryFocusNode = FocusNode();
  FocusNode descriptionFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _titleController.dispose();
    _descriptionController.dispose();

    titleFocusNode.dispose();
    descriptionFocusNode.dispose();
  }

  String selectedState = '';
  String selectedCategory = '';
  bool isToggleOn = false;
  List<String> states = [
    'State 1',
    'State 2',
    'State 3'
  ]; // Replace with your actual state values
  List<String> categories = [
    'Room',
    'Job',
    'Sales',
    'Announcement',
    'Lost & Found'
  ]; // Replace with your actual category values

  @override
  Widget build(BuildContext context) {
    final userPostViewModel = Provider.of<UserPostViewModel>(context);
    final size = MediaQuery
        .of(context)
        .size;
    final txtTheme = Theme
        .of(context)
        .textTheme;
    var isDarkMode = MediaQuery
        .of(context)
        .platformBrightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: isDarkMode ? Colors.transparent : AppColors
              .whiteColor,
          title: Text(adAppHeader, style: txtTheme.titleLarge,),
          iconTheme: IconThemeData(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(adForm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(adsubHeader, style: txtTheme.headlineSmall,),
                SizedBox(height: tFormHeightSize - 15,),
                TextFormField(
                  controller: _titleController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: adTitle,
                    labelText: adTitle,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.title),
                  ),
                  autofocus: true,
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(
                        context, titleFocusNode, stateFocusNode);
                  },
                ),
                SizedBox(height: tFormHeightSize - 15,),
                DropdownButtonFormField<String>(
                  items: states.map((state) {
                    return DropdownMenuItem<String>(
                      value: state,
                      child: Text(state),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedState = value!;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: adState,
                    labelText: adState,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.location_on),
                  ),
                ),
                SizedBox(height: tFormHeightSize - 15,),
                DropdownButtonFormField<String>(
                  items: categories.map((category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectedCategory = value!;
                    // Call the updateSelectedCategory method in the viewModel
                    userPostViewModel.updateSelectedCategory(value!);
                  },
                  decoration: InputDecoration(
                    hintText: adCategories,
                    labelText: adCategories,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.category_outlined),
                  ),
                ),
                SizedBox(height: tFormHeightSize - 15,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 1,
                          child: buildCustomRadio(userPostViewModel, adType1)
                      ),
                      Expanded(
                          flex: 1,
                          child: buildCustomRadio(userPostViewModel, adType2)
                      ),
                    ],
                  ),
                ),
                SizedBox(height: tFormHeightSize - 15,),
                Column(
                  children: [
                    TextFormField(
                      controller: _descriptionController,
                      keyboardType: TextInputType.text,
                      maxLines: 6,
                      onChanged: userPostViewModel.updateAdditionalDetails,
                      decoration: InputDecoration(
                        hintText: adDescription,
                        labelText: userPostViewModel.remainingWordCount==150 ? adDescription : '${adRemaingWordCount} ${userPostViewModel
                            .remainingWordCount}' ,
                        border: OutlineInputBorder(),
                        alignLabelWithHint: true,
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '${adRemaingWordCount} ${userPostViewModel
                            .remainingWordCount}',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: tFormHeightSize - 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(adPhoneToggle, style: txtTheme.titleSmall,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isToggleOn = !isToggleOn;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: isToggleOn ? Colors.green : Colors.grey,
                        ),
                        child: Stack(
                          children: [
                            AnimatedAlign(
                              duration: Duration(milliseconds: 300),
                              alignment: isToggleOn
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Container(
                                width: 25,
                                height: 25,
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: tFormHeightSize - 15,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Map data = {
                        'title' : _titleController.text.toString(),
                        'state' : selectedState,
                        'category' : selectedCategory,
                        'des' : _descriptionController.text.toString(),
                        'type' :userPostViewModel.selectedOption,
                        'phone': isToggleOn.toString(),
                      };
                      print('api hit');
                      userPostViewModel.userPostApi(data, context);
                    },
                    child: Text(adSubmit.toUpperCase()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildCustomRadio(UserPostViewModel viewModel, String value) {
    if (viewModel.selectedCategory == 'Announcement' ||
        viewModel.selectedCategory == 'Sales' ||  viewModel.selectedCategory == 'Lost & Found') {
      return SizedBox.shrink();
    } else {
      return GestureDetector(
        onTap: () {
          viewModel.updateSelectedOption(value);
        },
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: viewModel.selectedOption == value ? Colors.green : Colors
                .transparent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: viewModel.selectedOption == value ? Colors.white : Colors
                      .black,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
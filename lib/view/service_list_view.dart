import 'package:flutter/material.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/model/services_list_model.dart';
import 'package:mvvm/res/colors.dart';
import 'package:mvvm/res/components/app_bar_widget.dart';
import 'package:mvvm/res/text_strings.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/service_detail_view.dart';
import 'package:mvvm/view_model/service_list_view_model.dart';
import 'package:provider/provider.dart';

class ServiceListView extends StatefulWidget {
  const ServiceListView({Key? key}) : super(key: key);

  @override
  State<ServiceListView> createState() => _ServiceListViewState();
}

class _ServiceListViewState extends State<ServiceListView> {
  ServiceListViewModel serviceListViewModel = ServiceListViewModel();
  int selectedService = -1;

  @override
  void initState() {
    serviceListViewModel.fetchServiceListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final txtTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: buildAppBar(serviceTitle, isDarkMode, txtTheme, context),
      body: ChangeNotifierProvider<ServiceListViewModel>(
          create: (BuildContext context) => serviceListViewModel,
          child:
              Consumer<ServiceListViewModel>(builder: (context, value, child) {
            switch (value.serviceList.status) {
              case Status.LOADING:
                return CircularProgressIndicator();
              case Status.ERROR:
                return Center(
                    child: Text(value.serviceList.message.toString()));
              case Status.COMPLETED:
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Expanded(
                        child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.5,
                              crossAxisSpacing: 15.0,
                              mainAxisSpacing: 15.0,
                            ),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: value.serviceList.data!.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return serviceContainer(
                                  value.serviceList.data!.data![index].icon!
                                      .toString(),
                                  value.serviceList.data!.data![index].title!
                                      .toString(),
                                  value.serviceList.data!.data![index].id!);
                            }),
                      ),
                    ),
                  ),
                );
            }
            return Container();
          }
          )
      ),
    );
  }

  serviceContainer(String image, String name, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServiceDetailView(),
            settings: RouteSettings(
              arguments: {
                'index': index,
                'name': name,
              },
            ),
          ),
        );
        setState(() {
          if (selectedService == index)
            selectedService = -1;
          else
            selectedService = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: selectedService == index
              ? Colors.blue.shade50
              : Colors.grey.shade100,
          border: Border.all(
            color: selectedService == index
                ? AppColors.tPrimaryColor
                : AppColors.tPrimaryColor.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network(image, height: 40),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  name,
                  style:
                      TextStyle(fontSize: 20, color: AppColors.tSecondaryColor),
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
      ),
    );
  }
}

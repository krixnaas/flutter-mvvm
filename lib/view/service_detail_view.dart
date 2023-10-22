import 'package:flutter/material.dart';
import 'package:mvvm/res/colors.dart';
import 'package:mvvm/res/components/single_item.dart';
import 'package:mvvm/res/components/sliver_spacer.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:provider/provider.dart';
class ServiceDetailView extends StatefulWidget {
  @override
  _ServiceDetailViewState createState() => _ServiceDetailViewState();
}

class _ServiceDetailViewState extends State<ServiceDetailView> {

  HomeViewModel homeViewModel = HomeViewModel();

  int index = 0;
  String name = '';


  @override
  void initState() {
    homeViewModel.loadMoreItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    var isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (args != null) {
      index = args['index'] as int;
      name = args['name'] as String;

    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.transparent : AppColors.whiteColor,
        title: Text(name, style: txtTheme.titleLarge,),
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        elevation: 1,
      ),
      backgroundColor: AppColors.AppPageBackgroundColor,
    body: ChangeNotifierProvider<HomeViewModel>(
    create: (BuildContext context) => homeViewModel,
    child: CustomScrollView(
        slivers:  [
          SliverSpacer(height: 15,),
            Consumer<HomeViewModel>(
              builder: (context, value, child) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      if (index < value.items.length) {
                        // Display the item
                        final item = value.items[index];
                        return SingleItem(
                          title: "Something",
                          time: "32 min ago",
                          isFav: false,
                          state: "NSW",
                          description: "Something Long",
                          phone: "0450102131",
                          message: "0450102131",
                        );
                      } else {
                        // Reached the end of the list, show a loading indicator
                        if (value.isLoading && value.items.isNotEmpty) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          // Reached the end of the list and no more items to load
                          return Container();
                        }
                      }
                    },
                    childCount: value.items.length + 1, // +1 for the loading indicator
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

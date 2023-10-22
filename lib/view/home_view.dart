import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/res/colors.dart';
import 'package:mvvm/res/components/app_bar_widget.dart';
import 'package:mvvm/res/components/carousel_loading.dart';
import 'package:mvvm/res/components/home_categories.dart';
import 'package:mvvm/res/components/single_item.dart';
import 'package:mvvm/res/components/sliver_spacer.dart';
import 'package:mvvm/res/image_strings.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel homeViewModel = HomeViewModel();
  ScrollController _scrollController = ScrollController();

  List<Map> categoriesList = [
    {'name': 'Room', 'iconPath': 'images/cat.png'},
    {'name': 'Job', 'iconPath': 'images/dog.png'},
    {'name': 'Event', 'iconPath': 'images/rabbit.png'},
    {'name': 'Patro', 'iconPath': 'images/parrot.png'},
    {'name': 'L&F', 'iconPath': 'images/horse.png'}
  ];

  @override
  void initState() {
    homeViewModel.fetchBannerListApi();
    homeViewModel.loadMoreItems();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }
  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      // Reached the bottom of the scroll view, load more items
      homeViewModel.loadMoreItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    final userPrefrence = Provider.of<UserViewModel>(context);
    var isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final txtTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: buildAppBar("Home",isDarkMode, txtTheme, context),
        backgroundColor: AppColors.AppPageBackgroundColor,
        body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => homeViewModel,
        child: CustomScrollView(
          slivers: [
            SliverSpacer(height: 10,),
            SliverToBoxAdapter(
              child:  Consumer<HomeViewModel>(builder: (context, value, child){
                print(value.bannerList);
                switch(value.bannerList.status){
                  case Status.LOADING:
                    return CarouselLoading();
                  case Status.ERROR:
                    return Center(child: Text(value.bannerList.message.toString()));
                  case Status.COMPLETED:
                    return Container(
                      child: CarouselSlider.builder(
                        itemCount: value.bannerList.data!.data!.length,
                        itemBuilder: (context, index, _) {
                          return Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)), // Same border radius value as the container
                              child: Image.network(
                                value.bannerList.data!.data![index].url!.toString(),
                                fit: BoxFit.cover,
                                width: 380,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),

                          );
                        },
                        options: CarouselOptions(
                          height: 200,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          viewportFraction: 0.9,
                        ),
                      ),

                    );

                }
                return Container();
              },
              ),
            ),
            SliverSpacer(height: 20,),
            SliverPinnedHeader(
              child: Container(
                height: 100,
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: AppColors.AppPageBackgroundColor,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesList.length,
                  itemBuilder: (context,index){
                    return Categories(title: categoriesList[index]['name']);
                  },
                ),
              ),
            ),
            SliverSpacer(height: 20,),
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
                          time: "32 min ago a",
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
      )
    );
  }

}
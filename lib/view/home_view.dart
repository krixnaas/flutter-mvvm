import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/res/colors.dart';
import 'package:mvvm/res/components/app_bar_widget.dart';
import 'package:mvvm/res/components/carousel_loading.dart';
import 'package:mvvm/res/image_strings.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel homeViewModel = HomeViewModel();
  @override
  void initState() {
    // TODO: implement initState
    homeViewModel.fetchBannerListApi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final userPrefrence = Provider.of<UserViewModel>(context);
    var isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final txtTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: buildAppBar("Home",isDarkMode, txtTheme, context),
        body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => homeViewModel,
        child: Column(
          children: [
            Consumer<HomeViewModel>(builder: (context, value, child){
              switch(value.bannerList.status){
                case Status.LOADING:
                  return CarouselLoading();
                case Status.ERROR:
                  return Center(child: Text(value.bannerList.message.toString()));
                case Status.COMPLETED:
                  return Container(
                          child: CarouselSlider.builder(
                            itemCount: value.bannerList.data!.movies!.length,
                            itemBuilder: (context, index, _) {
                            return Container(
                               child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10)), // Same border radius value as the container
                                child: Image.network(
                                  value.bannerList.data!.movies![index].url!.toString(),
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
                              viewportFraction: 1,
                          ),
                    ),

                  );

                    /*ListView.builder(
                      itemCount: value.moviesList.data!.response!.length,
                      itemBuilder: (context,index){
                        return Card(
                          child: ListTile(
                            leading: Image.network(
                              value.moviesList.data!.response![index].images![0].url.toString(),
                              errorBuilder: (context, error, stack){
                                return Icon(Icons.error, color: Colors.red,);
                              },
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                            title: Text(value.moviesList.data!.response![index].name.toString()),
                            subtitle: Text(value.moviesList.data!.response![index].contentCount.toString()),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.star , color: Colors.yellow,)
                              ],
                            ),
                          ),
                        );
                      });*/

              }
              return Container();
            },
            ),
            SizedBox(height: 10,),
            Consumer<HomeViewModel>(
              builder: (context, viewModel, child) {
                return AnimatedToggleSwitch<int>.rollingByHeight(
                  current: viewModel.selectedIndex,
                  values: const [0, 1],
                  onChanged: (value) {
                    viewModel.setIndex(value);
                  },
                  borderRadius: BorderRadius.circular(75.0),
                  indicatorSize: const Size.square(1.5),
                  borderWidth: 5,
                  customIconBuilder: (context, local, global) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${local.value}'),
                      ],
                    );
                  },

                );

              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'AnimatedToggleSwitch.size with some custom settings:',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      )
    );
  }
}

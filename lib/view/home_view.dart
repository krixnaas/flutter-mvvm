import 'package:flutter/material.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

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
    homeViewModel.fetchMovieListApi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final userPrefrence = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: (){
              userPrefrence.remove().then((value){
                Navigator.pushNamed(context, RoutesName.login);
              });
            },
            child: Center(child: Text('Logout')),
          ),
          SizedBox(width: 20,),
        ],
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => homeViewModel,
        child: Consumer<HomeViewModel>(builder: (context, value, child){
          switch(value.moviesList.status){
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(child: Text(value.moviesList.message.toString()));
            case Status.COMPLETED:
              return ListView.builder(
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
                  });

          }
          return Container();
        },
        ),
      )
    );
  }
}

import 'package:news_project/cubit/appstates.dart';
import 'package:news_project/cubit/cubit.dart';
import 'package:news_project/Screens/search/SearchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appcubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = appcubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SearchScreen();
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    cubit.changeAppMode();
                  },
                  icon: const Icon(Icons.brightness_4))
            ],
          ),
          body: cubit.screens[cubit.navigationindex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeappnavatate(index);
            },
            items: cubit.bottomitem,
            currentIndex: cubit.navigationindex,
          ),
        );
      },
    );
  }
}

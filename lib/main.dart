import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/blocobserver/blocobserver.dart';
import 'package:news_project/cubit/appstates.dart';
import 'package:news_project/cubit/cubit.dart';
import 'package:news_project/Screens/HomeLayout/HomeLayout.dart';
import 'package:news_project/shared/conestants/constants.dart';
import 'package:news_project/network/local/sharedprefernces.dart';
import 'package:news_project/style/themes/themes.dart';

//////////// news app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () {},
    blocObserver: MyBlocObserver(),
  );
  diohelper.init();
  await Cachehelper.init();

  bool? isDark = Cachehelper.getBoolean(key: 'isDark');
  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  MyApp({
    this.isDark,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => appcubit()
              ..getbusiness()
              ..getsports()
              ..getscience()),
      ],
      child: BlocConsumer<appcubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: appcubit.get(context).isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                debugShowCheckedModeBanner: false,
                home: HomeLayout());
          }),
    );
  }
}

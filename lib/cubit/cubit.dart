import 'package:news_project/Screens/BusinessScreen/BusinessScreen.dart';
import 'package:news_project/Screens/ScienceScreen/ScienceScreen.dart';
import 'package:news_project/Screens/SportsScreen/SportsScreen.dart';
import 'package:news_project/cubit/appstates.dart';
import 'package:news_project/network/local/sharedprefernces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/shared/conestants/constants.dart';

class appcubit extends Cubit<AppStates> {
  appcubit() : super(IntiateState());
  static appcubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    SportsScreen(),
    BusinessScreen(),
    ScienceScreen(),
  ];
  int navigationindex = 0;
  List<BottomNavigationBarItem> bottomitem = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
  ];
  void changeappnavatate(index) {
    navigationindex = index;
    if (index == 0) {
      getbusiness();
    }
    if (index == 1) {
      getsports();
    }
    if (index == 2) {
      getscience();
    }
    emit(ChangeNavBarState());
  }
//////////////////get business news
  List<dynamic> business = [];
  void getbusiness() {
    String Apikey = '95d3f47de5b147119e88ef61671775ab';
    diohelper.getData(
      url: 'https://newsapi.org/v2/top-headlines',
      query: {'country': 'eg', 'category': 'business', 'apiKey': Apikey},
    ).then((value) {
      business = value.data['articles'];
      emit(GetBusinessDataSucess());
    }).catchError((error) {
      print('the error is  ${error.toString()}');
      emit(GetBusinessDataFailed(error.toString()));
    });
  }
  ///////////////////finish
//////////////////get sports news
  List<dynamic> sports = [];
  void getsports() {
    if (sports.length == 0) {
      emit(LoadingGetSportsDataState());
      String ApiKey = '95d3f47de5b147119e88ef61671775ab';
      diohelper.getData(
        url: 'https://newsapi.org/v2/top-headlines',
        query: {'country': 'eg', 'category': 'sports', 'apiKey': ApiKey},
      ).then((value) {
        sports = value.data['articles'];
        emit(GetSportsDataSucess());
      }).catchError((error) {
        print('the error is  ${error.toString()}');
        emit(GetSportsDataFailed(error.toString()));
      });
    } else {
      emit(GetSportsDataSucess());
    }
  }
///////////////////finish
//////////////////get science news
  List<dynamic> science = [];
  void getscience() {
    if (science.length == 0) {
      emit(loadinggetsciencedatastate());
      String Apikey = '95d3f47de5b147119e88ef61671775ab';
      diohelper.getData(
        url: 'https://newsapi.org/v2/top-headlines',
        query: {'country': 'eg', 'category': 'science', 'apiKey': Apikey},
      ).then((value) {
        science = value.data['articles'];
        emit(GetScienceDataSucess());
      }).catchError((error) {
        print('the error is  ${error.toString()}');
        emit(GetScienceDataFailed(error.toString()));
      });
    } else {
      emit(GetScienceDataSucess());
    }
  }
///////////////////finish
//////////////////get search news
  //https://newsapi.org/v2/everything?q=su&apiKey=95d3f47de5b147119e88ef61671775ab
  List<dynamic> search = [];
  void getsearch(String q) {
    emit(loadinggetsearchdatastate());
    search = [];
    String Apikey = '95d3f47de5b147119e88ef61671775ab';
    diohelper.getData(
      url: 'https://newsapi.org/v2/everything',
      query: {'q': q, 'apiKey': Apikey},
    ).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(getsearchdatasucess());
    }).catchError((error) {
      print('the error is  ${error.toString()}');
      emit(getsearchdatafailed(error.toString()));
    });
  }
////////////finish
  ////////////change app mode
  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(applydarkmodestate());
    } else {
      isDark = !isDark;
      Cachehelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(applylightmodestate());
      });
    }
  }




}

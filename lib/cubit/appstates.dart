abstract class AppStates {}
class IntiateState extends AppStates {}
class News extends AppStates {}
class ChangeNavBarState extends AppStates {}
/////////////get business data
class GetBusinessDataSucess extends AppStates {}
class GetBusinessDataFailed extends AppStates {
  final String error;
  GetBusinessDataFailed(this.error);
}
class LoadingGetBusinessDataState extends AppStates {}
/////////////get sports data
class GetSportsDataSucess extends AppStates {}
class GetSportsDataFailed extends AppStates {
  final String error;
  GetSportsDataFailed(this.error);
}
class LoadingGetSportsDataState extends AppStates {}
/////////////get science data
class GetScienceDataSucess extends AppStates {}
class GetScienceDataFailed extends AppStates {
  final String error;
  GetScienceDataFailed(this.error);
}
class loadinggetsciencedatastate extends AppStates {}
/////////////get search data
class getsearchdatasucess extends AppStates {}
class getsearchdatafailed extends AppStates {
  final String error;
  getsearchdatafailed(this.error);
}
class loadinggetsearchdatastate extends AppStates {}

/////////////mode states
class applydarkmodestate extends AppStates {}
class applylightmodestate extends AppStates {}



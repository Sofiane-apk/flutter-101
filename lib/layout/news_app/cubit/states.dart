abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsButtomNavState extends NewsStates {}
  
class NewsGetbusinessLoadingState extends NewsStates {}
  
class NewsGetbusinessSuccessState extends NewsStates {}

class NewsGetbusinessErrorState extends NewsStates {
  final String error;
  NewsGetbusinessErrorState(this.error);
}

////sport News///
class NewsGetSportsLoadingState extends NewsStates {}
  
class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  final String error;
  NewsGetSportsErrorState(this.error);
}

////sport Science///
class NewsGetScienceLoadingState extends NewsStates {}
  
class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {
  final String error;
  NewsGetScienceErrorState(this.error);
}

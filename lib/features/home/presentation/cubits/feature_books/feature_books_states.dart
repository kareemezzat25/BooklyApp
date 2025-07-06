abstract class FeatureBooksStates {}

class FeatureBooksInitialState extends FeatureBooksStates {}

class FeatureBooksLoadingState extends FeatureBooksStates {}

class FeatureBookSuccessState extends FeatureBooksStates {}

class FeatureBookFailureState extends FeatureBooksStates {
  String errMessage;
  FeatureBookFailureState({required this.errMessage});
}

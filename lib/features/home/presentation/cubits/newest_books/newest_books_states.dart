abstract class NewestBookStates {}

class NewestBookInitialState extends NewestBookStates {}

class NewestBookLoadingState extends NewestBookStates {}

class NewestBookFailureState extends NewestBookStates {
  String errMessage;
  NewestBookFailureState({required this.errMessage});
}

class NewestBookSuccessState extends NewestBookStates {}

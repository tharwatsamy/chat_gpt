class ChatStates {}

class InitialState extends ChatStates {}

class MessageLoadedState extends ChatStates {}

class ErrorState extends ChatStates {
  final String errMessage;

  ErrorState(this.errMessage);
}

class LoadingState extends ChatStates {}

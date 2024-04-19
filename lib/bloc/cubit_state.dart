import '../cubbit_database/cubit_modal.dart';

abstract class  TodoState{}

class intialState extends TodoState{}

class LoadingState extends TodoState{}

class LoadedState extends TodoState{
  List<CubitModal> allnotes;
  LoadedState({required this .allnotes});
}


class ErrorState extends TodoState{
  String errorMsg;
  ErrorState({required this.errorMsg});
}
part of 'get_help_cubit.dart';

abstract class GetHelpStates {}

class GetHelpInitial extends GetHelpStates {}

class GetHelpDataLoadingState extends GetHelpStates {}

class GetHelpDataSuccessState extends GetHelpStates {}

class GetHelpDataErrorState extends GetHelpStates {
  final String error;
  GetHelpDataErrorState(this.error);
}

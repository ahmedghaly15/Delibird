import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/get_help_model.dart';
import '../../../domain/get_help_repo.dart';

part 'get_help_state.dart';

class GetHelpCubit extends Cubit<GetHelpStates> {
  GetHelpCubit(this.getHelpRepo) : super(GetHelpInitial());

  GetHelpRepo getHelpRepo;

  static GetHelpCubit getObject(context) => BlocProvider.of(context);

  GetHelpModel? getHelpModel;

  void getHelpData() {
    emit(GetHelpDataLoadingState());
    getHelpRepo.getHelpData().then((value) {
      getHelpModel = GetHelpModel.fromJson(value.data);
      emit(GetHelpDataSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetHelpDataErrorState(error.toString()));
    });
  }
}

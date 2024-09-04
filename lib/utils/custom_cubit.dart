import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCubit<T> extends Cubit<T> {
  CustomCubit(super.initState);

  static CustomCubit<T> get<T>(context) =>
      BlocProvider.of<CustomCubit<T>>(context);

  void changeState(T newState, {Function? function}) {
    if (state == newState) return;
    emit(newState);
    function?.call();
  }

  void startWith(Function function) => function();
}

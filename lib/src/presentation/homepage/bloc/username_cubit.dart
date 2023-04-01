import 'package:flutter_bloc/flutter_bloc.dart';

enum Usernamestate { novalue, hasvalue }

class UsernameCubit extends Cubit<Usernamestate> {
  UsernameCubit() : super(Usernamestate.novalue);

  void containValue() => emit(Usernamestate.hasvalue);
  void novalue() => emit(Usernamestate.novalue);
}

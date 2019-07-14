import 'package:bloc/bloc.dart';
import 'package:flutter_learning/data/repositories/authentication_repository.dart';
import 'package:flutter_learning/domain/blocs/login/login_event.dart';
import 'package:flutter_learning/domain/blocs/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository _authenticationRepository;
  final LoginBloc loginBloc;

  LoginBloc(this._authenticationRepository, this.loginBloc);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is Login) {
      yield LoginLoading();

      try {
        String token = await this
            ._authenticationRepository
            .login(userName: event.userName, password: event.password);

        this.loginBloc.dispatch(LoggedIn(token: token));

        yield LoginInitial();
      } catch (error) {
        yield LoginError(error: error.toString());
      }
    }
  }
}

import 'package:bloc_test/data/models/login_response.dart';
import 'package:bloc_test/data/repositories/login_repository.dart';
import 'package:bloc_test/presentation/blocs/login/login_event.dart';
import 'package:bloc_test/presentation/blocs/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;

  LoginBloc({required this.repository}) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<PerformLogin>(_onPerformLogin);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    try {
      final loginData = await repository.login(
          event.username, event.password, event.languageId);
      // if (event.rememberMe) {
      //   await prefs.setString('token', token);
      //   await prefs.setString('username', event.username);
      // }
      add(PerformLogin(loginData));
      //emit(LoginSuccess(loginResponse));
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }

  Future<void> _onPerformLogin(
    PerformLogin event,
    Emitter<LoginState> emit,
  ) async {
    try {
      final loginResponse = LoginResponse.fromJson(event.loginData);

      if (loginResponse.isInvalidCredentials) {
        emit(LoginInvalidCredentials('Invalid username or password'));
        return;
      }

      if (loginResponse.result == null) {
        emit(LoginError('Invalid response format'));
        return;
      }

      emit(LoginSuccess(loginResponse));
    } catch (e) {
      emit(LoginError('Failed to process login response: ${e.toString()}'));
    }
  }
}

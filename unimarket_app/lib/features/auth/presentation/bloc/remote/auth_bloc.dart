import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimarket_app/core/resources/data_state.dart';
import 'package:unimarket_app/features/auth/domain/usecases/signin_usecase.dart';
import 'package:unimarket_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:unimarket_app/features/auth/presentation/bloc/remote/auth_event.dart';
import 'package:unimarket_app/features/auth/presentation/bloc/remote/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;

  AuthBloc(this._signInUseCase, this._signUpUseCase)
      : super(const InitialState()) {
    on<SignIn>(onSignIn);
    on<SignUp>(onSignUp);
  }

  void onSignIn(SignIn signIn, Emitter<AuthState> emit) async {
    print("SignIn event triggered");

    emit(const SignInLoading());
    final datastate = await _signInUseCase(params: signIn.signInModel);

    if (datastate is DataSuccess && datastate.data != null) {
      emit(SignInLoadingDone(token: datastate.data!));
    }

    if (datastate is DataFailed) {
      emit(SignInLoadingError(error: datastate.error!));
    }
  }

  void onSignUp(SignUp signUp, Emitter<AuthState> emit) async {
    print("SignUp event triggered");

    emit(const SignUpLoading());
    final datastate = await _signUpUseCase(params: signUp.signUpModel);

    if (datastate is DataSuccess && datastate.data != null) {
      print("token ${datastate.data!}");
      emit(SignUpLoadingDone(response: datastate.data!));
    }

    if (datastate is DataFailed) {
      emit(SignUpLoadingError(error: datastate.error!));
    }
  }
}

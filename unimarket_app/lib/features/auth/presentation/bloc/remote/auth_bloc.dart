import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimarket_app/core/resources/data_state.dart';
import 'package:unimarket_app/features/auth/domain/usecases/signin_usecase.dart';
import 'package:unimarket_app/features/auth/presentation/bloc/remote/auth_event.dart';
import 'package:unimarket_app/features/auth/presentation/bloc/remote/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase _signInUseCase;

  AuthBloc(this._signInUseCase) : super(const InitialState()) {
    on<SignIn>(onSignIn);
  }

  void onSignIn(SignIn signIn, Emitter<AuthState> emit) async {
    print("SignIn event triggered");

    emit(const SignInLoading());
    final datastate = await _signInUseCase(params: signIn.signInModel);

    if (datastate is DataSuccess && datastate.data != null) {
      print("token ${datastate.data!}");
      emit(SignInLoadingDone(token: datastate.data!));
    }

    if (datastate is DataFailed) {
      emit(SignInLoadingError(error: datastate.error!));
    }
  }
}

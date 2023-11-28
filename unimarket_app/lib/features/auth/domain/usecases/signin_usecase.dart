import 'package:unimarket_app/core/resources/data_state.dart';
import 'package:unimarket_app/core/usecase/usecase.dart';
import 'package:unimarket_app/features/auth/domain/repository/user_repository.dart';

class SignInUseCase implements UseCase {
  final UserRepository _userRepository;

  SignInUseCase(this._userRepository);

  @override
  Future<DataState<String>> call({params}) {
    return _userRepository.signin(params!);
  }
}

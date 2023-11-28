import 'package:unimarket_app/core/resources/data_state.dart';
import 'package:unimarket_app/core/usecase/usecase.dart';
import 'package:unimarket_app/features/auth/domain/repository/user_repository.dart';

class SignUpUseCase implements UseCase {
  final UserRepository _userRepository;

  SignUpUseCase(this._userRepository);

  @override
  Future<DataState<String>> call({params}) {
    return _userRepository.signup(params!);
  }
}

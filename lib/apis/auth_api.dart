import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/core/core.dart';

abstract class IAuthAPI {
  FutureEither<model.Account> signup({
    required String email,
    required String password,
  });
}

class AuthAPI implements IAuthAPI {
  final Account _account;

  AuthAPI({required account}) : _account = account;

  @override
  FutureEither<model.Account> signup({
    required String email,
    required String password,
  }) async {
    try {
      final account = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );

      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return left(Failure(
        e.message ?? 'Some unexpected error occurred',
        stackTrace,
      ));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}

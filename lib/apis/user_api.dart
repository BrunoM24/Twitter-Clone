import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/constants/constants.dart';
import 'package:twitter_clone/core/core.dart';
import 'package:twitter_clone/core/providers.dart';
import 'package:twitter_clone/models/user_model.dart';

final userAPIProvider = Provider<UserAPI>(
  (ref) => UserAPI(
    db: ref.watch(appwriteDBProvider),
  ),
);

abstract class IUserAPI {
  FutureEitherVoid saveUserData(UserModel userModel);
}

class UserAPI implements IUserAPI {
  final Databases _db;

  UserAPI({required db}) : _db = db;

  @override
  FutureEitherVoid saveUserData(UserModel userModel) async {
    try {
      await _db.createDocument(
        databaseId: AppwriteConstants.dbId,
        collectionId: AppwriteConstants.usersCollections,
        documentId: ID.unique(),
        data: userModel.toMap(),
      );

      return right(null);
    } on AppwriteException catch (e, stackTrace) {
      return left(Failure(e.message!, stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}

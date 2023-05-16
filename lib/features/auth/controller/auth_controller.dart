import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/apis/auth_api.dart';
import 'package:twitter_clone/core/utils.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) => AuthController(
    authAPI: ref.watch(authAPIProvider),
  ),
);

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authApi;

  AuthController({required AuthAPI authAPI})
      : _authApi = authAPI,
        super(false);

  Future<void> signup({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;

    final response = await _authApi.signup(email: email, password: password);

    state = false;

    response.fold(
      (failure) => showSnackBar(context, failure.message),
      (account) => print(account.email),
    );
  }

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;

    final response = await _authApi.login(email: email, password: password);

    state = false;

    response.fold(
      (l) => showSnackBar(context, l.message),
      (r) => print(r.userId),
    );
  }
}

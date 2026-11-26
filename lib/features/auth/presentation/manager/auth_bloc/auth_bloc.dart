import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEventLogin>((event, emit) async {
      emit(AuthLoading());

      try {
        await Future.delayed(const Duration(seconds: 1));

        const testEmail = 'admin@gmail.com';
        const testPassword = '12345678';

        if (event.email.trim().toLowerCase() == testEmail &&
            event.password == testPassword) {
          log('Login Success for ${event.email}');
          emit(AuthSuccess());
        } else {
          emit(
            AuthFailure(
              errorMessage: 'Invlid email or password',
            ),
          );
        }
      } catch (e) {
        log('Login Failure: $e');
        emit(AuthFailure(errorMessage: e.toString()));
      }
    });
  }
}

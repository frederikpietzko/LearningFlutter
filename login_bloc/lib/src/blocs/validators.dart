import 'dart:async';

class Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink) => email.contains('@')
          ? sink.add(email)
          : sink.addError('Enter a valid Email!'));

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) => password.length > 3
          ? sink.add(password)
          : sink.addError('Password to short!'));
}

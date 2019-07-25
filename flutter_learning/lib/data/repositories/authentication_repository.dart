import 'package:meta/meta.dart';

class AuthenticationRepository {
  Future<String> login({@required String userName, @required String password}) async {
    return Future<String>.value('dwadkwad394399kwaodawoododood');
  }

  Future<void> persistToken(String token) async {
    await Future.delayed(Duration(milliseconds: 500));
  }

  Future<void> deleteToken() async {
    await Future.delayed(Duration(milliseconds: 500));
  }

  Future<bool> hasToken() async {
    return await Future<bool>.value(false);
  }
}

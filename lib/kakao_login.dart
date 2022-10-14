import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:kakao_login_ex/social_login.dart';

class KakaoLogin implements SocialLogin {
  @override
  Future<bool> login() async {
    try {
      bool isInstalled =
          await isKakaoTalkInstalled(); // check if kakaotalk is installed

      if (isInstalled) {
        // if kakaotalk is installed, proceed with kakaotalk login function
        try {
          await UserApi.instance.loginWithKakaoTalk();
          return true;
        } catch (e) {
          return false;
        }
      } else {
        // if kakaotalk is not installed, proceed with kakao acount login
        try {
          await UserApi.instance.loginWithKakaoAccount();
          return true;
        } catch (e) {
          return false;
        }
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      return true;
    } catch (error) {
      return false;
    }
  }
}

const String kKakaoNativeAppKey = '95d0bf012f4eb66a908e9c3c97fa9e48';

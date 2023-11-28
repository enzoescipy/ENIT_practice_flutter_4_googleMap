part of 'app_pages.dart';

abstract class Routes {
  /// 메인
  static const ROOT = _Paths.ROOT;

  /// 탭
  static const TAB = _Paths.TAB;

  /// 홈
  static const HOME = _Paths.TAB + _Paths.Home;

  ///위치
  static const LOCATIONLIST = _Paths.TAB + _Paths.LOCATIONLIST;

  ///생성
  // static const LOCATIONCREATE = _Paths.TAB + _Paths.LOCATIONLIST + _Paths.CREATE;
}

abstract class _Paths {
  static const ROOT = '/';
  static const TAB = '/tab';
  static const Home = '/home';
  static const LOCATIONLIST = '/locationlist';
  // static const CREATE = '/create';
}

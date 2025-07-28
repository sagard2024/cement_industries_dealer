import 'package:cement_industries_dealer/app/modules/base/base_view.dart';

abstract class BasePresenter {
  var tag = 'BasePresenter';
  final BaseView _v;

  BasePresenter(this._v);

  void refreshTokenApi(Function success) async {}
}

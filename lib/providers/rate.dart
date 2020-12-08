import 'package:flutter/widgets.dart';

class RateProvider with ChangeNotifier {
  double _rating;
  int _count;

  double get rating {
    return _rating;
  }

  int get count {
    return _count;
  }

  void setRating(double rate) {
    _rating = rate;
    notifyListeners();
  }
}

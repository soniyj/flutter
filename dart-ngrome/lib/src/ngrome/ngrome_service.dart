import 'package:angular/core.dart';

@Injectable()
class NgRomeService {

  String _test; //private

  setString(String t) {
    _test = t;
  }

  // Returns (one line example)
  String getString() => _test;

}
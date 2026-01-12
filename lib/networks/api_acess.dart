import 'package:rxdart/subjects.dart';

import '../features/authentication/sign_in/data/rx.dart';
import '../features/authentication/sign_up/data/rx.dart';

// Authenticate
SignupRx signupRxObj = SignupRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
SigninRx signinRxObj = SigninRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

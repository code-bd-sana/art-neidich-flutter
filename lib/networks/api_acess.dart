import 'package:rxdart/subjects.dart';

import '../features/authentication/sign_up/data/rx.dart';

// Authenticate
SignupRx signupRxObj = SignupRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

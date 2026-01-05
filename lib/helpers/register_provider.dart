
import 'package:provider/provider.dart';
import '../provider/signup_provider.dart';


var providers = [
  //New
    ChangeNotifierProvider<SignupProvider>(
    create: ((context) => SignupProvider()),
  ), 
  
];

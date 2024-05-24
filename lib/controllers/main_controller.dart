import 'package:auth_flutter_with_firebase/auth/controllers/auth_controller.dart';
import 'package:auth_flutter_with_firebase/auth/entities/user_entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainController =
    StateNotifierProvider<AuthControllerNotifier, UserEntities?>(
  (ref) => AuthControllerNotifier(ref),
);

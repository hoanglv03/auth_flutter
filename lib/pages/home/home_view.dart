import 'package:auth_flutter_with_firebase/auth/auth_provider.dart';
import 'package:auth_flutter_with_firebase/components/button_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ButtonGradient(
        onPressed: () {
          ref.read(authControllerProvider.notifier).signOut();
        },
        textButton: "hi",
      ),
    );
  }
}

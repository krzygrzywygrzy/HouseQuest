import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/models/user.dart';

class Home {
  const Home({required loading, user})
      : _loading = loading,
        _user = user;

  final bool _loading;
  final User? _user;

  load() async {
    //TODO: fetch data
  }
}

class HomeProvider extends StateNotifier<Home> {
  HomeProvider() : super(const Home(loading: false));
}

final homeProvider =
    StateNotifierProvider<HomeProvider, Home>((ref) => HomeProvider());

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/models/user.dart';
import 'package:hq/services/fetch_service.dart';

class Home {
  Home({required loading, user})
      : _loading = loading,
        _user = user;

  final bool _loading;
  final User? _user;

  late FetchService _fetchService;

  load() async {
    _fetchService = FetchService();
    var data = await _fetchService.get("/grabUser");
    print(data);
  }
}

class HomeProvider extends StateNotifier<Home> {
  HomeProvider() : super(Home(loading: false));
}

final homeProvider =
    StateNotifierProvider<HomeProvider, Home>((ref) => HomeProvider());

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/core/failure.dart';
import 'package:hq/models/user.dart';
import 'package:hq/services/fetch_service.dart';

class Home {
  Home({
    required this.loading,
    this.user,
    this.failure,
  });

  final bool loading;
  final User? user;
  final Failure? failure;
}

class HomeProvider extends StateNotifier<Home> {
  HomeProvider() : super(Home(loading: false));
  late FetchService _fetchService;

  load() async {
    _fetchService = FetchService();
    var data = await _fetchService.get("/grabUser");

    data.fold(
      (l) => state = Home(loading: false, failure: l),
      (r) => state = Home(
        loading: false,
        user: User.fromJson(r),
      ),
    );
  }

  logOut() {
    state = Home(loading: false);
  }
}

final homeProvider =
    StateNotifierProvider<HomeProvider, Home>((ref) => HomeProvider());

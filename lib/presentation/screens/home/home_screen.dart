import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_restaurants/presentation/core/auth/auth_bloc.dart';
import 'package:search_restaurants/presentation/routes/app_navigator.dart';
import 'package:search_restaurants/presentation/screens/home/bloc/home_screen_bloc.dart';
import 'package:search_restaurants/presentation/screens/home/components/restaurant_list_tile.dart';
import 'package:search_restaurants/presentation/screens/home/components/search_box.dart';
import 'package:search_restaurants/presentation/utils/observer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeScreenBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<HomeScreenBloc>()..add(RestaurantsRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search restaurants'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(LogoutRequested());
              AppNavigator.navigateBackToAuthPage(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<HomeScreenBloc, HomeScreenState>(
            builder: (context, state) {
              return SearchBox(
                text: state.query,
                onChanged: (query) => bloc.add(QueryChanged(query.trim())),
                hintText: 'Search by city',
                onSubmited: (query) => bloc.add(RestaurantsRequested()),
              );
            },
          ),
          Observer<HomeScreenBloc, HomeScreenState>(
            onSuccess: (context, state) {
              return Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final restaurant = state.restaurants[index];

                    return RestaurantListTile(
                        restaurant: restaurant, onTap: () {});
                  },
                  itemCount: state.restaurants.length,
                ),
              );
            },
            onFailure: (context, state) {
              return const Center(
                child: Text('Error'),
              );
            },
          ),
        ],
      ),
    );
  }
}

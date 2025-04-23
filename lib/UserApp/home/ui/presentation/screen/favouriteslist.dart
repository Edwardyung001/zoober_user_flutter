import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zooberuserapp/UserApp/home/ui/presentation/bloc/home_bloc.dart';
import 'package:zooberuserapp/constants/routing.dart';
import 'package:zooberuserapp/storage/local_storage.dart';
import 'package:zooberuserapp/utils/custombutton.dart';

import 'favourites.dart';

class FavoritesListScreen extends StatefulWidget {
  @override
  State<FavoritesListScreen> createState() => _FavoritesListScreenState();
}

class _FavoritesListScreenState extends State<FavoritesListScreen> {
  @override
  void initState() {
    super.initState();
    fetching();
  }

  void fetching() async {
    final userId = await SecureStorage.getValue('userId');
    if (userId != null) {
      context.read<HomeBloc>().add(FetchingFavouriteRequested(userId: userId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Favourites'),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: ${state.error}")),
            );
          }
        },
        builder: (context, state) {
          if (state is HomeLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is FetchingFavouriteSuccess) {
            // Filter out deleted favourites
            final activeFavourites = state.favouriteList
                .where((fav) => fav['deleted_at'] == null) // Access `deleted_at` from the map
                .toList();

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  ...activeFavourites.map((fav) => _buildFavoriteItem(fav)),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      navigateTo(context, NewFavourites());
                    },
                    child: _buildAddNewButton(),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('No favourites found.'));
          }
        },
      ),
    );
  }

  Widget _buildFavoriteItem(dynamic fav) {
    // Ensure you're using map access for properties
    return Container(
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(_getIconForTitle(fav['title'])), // Access 'title' from map
        title: Text(fav['title'] ?? ''), // Access 'title' from map
        subtitle: Text(fav['description'] ?? ''), // Access 'description' from map
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: Icon(Icons.edit), onPressed: () {}),
            IconButton(icon: Icon(Icons.delete), onPressed: () {}),
          ],
        ),
      ),
    );
  }

  IconData _getIconForTitle(String title) {
    switch (title.toLowerCase()) {
      case 'home':
        return Icons.home;
      case 'work':
        return Icons.work;
      case 'gym':
        return Icons.fitness_center;
      case 'college':
        return Icons.school;
      case 'hostel':
        return Icons.domain;
      default:
        return Icons.place;
    }
  }

  Widget _buildAddNewButton() {
    return custombutton(text: "Add New");
  }
}

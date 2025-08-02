import 'package:favorite_places_app/Models/favorite_places.dart';
import 'package:favorite_places_app/Screens/new_favorite_place.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<FavoritePlaces> _favoritesPlaces = [];

  void _addFavoritePlace() async {
    final newFavoritePlace = await Navigator.of(context).push<FavoritePlaces>(
      MaterialPageRoute(builder: ((builder) => const NewFavoritePlace())),
    );

    if (newFavoritePlace == null || newFavoritePlace.title.trim().isEmpty) {
      return;
    }

    setState(() {
      _favoritesPlaces.add(newFavoritePlace);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites places'),
        actions: [
          IconButton(
            onPressed: _addFavoritePlace,
            icon: Icon(Icons.add_location),
          ),
        ],
      ),
      body: _favoritesPlaces.isEmpty
          ? const Center(child: Text('No places added yet'))
          : ListView.builder(
              itemCount: _favoritesPlaces.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text(
                    _favoritesPlaces[index].title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                );
              },
            ),
    );
  }
}

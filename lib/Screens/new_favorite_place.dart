import 'package:favorite_places_app/Models/favorite_places.dart';
import 'package:flutter/material.dart';

class NewFavoritePlace extends StatefulWidget {
  const NewFavoritePlace({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewFavoriteState();
  }
}

class _NewFavoriteState extends State<NewFavoritePlace> {
  final _formKey = GlobalKey<FormState>();
  String _enteredTitle = "";
  void _saveFavoritePlace() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
    Navigator.of(context).pop(FavoritePlaces(title: _enteredTitle));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Place")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 100,
                decoration: InputDecoration(
                  label: Text(
                    'Favorite place: ',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                onSaved: (value) {
                  if (value == null) {
                    return;
                  }

                  _enteredTitle = value;
                },
              ),
              ElevatedButton(
                onPressed: _saveFavoritePlace,
                child: const Text('Enter favorite place'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

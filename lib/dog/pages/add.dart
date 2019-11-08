import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../context.dart';
import '../model.dart';

/// Add page
class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _form = GlobalKey<FormState>();

  String _name;
  String _location;
  String _description;

  void _handleSubmit() {
    var add = Provider.of<DogContext>(context, listen: false).add;

    if (_form.currentState.validate()) {
      _form.currentState.save();

      add(Dog(
        name: _name,
        location: _location,
        description: _description,
        image: 'https://placehold.it/256x256',
      ));

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Add a new dog')),
        body: Form(
          key: _form,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 32.0,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TextFormField(
                        onSaved: (name) => _name = name,
                        validator: (name) =>
                            name.isEmpty ? 'A pup needs a name' : null,
                        decoration: InputDecoration(
                          labelText: 'Name',
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TextFormField(
                        onSaved: (location) => _location = location,
                        validator: (location) =>
                            location.isEmpty ? 'A pup needs a house' : null,
                        decoration: InputDecoration(
                          labelText: "Location",
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TextFormField(
                      onSaved: (description) => _description = description,
                      validator: (description) => description.isEmpty
                          ? 'A pup needs a description'
                          : null,
                      decoration: InputDecoration(
                        labelText: 'Description',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Builder(
                      builder: (context) => RaisedButton(
                        onPressed: _handleSubmit,
                        child: Text('Submit'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

import 'package:flutter/material.dart';

import '../model.dart';
import '../pages/details.dart';

/// Dog card
class DogCard extends StatelessWidget {
  /// Dog
  final Dog dog;

  /// DogCard constructor
  DogCard(this.dog);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(left: 8, top: 8, right: 8),
        child: InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailsPage(dog),
            ),
          ),
          child: Container(
              height: 120.0,
              child: Container(
                height: 120.0,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(children: [
                      Hero(
                          tag: dog,
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            margin: EdgeInsets.only(right: 8.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: dog.image == null
                                    ? AssetImage('assets/placeholder.png')
                                    : NetworkImage(dog.image),
                              ),
                            ),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(dog.name,
                              style: Theme.of(context).textTheme.headline),
                          Text(dog.location,
                              style: Theme.of(context).textTheme.subhead),
                          Row(
                            children: <Widget>[
                              Icon(Icons.star),
                              Text(': ${dog.rating} / 10')
                            ],
                          )
                        ],
                      )
                    ]),
                  ),
                ),
              )),
        ),
      );
}

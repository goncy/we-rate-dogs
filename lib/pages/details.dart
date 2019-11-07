import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/dog.dart';

class DetailsPage extends StatefulWidget {
  final Dog dog;

  DetailsPage(this.dog);

  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text('Meet ${widget.dog.name}')),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Hero(
                      tag: widget.dog,
                      child: Container(
                        height: 150,
                        width: 150,
                        margin: EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.dog.image),
                          ),
                        ),
                      )),
                  Column(
                    children: <Widget>[
                      Text(
                        '${widget.dog.name} 🎾',
                        style: const TextStyle(fontSize: 32.0),
                      ),
                      Text(
                        widget.dog.location,
                        style: const TextStyle(fontSize: 20.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(widget.dog.description),
                      )
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 40.0,
                    ),
                    Text(' ${widget.dog.rating} / 10',
                        style: Theme.of(context).textTheme.display1),
                  ],
                ),
                Slider(
                  activeColor: Colors.indigoAccent,
                  min: 0,
                  max: 10,
                  divisions: 10,
                  onChanged: (rating) =>
                      setState(() => widget.dog.rating = rating.toInt()),
                  value: widget.dog.rating.toDouble(),
                ),
              ],
            )
          ],
        ),
      ));
}

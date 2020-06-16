import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/domain/entities/people.dart';

class ListActors extends StatelessWidget {
  final List<People> actors;

  ListActors({Key key, @required this.actors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(vertical: 14),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actors.length,
        itemBuilder: (context, index) {
          final actor = actors[index];
          return _buildItem(actor);
        },
      ),
    );
  }

  Widget _buildItem(People actor) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 14),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://image.tmdb.org/t/p/w185/${actor.profilePath}',
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 4),
            width: 50,
            child: Text(
              actor.name,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13.0,
                color: Colors.black38,
                fontWeight: FontWeight.w500
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_movie_dp/features/movies_list/domain/entities/movie.dart';
import 'package:flutter_movie_dp/features/movies_list/domain/entities/people.dart';

import 'widgets/list_actors_widget.dart';
import 'widgets/list_movie_widget.dart';

class MoviesListPage extends StatelessWidget {
  final List<People> _listPeoplePopular = [
    People(
        id: '28782',
        name: 'Shu Qi',
        profilePath: '/z3sLuRKP7hQVrvSTsqdLjGSldwG.jpg'),
    People(
        id: '28782',
        name: 'Margot Robbie',
        profilePath: '/ylF5eBdfev0bgmFx8BFRmClqStM.jpg'),
    People(
        id: '28782',
        name: 'Paul Walker',
        profilePath: '/iqvYezRoEY5k8wnlfHriHQfl5dX.jpg'),
    People(
        id: '28782',
        name: 'Emilia Clarke',
        profilePath: '/tB1nE2LJH81f5UMiGhKCSlaqsF1.jpg'),
    People(
        id: '28782',
        name: 'Alexandra Daddario',
        profilePath: '/idDAi1sjaHDIlDc78D8G9HaJ8le.jpg'),
    People(
        id: '28782',
        name: 'Jason Statham',
        profilePath: '/PhWiWgasncGWD9LdbsGcmxkV4r.jpg'),
    People(
        id: '28782',
        name: 'Will Smith',
        profilePath: '/2iYXDlCvLyVO49louRyDDXagZ0G.jpg'),
    People(
        id: '28782',
        name: 'Scarlett Johansson',
        profilePath: '/8EueDe6rPF0jQU4LSpsH2Rmrqac.jpg'),
    People(
        id: '28782',
        name: 'Morgan Freeman',
        profilePath: '/oGJQhOpT8S1M56tvSsbEBePV5O1.jpg'),
    People(
        id: '28782',
        name: 'Rose Byrne',
        profilePath: '/laJdQNmsuR2iblYUggEqr49LvwJ.jpg'),
  ];

  final List<Movie> _listMovies = [
    Movie(
      title: 'Suicide Squad',
      overview:
          'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.',
      posterPath: '/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg',
      voteAverage: 5.91,
    ),
    Movie(
      title: 'Jason Bourne',
      overview:
          'The most dangerous former operative of the CIA is drawn out of hiding to uncover hidden truths about his past.',
      posterPath: '/lFSSLTlFozwpaGlO31OoUeirBgQ.jpg',
      voteAverage: 5.25,
    ),
    Movie(
      title: 'Now You See Me 2',
      overview:
          'One year after outwitting the FBI and winning the public’s adulation with their mind-bending spectacles, the Four Horsemen resurface only to find themselves face to face with a new enemy who enlists them to pull off their most dangerous heist yet.',
      posterPath: '/hU0E130tsGdsYa4K9lc3Xrn5Wyt.jpg',
      voteAverage: 6.64,
    ),
    Movie(
      title: 'The Jungle Book',
      overview:
          'An orphan boy is raised in the Jungle with the help of a pack of wolves, a bear and a black panther.',
      posterPath: '/h28t2JNNGrZx0fIuAw8aHQFhIxR.jpg',
      voteAverage: 6.42,
    ),
    Movie(
      title: 'The Boy Next Door',
      overview:
          'A recently cheated on married woman falls for a younger man who has moved in next door, but their torrid affair soon takes a dangerous turn.',
      posterPath: '/vOipe2myi26UDwP978hsYOrnUWC.jpg',
      voteAverage: 5.25,
    ),
    Movie(
      title: 'Mechanic: Resurrection',
      overview:
          'Arthur Bishop thought he had put his murderous past behind him when his most formidable foe kidnaps the love of his life. Now he is forced to travel the globe to complete three impossible assassinations, and do what he does best, make them look like accidents.',
      posterPath: '/tgfRDJs5PFW20Aoh1orEzuxW8cN.jpg',
      voteAverage: 7.8,
    ),
    Movie(
      title: 'Mad Max: Fury Road',
      overview:
          'An apocalyptic story set in the furthest reaches of our planet, in a stark desert landscape where humanity is broken, and most everyone is crazed fighting for the necessities of life. Within this world exist two rebels on the run who just might be able to restore order.',
      posterPath: '/kqjL17yufvn9OVLyXYpvtyrFfak.jpg',
      voteAverage: 7.26,
    ),
    Movie(
      title: 'Captain America: Civil War',
      overview:
          'Following the events of Age of Ultron, the collective governments of the world pass an act designed to regulate all superhuman activity. This polarizes opinion amongst the Avengers, causing two factions to side with Iron Man or Captain America, which causes an epic battle between former allies.',
      posterPath: '/5N20rQURev5CNDcMjHVUZhpoCNC.jpg',
      voteAverage: 6.93,
    ),
    Movie(
      title: 'The Jungle Book',
      overview:
          'An orphan boy is raised in the Jungle with the help of a pack of wolves, a bear and a black panther.',
      posterPath: '/h28t2JNNGrZx0fIuAw8aHQFhIxR.jpg',
      voteAverage: 6.42,
    ),
    Movie(
      title: 'The Boy Next Door',
      overview:
          'A recently cheated on married woman falls for a younger man who has moved in next door, but their torrid affair soon takes a dangerous turn.',
      posterPath: '/vOipe2myi26UDwP978hsYOrnUWC.jpg',
      voteAverage: 5.25,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        ListActors(actors: _listPeoplePopular),
        ListMovies(movies: _listMovies),
      ],
    );
  }
}

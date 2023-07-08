import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nba_stats/player_page.dart';
import 'package:nba_stats/standings_page.dart';
import 'package:nba_stats/team_page.dart';
import 'model/player_search.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchText = '';
  List<PlayerSearch> _playerDetails = [];
  final String url =
      'https://api.sportsdata.io/v3/nba/scores/json/Players?key=617306d4132c4bcfae85893b7853c54f';

  Future<void> getPlayerDetails() async {
    final response = await http.get(Uri.parse(url));
    final responseJson = json.decode(response.body);

    setState(() {
      for (Map<String, dynamic> user in responseJson) {
        _playerDetails.add(PlayerSearch.fromJson(user));
      }
    });

    // Print the length of the list
    print('Fetched ${_playerDetails.length} players from API.');
  }


  @override
  void initState() {
    super.initState();
    getPlayerDetails();
  }

  //Navigate Methods
  void navigateToTeamPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TeamPage()),
    );
  }

  void navigateToStandingsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StandingsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1f1545),
        title: Text('NBA Stats App'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(_playerDetails),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.orange[200],
        child: Column(
          children: [
            Container(
              color: Color(0xFF1f1545),
              child: ListTile(
                textColor: Colors.white,
                title: Text('Team Page'),
                onTap: navigateToTeamPage,
              ),
            ),
            Expanded(
              child: Container(
                color: Color(0xFF1f1545),
                child: ListTile(
                  textColor: Colors.white,
                  title: Text('Standings'),
                  onTap: navigateToStandingsPage,
                ),
              ),
            ),
       Container(
          alignment: Alignment.bottomCenter,
          child: Image.network(
            'https://i.cbc.ca/1.5443354.1580238594!/fileImage/httpImage/bryant-logo.jpg',
            fit: BoxFit.cover,
          ),
        ),

          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<PlayerSearch> playerDetails;

  CustomSearchDelegate(this.playerDetails);

  String get searchFieldLabel => 'Player Search';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = playerDetails.where((player) =>
    player.draftKingsName?.toLowerCase()?.contains(query.toLowerCase()) ==
        true).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final player = results[index];
        return ListTile(
          title: Text(player.draftKingsName ?? ''),
          onTap: () {
            close(context, player.draftKingsName ?? '');
            navigateToPlayerPage(context, player.playerID);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = playerDetails
        .where((player) =>
    player.draftKingsName?.toLowerCase()?.contains(query.toLowerCase()) ==
        true)
        .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final player = suggestionList[index];
        return ListTile(

          title: Text(player.draftKingsName ?? ''),
          onTap: () {
            query = player.draftKingsName ?? '';
            showResults(context);
          },
        );
      },
    );
  }

  void navigateToPlayerPage(BuildContext context, int? playerID) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlayerPage(playerID)),
    );
  }
}

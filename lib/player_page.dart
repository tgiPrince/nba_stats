import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:nba_stats/model/team_roster_page.dart';
import 'package:nba_stats/model/player_info.dart';

import 'model/team_roster.dart';

class PlayerPage extends StatefulWidget {
  final int? desiredPlayerID;

  const PlayerPage(this.desiredPlayerID, {Key? key}) : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  List<Map<String, dynamic>> seasonData = [];
  double ppg = 0.0;
  double mpg = 0.0;

  bool dataLoadingTimeout = false;
  late Timer dataLoadingTimer;


  @override
  void initState() {
    super.initState();
    fetchData();

    // Start the timer
    dataLoadingTimer = Timer(Duration(seconds: 5), () {
      setState(() {
        dataLoadingTimeout = true;
      });
    });
  }
//617306d4132c4bcfae85893b7853c54f
  @override
  void dispose() {
    // Cancel the timer to avoid memory leaks
    dataLoadingTimer.cancel();
    super.dispose();
  }
/////////NEED TO USE STILL
  Future<Map<String, dynamic>> fetchPlayerById(int playerId) async {
    final url = 'https://api.sportsdata.io/v3/nba/scores/json/Players?key=617306d4132c4bcfae85893b7853c54f'; // Replace with your API endpoint
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List<dynamic>;
      final playerData = jsonData.firstWhere(
            (data) => data['PlayerID'] == playerId,
        orElse: () => null,
      );

      if (playerData != null) {
        return playerData as Map<String, dynamic>;
      } else {
        throw Exception('Player not found');
      }
    } else {
      throw Exception('Failed to fetch player. Status code: ${response.statusCode}');
    }
  }


  Future<void> fetchData() async {
    try {
      List<String> urls = [
        "https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2024?key=617306d4132c4bcfae85893b7853c54f",
        "https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2023?key=617306d4132c4bcfae85893b7853c54f",
        "https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2022?key=617306d4132c4bcfae85893b7853c54f",
        "https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2021?key=617306d4132c4bcfae85893b7853c54f",
        "https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2020?key=617306d4132c4bcfae85893b7853c54f",
        "https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2019?key=617306d4132c4bcfae85893b7853c54f",
        "https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2018?key=617306d4132c4bcfae85893b7853c54f",
        "https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2017?key=617306d4132c4bcfae85893b7853c54f",
        "https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2016?key=617306d4132c4bcfae85893b7853c54f",
        "https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2015?key=617306d4132c4bcfae85893b7853c54f",
        "https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2014?key=617306d4132c4bcfae85893b7853c54f",
        "https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2013?key=617306d4132c4bcfae85893b7853c54f",
        "https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2012?key=617306d4132c4bcfae85893b7853c54f",
        "https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2011?key=617306d4132c4bcfae85893b7853c54f",
        "https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2010?key=617306d4132c4bcfae85893b7853c54f",
        "https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2009?key=617306d4132c4bcfae85893b7853c54f",
        "https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2008?key=617306d4132c4bcfae85893b7853c54f",
        "https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2007?key=617306d4132c4bcfae85893b7853c54f",
        "https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2006?key=617306d4132c4bcfae85893b7853c54f",
        "https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2005?key=617306d4132c4bcfae85893b7853c54f",
        "https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2004?key=617306d4132c4bcfae85893b7853c54f",
        "https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2003?key=617306d4132c4bcfae85893b7853c54f",
        "https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2002?key=617306d4132c4bcfae85893b7853c54f",

        // Add more URLs for additional seasons
      ];

      for (String url in urls) {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          for (var element in data) {
            if (element["PlayerID"] == widget.desiredPlayerID) {
              setState(() {
                seasonData.add(element);
                if (seasonData.length == 1) {
                  if (element["Games"] != 0) {
                    mpg = element["Minutes"].toDouble() / element["Games"].toDouble();
                    ppg = element["Points"].toDouble() / element["Games"].toDouble();
                  }
                }
              });
              break;
            }
          }
        } else {
          print('Request failed with status: ${response.statusCode}.');
        }
      }

      // Check if seasonData is empty after fetching data
      if (seasonData.isEmpty) {
        setState(() {
          dataLoadingTimeout = true;
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: seasonData.isNotEmpty
          ? AppBar(
        backgroundColor: Color(0xFF1f1545),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(width: 8),
            Text('${seasonData[0]["Name"]}'),
            Spacer(), // Add a spacer to push the picture to the right
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                "https://s3-us-west-2.amazonaws.com/static.fantasydata.com/headshots/nba/low-res/${seasonData[0]["PlayerID"]}.png",
              ),
            ),
          ],
        ),
      )
          : null,
      body: Container(
        color: Colors.orange[200],
        padding: EdgeInsets.all(16.0),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            if (seasonData.isNotEmpty) ...[
              Text(
                'Player Stats',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  _buildFixedTable(),
                  Expanded(
                    child: _buildScrollableTable(),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Points Per Game',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ppg.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Fantasy Points: ${seasonData[0]["FantasyPointsFanDuel"]}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Team: ${seasonData[0]["Team"]}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Pos: ${seasonData[0]["Position"]}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Player ID#: ${seasonData[0]["PlayerID"]}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
            if (dataLoadingTimeout)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No More Stats Available',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(style:ButtonStyle(
                      backgroundColor:MaterialStateProperty.all<Color>(Color(0xFF1f1545))  //Color(0xFF1f1545)
                    ),
                      onPressed: () {
                        Navigator.pop(context);

                      },
                      child: Text('Go Back'),
                    ),
                  ],
                ),
              ),
            if (!dataLoadingTimeout && seasonData.isEmpty)
              Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }

  Widget _buildFixedTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columnSpacing: 10,
        dataRowHeight: 40,
        headingRowHeight: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF1f1545),
            width: 5,
          ),
        ),
        columns: const [
          DataColumn(
            label: Text(
              'Season',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Team',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
        rows: seasonData.map((season) {
          return DataRow(
            cells: [
              DataCell(
                Text(
                  '${season["Season"]}',
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
              ),
              DataCell(
                Text(
                  '${season["Team"]}',
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildScrollableTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columnSpacing: 10,
          dataRowHeight: 40,
          headingRowHeight: 50,
          dividerThickness: 1,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFF1f1545),
              width: 5,
            ),
          ),
          columns: const [
            DataColumn(
              label: Text(
                'Season',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'GP',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'GS',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'MIN',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'PPG',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'FGM',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'FGA',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'FG%',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                '2P%',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                '3PM',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                '3PA',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                '3P%',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'OR',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'DR',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'REB',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'AST',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'BLK',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'STL',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'PF',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'TO',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
          rows: seasonData.map((season) {
            return DataRow(
              cells: [
                DataCell(
                  Text(
                    '${season["Season"]}',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
                DataCell(
                  Text(
                    '${season["Games"]}',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
                DataCell(
                  Text(
                    '${season["Started"]}',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
                DataCell(
                  Text(
                    '${(season["Minutes"].toDouble() / season["Games"].toDouble()).toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
                DataCell(
                  Text(
                    '${(season["Points"].toDouble() / season["Games"].toDouble()).toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
                DataCell(
                  Text(
                    '${season['FieldGoalsMade'].toInt()}',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
                DataCell(
                  Text(
                    '${season['FieldGoalsAttempted'].toInt()}',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
                DataCell(
                  Text(
                    '${season['FieldGoalsPercentage']}',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
                DataCell(
                  Text(
                    '${season['TwoPointersPercentage']}',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
                DataCell(
                  Text(
                    '${season['ThreePointersMade'].toInt()}',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
                DataCell(
                  Text(
                    '${season['ThreePointersAttempted'].toInt()}',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
                DataCell(
                  Text(
                    '${season['ThreePointersPercentage']}',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
                DataCell(
                  Text(
                    '${season['OffensiveReboundsPercentage']}',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
                DataCell(
                  Text(
                    '${season['DefensiveReboundsPercentage']}',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
                DataCell(
                  Text(
                    '${season['TotalReboundsPercentage']}',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
                DataCell(
                  Text(
                    '${season['AssistsPercentage']}',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
                DataCell(
                  Text(
                    '${season['BlocksPercentage']}',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
                DataCell(
                  Text(
                    '${season['StealsPercentage']}',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
                DataCell(
                  Text(
                    '${season['PersonalFouls']}',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
                DataCell(
                  Text(
                    '${season['Turnovers']}',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

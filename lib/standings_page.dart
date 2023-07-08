import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/team_roster_page.dart';

class StandingsPage extends StatefulWidget {
  @override
  _StandingsPageState createState() => _StandingsPageState();
}

class _StandingsPageState extends State<StandingsPage> {
  List<Map<String, dynamic>> standingsData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final url =
          'https://api.sportsdata.io/v3/nba/scores/json/Standings/2023?key=617306d4132c4bcfae85893b7853c54f';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          standingsData = List<Map<String, dynamic>>.from(data);
        });
      } else {
        print('Failed to fetch standings. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching standings: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1f1545),
        title: Text('Standings'),
      ),
      body: Container(
        color: Colors.orange[200],
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 16,
              headingRowHeight: 40,
              dataRowHeight: 56,
              columns: [
                DataColumn(
                  label: Text('Team'),
                ),
                DataColumn(
                  label: Text('W'),
                ),
                DataColumn(
                  label: Text('L'),
                ),
                DataColumn(
                  label: Text('Pct'),
                ),
                DataColumn(
                  label: Text('GB'),
                ),
                DataColumn(
                  label: Text('PPG For'),
                ),
                DataColumn(
                  label: Text('PPG Against'),
                ),
                DataColumn(
                  label: Text('Streak'),
                ),
                DataColumn(
                  label: Text('Games Back'),
                ),
              ],
              rows: standingsData.map((data) {
                return DataRow(
                  cells: [
                    DataCell(
                      Text(data['Name']),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TeamRosterPage(data['Key']),
                          ),
                        );
                      },
                    ),
                    DataCell(
                      Text(data['Wins'].toString()),
                    ),
                    DataCell(
                      Text(data['Losses'].toString()),
                    ),
                    DataCell(
                      Text(data['Percentage'].toStringAsFixed(3)),
                    ),
                    DataCell(
                      Text(data['GamesBack'].toString()),
                    ),
                    DataCell(
                      Text(data['PointsPerGameFor'].toString()),
                    ),
                    DataCell(
                      Text(data['PointsPerGameAgainst'].toString()),
                    ),
                    DataCell(
                      Text(data['StreakDescription']),
                    ),
                    DataCell(
                      Text(data['GamesBack'].toString()),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

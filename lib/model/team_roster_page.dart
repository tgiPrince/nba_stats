import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nba_stats/model/team_roster.dart';
import 'package:intl/intl.dart';
import '../player_page.dart';

//class TeamRosterPage extends StatelessWidget {
//final String abrev;

class TeamRosterPage extends StatefulWidget {
  final String teamAbbreviation;
  //final int teamID;

  const TeamRosterPage(this.teamAbbreviation, {super.key});
  //const TeamRosterPage(this.teamID, {super.key});

  @override
  _TeamRosterPageState createState() => _TeamRosterPageState();
}

class _TeamRosterPageState extends State<TeamRosterPage> {
  List<TeamRoster> roster = [];

  @override
  void initState() {
    super.initState();
    fetchRoster();
  }

  Future<void> fetchRoster() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.sportsdata.io/v3/nba/scores/json/Players/${widget.teamAbbreviation}?key=617306d4132c4bcfae85893b7853c54f'),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        setState(() {
          roster = jsonData.map<TeamRoster>((data) => TeamRoster.fromJson(data)).toList();
        });
      } else {
        print('Failed to fetch roster. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching roster: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1f1545),
        title: Text(widget.teamAbbreviation),
      ),
      body: Container(
        color: Color(0xFF1f1545),
        child: Column(
          children: [

            /*VerticalDivider(
              color: Colors.grey,
              thickness: 10,

            ),

             */
            Expanded(
              child: ListView.builder(
                itemCount: roster.length,
                itemBuilder: (context, index) {
                  final player = roster[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orange[200],
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: ListTile(
                        title: Text('${player.firstName} ${player.lastName}'),
                        subtitle: Text('Position: ${player.position}'),
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:NetworkImage('${player.photoUrl}'),
                        ) ,
                          trailing: Text('Salary: ${player.salary != null ? '\$${NumberFormat('#,###').format(player.salary)}' : 'N/A'}',
                            style: TextStyle(
                            fontWeight: FontWeight.bold,),


                        // Display more player information as desired...
                      ),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlayerPage(player.playerID),
                              ),
                          );
                        },
                    ),
                  )
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
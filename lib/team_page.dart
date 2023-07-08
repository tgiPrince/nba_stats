import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nba_stats/model/team.dart';
import 'package:nba_stats/model/team_roster.dart';
import 'package:nba_stats/model/team_roster_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TeamPage extends StatelessWidget {
  TeamPage({Key? key});

  List<Team> teams = [];

  Future<String?> getWikipediaLogoUrl(String abbrev) async {
    String url = 'https://api.sportsdata.io/v3/nba/scores/json/teams?key=617306d4132c4bcfae85893b7853c54f';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      String desiredKey = abbrev;
      dynamic desiredElement = data.firstWhere((element) => element['Key'] == desiredKey, orElse: () => null);

      if (desiredElement != null) {
        String? wikipediaLogoUrl = desiredElement['WikipediaLogoUrl'];
        print(abbrev);
        return wikipediaLogoUrl;
      } else {
        print('Element with key $desiredKey not found.');
        return null;
      }
    } else {
      print('Request failed with status: ${response.statusCode}');
      return null;
    }
  }

  String exchangeNames(String abbrev) {
    if (abbrev == 'GSW')
      return 'GS';
    else if (abbrev == 'NOP')
      return 'NO';
    else if (abbrev == 'NYK')
      return 'NY';
    else if (abbrev == 'PHX')
      return 'PHO';
    else if (abbrev == 'SAS')
      return 'SA';
    else
      return abbrev;
  }

  Future getTeams() async {
    var response = await http.get(Uri.http('balldontlie.io', 'api/v1/teams'));
    Map jsonData = jsonDecode(response.body);

    for (var eachTeam in jsonData['data']) {
      final team = Team(
        abbreviation: eachTeam['abbreviation'],
        city: eachTeam['city'],
        conference: eachTeam['conference'],
        division: eachTeam['division'],
        full_name: eachTeam['full_name'],
        name: eachTeam['name'],
      );
      teams.add(team);
    }
    print(teams.length);
    print("it prints here");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1f1545),
        title: Text('NBA Teams'),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFF1f1545),
        child: FutureBuilder(
          future: getTeams(),
          builder: (context, snapshot) {


            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: teams.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orange[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(teams[index].abbreviation),
                        subtitle: Text(teams[index].name),
                        trailing: Icon(Icons.navigate_next),
                        leading: FutureBuilder(
                          future: getWikipediaLogoUrl('${exchangeNames(teams[index].abbreviation)}'),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                              String? logoUrl = snapshot.data as String?;
                              print('TESTING $logoUrl');

                              if (logoUrl?.endsWith('.svg') ?? false) {
                                return CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  child: SvgPicture.network(logoUrl ?? ''),
                                );
                              } else if (logoUrl?.endsWith('.png') ?? false) {
                                return CircleAvatar(
                                  backgroundImage: NetworkImage(logoUrl ?? ''),
                                );
                              } else {
                                return CircleAvatar(
                                  backgroundColor: Colors.grey,
                                );
                              }
                            } else {
                              return CircleAvatar(
                                backgroundColor: Colors.grey,
                              );
                            }
                          },
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeamRosterPage(exchangeNames(teams[index].abbreviation)),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

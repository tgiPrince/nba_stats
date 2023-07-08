class TeamInfo {
  int? teamID;
  String? key;
  bool? active;
  String? city;
  String? name;
  int? leagueID;
  int? stadiumID;
  String? conference;
  String? division;
  String? primaryColor;
  String? secondaryColor;
  String? tertiaryColor;
  String? quaternaryColor;
  String? wikipediaLogoUrl;
  void wikipediaWordMarkUrl;
  int? globalTeamID;
  int? nbaDotComTeamID;
  String? headCoach;

  TeamInfo(
      {this.teamID,
        this.key,
        this.active,
        this.city,
        this.name,
        this.leagueID,
        this.stadiumID,
        this.conference,
        this.division,
        this.primaryColor,
        this.secondaryColor,
        this.tertiaryColor,
        this.quaternaryColor,
        this.wikipediaLogoUrl,
        this.wikipediaWordMarkUrl,
        this.globalTeamID,
        this.nbaDotComTeamID,
        this.headCoach});

  TeamInfo.fromJson(Map<String, dynamic> json) {
    teamID = json['TeamID'];
    key = json['Key'];
    active = json['Active'];
    city = json['City'];
    name = json['Name'];
    leagueID = json['LeagueID'];
    stadiumID = json['StadiumID'];
    conference = json['Conference'];
    division = json['Division'];
    primaryColor = json['PrimaryColor'];
    secondaryColor = json['SecondaryColor'];
    tertiaryColor = json['TertiaryColor'];
    quaternaryColor = json['QuaternaryColor'];
    wikipediaLogoUrl = json['WikipediaLogoUrl'];
    wikipediaWordMarkUrl = json['WikipediaWordMarkUrl'];
    globalTeamID = json['GlobalTeamID'];
    nbaDotComTeamID = json['NbaDotComTeamID'];
    headCoach = json['HeadCoach'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['TeamID'] = teamID;
    data['Key'] = key;
    data['Active'] = active;
    data['City'] = city;
    data['Name'] = name;
    data['LeagueID'] = leagueID;
    data['StadiumID'] = stadiumID;
    data['Conference'] = conference;
    data['Division'] = division;
    data['PrimaryColor'] = primaryColor;
    data['SecondaryColor'] = secondaryColor;
    data['TertiaryColor'] = tertiaryColor;
    data['QuaternaryColor'] = quaternaryColor;
    data['WikipediaLogoUrl'] = wikipediaLogoUrl;
    //data['WikipediaWordMarkUrl'] = wikipediaWordMarkUrl; i commented this out!!!!!!!!
    data['GlobalTeamID'] = globalTeamID;
    data['NbaDotComTeamID'] = nbaDotComTeamID;
    data['HeadCoach'] = headCoach;
    return data;
  }
}

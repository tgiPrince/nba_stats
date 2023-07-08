class TeamRoster {
  int? playerID;
  String? sportsDataID;
  String? status;
  int? teamID;
  String? team;
  int? jersey;
  String? positionCategory;
  String? position;
  String? firstName;
  String? lastName;
  String? birthDate;
  String? birthCity;
  String? birthState;
  String? birthCountry;
  int? globalTeamID;
  int? height;
  int? weight;
  String? photoUrl;
  int? salary;

  TeamRoster(
      {this.playerID,
        this.sportsDataID,
        this.status,
        this.teamID,
        this.team,
        this.jersey,
        this.positionCategory,
        this.position,
        this.firstName,
        this.lastName,
        this.birthDate,
        this.birthCity,
        this.birthState,
        this.birthCountry,
        this.globalTeamID,
        this.height,
        this.weight,
        this.salary,
        this.photoUrl});

  TeamRoster.fromJson(Map<String, dynamic> json) {
    playerID = json['PlayerID'];
    sportsDataID = json['SportsDataID'];
    status = json['Status'];
    teamID = json['TeamID'];
    team = json['Team'];
    jersey = json['Jersey'];
    positionCategory = json['PositionCategory'];
    position = json['Position'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    birthDate = json['BirthDate'];
    birthCity = json['BirthCity'];
    birthState = json['BirthState'];
    birthCountry = json['BirthCountry'];
    globalTeamID = json['GlobalTeamID'];
    height = json['Height'];
    weight = json['Weight'];
    salary = json['Salary'];
    photoUrl = json['PhotoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PlayerID'] = playerID;
    data['SportsDataID'] = sportsDataID;
    data['Status'] = status;
    data['TeamID'] = teamID;
    data['Team'] = team;
    data['Jersey'] = jersey;
    data['PositionCategory'] = positionCategory;
    data['Position'] = position;
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['BirthDate'] = birthDate;
    data['BirthCity'] = birthCity;
    data['BirthState'] = birthState;
    data['BirthCountry'] = birthCountry;
    data['GlobalTeamID'] = globalTeamID;
    data['Height'] = height;
    data['Weight'] = weight;
    data['Salary'] = salary;
    data['PhotoUrl'] = photoUrl;
    return data;
  }
}

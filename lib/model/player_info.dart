class PlayerInfo {
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
  int? height;
  int? weight;
  String? birthDate;
  String? birthCity;
  String? birthState;
  String? birthCountry;
  Null? highSchool;
  String? college;
  int? salary;
  String? photoUrl;
  int? experience;
  String? sportRadarPlayerID;
  int? rotoworldPlayerID;
  int? rotoWirePlayerID;
  int? fantasyAlarmPlayerID;
  int? statsPlayerID;
  int? sportsDirectPlayerID;
  int? xmlTeamPlayerID;
  String? injuryStatus;
  String? injuryBodyPart;
  Null? injuryStartDate;
  String? injuryNotes;
  int? fanDuelPlayerID;
  int? draftKingsPlayerID;
  int? yahooPlayerID;
  String? fanDuelName;
  String? draftKingsName;
  String? yahooName;
  String? depthChartPosition;
  int? depthChartOrder;
  int? globalTeamID;
  String? fantasyDraftName;
  int? fantasyDraftPlayerID;
  int? usaTodayPlayerID;
  String? usaTodayHeadshotUrl;
  String? usaTodayHeadshotNoBackgroundUrl;
  String? usaTodayHeadshotUpdated;
  String? usaTodayHeadshotNoBackgroundUpdated;
  int? nbaDotComPlayerID;

  PlayerInfo(
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
        this.height,
        this.weight,
        this.birthDate,
        this.birthCity,
        this.birthState,
        this.birthCountry,
        this.highSchool,
        this.college,
        this.salary,
        this.photoUrl,
        this.experience,
        this.sportRadarPlayerID,
        this.rotoworldPlayerID,
        this.rotoWirePlayerID,
        this.fantasyAlarmPlayerID,
        this.statsPlayerID,
        this.sportsDirectPlayerID,
        this.xmlTeamPlayerID,
        this.injuryStatus,
        this.injuryBodyPart,
        this.injuryStartDate,
        this.injuryNotes,
        this.fanDuelPlayerID,
        this.draftKingsPlayerID,
        this.yahooPlayerID,
        this.fanDuelName,
        this.draftKingsName,
        this.yahooName,
        this.depthChartPosition,
        this.depthChartOrder,
        this.globalTeamID,
        this.fantasyDraftName,
        this.fantasyDraftPlayerID,
        this.usaTodayPlayerID,
        this.usaTodayHeadshotUrl,
        this.usaTodayHeadshotNoBackgroundUrl,
        this.usaTodayHeadshotUpdated,
        this.usaTodayHeadshotNoBackgroundUpdated,
        this.nbaDotComPlayerID});

  PlayerInfo.fromJson(Map<String, dynamic> json) {
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
    height = json['Height'];
    weight = json['Weight'];
    birthDate = json['BirthDate'];
    birthCity = json['BirthCity'];
    birthState = json['BirthState'];
    birthCountry = json['BirthCountry'];
    highSchool = json['HighSchool'];
    college = json['College'];
    salary = json['Salary'];
    photoUrl = json['PhotoUrl'];
    experience = json['Experience'];
    sportRadarPlayerID = json['SportRadarPlayerID'];
    rotoworldPlayerID = json['RotoworldPlayerID'];
    rotoWirePlayerID = json['RotoWirePlayerID'];
    fantasyAlarmPlayerID = json['FantasyAlarmPlayerID'];
    statsPlayerID = json['StatsPlayerID'];
    sportsDirectPlayerID = json['SportsDirectPlayerID'];
    xmlTeamPlayerID = json['XmlTeamPlayerID'];
    injuryStatus = json['InjuryStatus'];
    injuryBodyPart = json['InjuryBodyPart'];
    injuryStartDate = json['InjuryStartDate'];
    injuryNotes = json['InjuryNotes'];
    fanDuelPlayerID = json['FanDuelPlayerID'];
    draftKingsPlayerID = json['DraftKingsPlayerID'];
    yahooPlayerID = json['YahooPlayerID'];
    fanDuelName = json['FanDuelName'];
    draftKingsName = json['DraftKingsName'];
    yahooName = json['YahooName'];
    depthChartPosition = json['DepthChartPosition'];
    depthChartOrder = json['DepthChartOrder'];
    globalTeamID = json['GlobalTeamID'];
    fantasyDraftName = json['FantasyDraftName'];
    fantasyDraftPlayerID = json['FantasyDraftPlayerID'];
    usaTodayPlayerID = json['UsaTodayPlayerID'];
    usaTodayHeadshotUrl = json['UsaTodayHeadshotUrl'];
    usaTodayHeadshotNoBackgroundUrl = json['UsaTodayHeadshotNoBackgroundUrl'];
    usaTodayHeadshotUpdated = json['UsaTodayHeadshotUpdated'];
    usaTodayHeadshotNoBackgroundUpdated =
    json['UsaTodayHeadshotNoBackgroundUpdated'];
    nbaDotComPlayerID = json['NbaDotComPlayerID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PlayerID'] = this.playerID;
    data['SportsDataID'] = this.sportsDataID;
    data['Status'] = this.status;
    data['TeamID'] = this.teamID;
    data['Team'] = this.team;
    data['Jersey'] = this.jersey;
    data['PositionCategory'] = this.positionCategory;
    data['Position'] = this.position;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['Height'] = this.height;
    data['Weight'] = this.weight;
    data['BirthDate'] = this.birthDate;
    data['BirthCity'] = this.birthCity;
    data['BirthState'] = this.birthState;
    data['BirthCountry'] = this.birthCountry;
    data['HighSchool'] = this.highSchool;
    data['College'] = this.college;
    data['Salary'] = this.salary;
    data['PhotoUrl'] = this.photoUrl;
    data['Experience'] = this.experience;
    data['SportRadarPlayerID'] = this.sportRadarPlayerID;
    data['RotoworldPlayerID'] = this.rotoworldPlayerID;
    data['RotoWirePlayerID'] = this.rotoWirePlayerID;
    data['FantasyAlarmPlayerID'] = this.fantasyAlarmPlayerID;
    data['StatsPlayerID'] = this.statsPlayerID;
    data['SportsDirectPlayerID'] = this.sportsDirectPlayerID;
    data['XmlTeamPlayerID'] = this.xmlTeamPlayerID;
    data['InjuryStatus'] = this.injuryStatus;
    data['InjuryBodyPart'] = this.injuryBodyPart;
    data['InjuryStartDate'] = this.injuryStartDate;
    data['InjuryNotes'] = this.injuryNotes;
    data['FanDuelPlayerID'] = this.fanDuelPlayerID;
    data['DraftKingsPlayerID'] = this.draftKingsPlayerID;
    data['YahooPlayerID'] = this.yahooPlayerID;
    data['FanDuelName'] = this.fanDuelName;
    data['DraftKingsName'] = this.draftKingsName;
    data['YahooName'] = this.yahooName;
    data['DepthChartPosition'] = this.depthChartPosition;
    data['DepthChartOrder'] = this.depthChartOrder;
    data['GlobalTeamID'] = this.globalTeamID;
    data['FantasyDraftName'] = this.fantasyDraftName;
    data['FantasyDraftPlayerID'] = this.fantasyDraftPlayerID;
    data['UsaTodayPlayerID'] = this.usaTodayPlayerID;
    data['UsaTodayHeadshotUrl'] = this.usaTodayHeadshotUrl;
    data['UsaTodayHeadshotNoBackgroundUrl'] =
        this.usaTodayHeadshotNoBackgroundUrl;
    data['UsaTodayHeadshotUpdated'] = this.usaTodayHeadshotUpdated;
    data['UsaTodayHeadshotNoBackgroundUpdated'] =
        this.usaTodayHeadshotNoBackgroundUpdated;
    data['NbaDotComPlayerID'] = this.nbaDotComPlayerID;
    return data;
  }
}

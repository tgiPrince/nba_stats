class Player {
  int? statID;
  int? teamID;
  int? playerID;
  int? seasonType;
  int? season;
  String? name;
  String? team;
  String? position;
  int? started;
  int? globalTeamID;
  String? updated;
  int? games;
  int? fantasyPoints;
  int? minutes;
  double? mpg;
  int? seconds;
  int? fieldGoalsMade;
  double? fieldGoalsAttempted;
  double? fieldGoalsPercentage;
  double? effectiveFieldGoalsPercentage;
  double? twoPointersMade;
  double? twoPointersAttempted;
  int? twoPointersPercentage;
  double? threePointersMade;
  double? threePointersAttempted;
  double? threePointersPercentage;
  double? freeThrowsMade;
  double? freeThrowsAttempted;
  double? freeThrowsPercentage;
  int? offensiveRebounds;
  double? defensiveRebounds;
  double? rebounds;
  int? offensiveReboundsPercentage;
  double? defensiveReboundsPercentage;
  double? totalReboundsPercentage;
  double? assists;
  double? steals;
  double? blockedShots;
  double? turnovers;
  int? personalFouls;
  double? points;
  double? trueShootingAttempts;
  double? trueShootingPercentage;
  double? playerEfficiencyRating;
  double? assistsPercentage;
  double? stealsPercentage;
  double? blocksPercentage;
  double? turnOversPercentage;
  double? usageRatePercentage;
  double? fantasyPointsFanDuel;
  double? fantasyPointsDraftKings;
  double? fantasyPointsYahoo;
  double? plusMinus;
  double? doubleDoubles;
  int? tripleDoubles;
  double? fantasyPointsFantasyDraft;
  bool? isClosed;
  bool? lineupConfirmed;
  String? lineupStatus;

  Player({
    this.statID,
    this.teamID,
    this.playerID,
    this.seasonType,
    this.season,
    this.name,
    this.team,
    this.position,
    this.started,
    this.globalTeamID,
    this.updated,
    this.games,
    this.fantasyPoints,
    this.minutes,
    this.seconds,
    this.fieldGoalsMade,
    this.fieldGoalsAttempted,
    this.fieldGoalsPercentage,
    this.effectiveFieldGoalsPercentage,
    this.twoPointersMade,
    this.twoPointersAttempted,
    this.twoPointersPercentage,
    this.threePointersMade,
    this.threePointersAttempted,
    this.threePointersPercentage,
    this.freeThrowsMade,
    this.freeThrowsAttempted,
    this.freeThrowsPercentage,
    this.offensiveRebounds,
    this.defensiveRebounds,
    this.rebounds,
    this.offensiveReboundsPercentage,
    this.defensiveReboundsPercentage,
    this.totalReboundsPercentage,
    this.assists,
    this.steals,
    this.blockedShots,
    this.turnovers,
    this.personalFouls,
    this.points,
    this.trueShootingAttempts,
    this.trueShootingPercentage,
    this.playerEfficiencyRating,
    this.assistsPercentage,
    this.stealsPercentage,
    this.blocksPercentage,
    this.turnOversPercentage,
    this.usageRatePercentage,
    this.fantasyPointsFanDuel,
    this.fantasyPointsDraftKings,
    this.fantasyPointsYahoo,
    this.plusMinus,
    this.doubleDoubles,
    this.tripleDoubles,
    this.fantasyPointsFantasyDraft,
    this.isClosed,
    this.lineupConfirmed,
    this.lineupStatus,
  }) {
    /*if (minutes != null && games != null && games != 0) {         i commented this out!!!!
      mpg = (minutes!.toDouble() / games.toDouble())!;
    } else {
      mpg = null;
    }*/
  }

  Player.fromJson(Map<String, dynamic> json) {
    statID = json['StatID'];
    teamID = json['TeamID'];
    playerID = json['PlayerID'];
    seasonType = json['SeasonType'];
    season = json['Season'];
    name = json['Name'];
    team = json['Team'];
    position = json['Position'];
    started = json['Started'];
    globalTeamID = json['GlobalTeamID'];
    updated = json['Updated'];
    games = json['Games'];
    fantasyPoints = json['FantasyPoints'];
    minutes = json['Minutes'];
    mpg = (minutes!.toDouble()/games!.toDouble())!;
    seconds = json['Seconds'];
    fieldGoalsMade = json['FieldGoalsMade'];
    fieldGoalsAttempted = json['FieldGoalsAttempted'];
    fieldGoalsPercentage = json['FieldGoalsPercentage'];
    effectiveFieldGoalsPercentage = json['EffectiveFieldGoalsPercentage'];
    twoPointersMade = json['TwoPointersMade'];
    twoPointersAttempted = json['TwoPointersAttempted'];
    twoPointersPercentage = json['TwoPointersPercentage'];
    threePointersMade = json['ThreePointersMade'];
    threePointersAttempted = json['ThreePointersAttempted'];
    threePointersPercentage = json['ThreePointersPercentage'];
    freeThrowsMade = json['FreeThrowsMade'];
    freeThrowsAttempted = json['FreeThrowsAttempted'];
    freeThrowsPercentage = json['FreeThrowsPercentage'];
    offensiveRebounds = json['OffensiveRebounds'];
    defensiveRebounds = json['DefensiveRebounds'];
    rebounds = json['Rebounds'];
    offensiveReboundsPercentage = json['OffensiveReboundsPercentage'];
    defensiveReboundsPercentage = json['DefensiveReboundsPercentage'];
    totalReboundsPercentage = json['TotalReboundsPercentage'];
    assists = json['Assists'];
    steals = json['Steals'];
    blockedShots = json['BlockedShots'];
    turnovers = json['Turnovers'];
    personalFouls = json['PersonalFouls'];
    points = json['Points'];
    trueShootingAttempts = json['TrueShootingAttempts'];
    trueShootingPercentage = json['TrueShootingPercentage'];
    playerEfficiencyRating = json['PlayerEfficiencyRating'];
    assistsPercentage = json['AssistsPercentage'];
    stealsPercentage = json['StealsPercentage'];
    blocksPercentage = json['BlocksPercentage'];
    turnOversPercentage = json['TurnOversPercentage'];
    usageRatePercentage = json['UsageRatePercentage'];
    fantasyPointsFanDuel = json['FantasyPointsFanDuel'];
    fantasyPointsDraftKings = json['FantasyPointsDraftKings'];
    fantasyPointsYahoo = json['FantasyPointsYahoo'];
    plusMinus = json['PlusMinus'];
    doubleDoubles = json['DoubleDoubles'];
    tripleDoubles = json['TripleDoubles'];
    fantasyPointsFantasyDraft = json['FantasyPointsFantasyDraft'];
    isClosed = json['IsClosed'];
    lineupConfirmed = json['LineupConfirmed'];
    lineupStatus = json['LineupStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['StatID'] = statID;
    data['TeamID'] = teamID;
    data['PlayerID'] = playerID;
    data['SeasonType'] = seasonType;
    data['Season'] = season;
    data['Name'] = name;
    data['Team'] = team;
    data['Position'] = position;
    data['Started'] = started;
    data['GlobalTeamID'] = globalTeamID;
    data['Updated'] = updated;
    data['Games'] = games;
    data['FantasyPoints'] = fantasyPoints;
    data['Minutes'] = minutes;
    data['Seconds'] = seconds;
    data['FieldGoalsMade'] = fieldGoalsMade;
    data['FieldGoalsAttempted'] = fieldGoalsAttempted;
    data['FieldGoalsPercentage'] = fieldGoalsPercentage;
    data['EffectiveFieldGoalsPercentage'] = effectiveFieldGoalsPercentage;
    data['TwoPointersMade'] = twoPointersMade;
    data['TwoPointersAttempted'] = twoPointersAttempted;
    data['TwoPointersPercentage'] = twoPointersPercentage;
    data['ThreePointersMade'] = threePointersMade;
    data['ThreePointersAttempted'] = threePointersAttempted;
    data['ThreePointersPercentage'] = threePointersPercentage;
    data['FreeThrowsMade'] = freeThrowsMade;
    data['FreeThrowsAttempted'] = freeThrowsAttempted;
    data['FreeThrowsPercentage'] = freeThrowsPercentage;
    data['OffensiveRebounds'] = offensiveRebounds;
    data['DefensiveRebounds'] = defensiveRebounds;
    data['Rebounds'] = rebounds;
    data['OffensiveReboundsPercentage'] = offensiveReboundsPercentage;
    data['DefensiveReboundsPercentage'] = defensiveReboundsPercentage;
    data['TotalReboundsPercentage'] = totalReboundsPercentage;
    data['Assists'] = assists;
    data['Steals'] = steals;
    data['BlockedShots'] = blockedShots;
    data['Turnovers'] = turnovers;
    data['PersonalFouls'] = personalFouls;
    data['Points'] = points;
    data['TrueShootingAttempts'] = trueShootingAttempts;
    data['TrueShootingPercentage'] = trueShootingPercentage;
    data['PlayerEfficiencyRating'] = playerEfficiencyRating;
    data['AssistsPercentage'] = assistsPercentage;
    data['StealsPercentage'] = stealsPercentage;
    data['BlocksPercentage'] = blocksPercentage;
    data['TurnOversPercentage'] = turnOversPercentage;
    data['UsageRatePercentage'] = usageRatePercentage;
    data['FantasyPointsFanDuel'] = fantasyPointsFanDuel;
    data['FantasyPointsDraftKings'] = fantasyPointsDraftKings;
    data['FantasyPointsYahoo'] = fantasyPointsYahoo;
    data['PlusMinus'] = plusMinus;
    data['DoubleDoubles'] = doubleDoubles;
    data['TripleDoubles'] = tripleDoubles;
    data['FantasyPointsFantasyDraft'] = fantasyPointsFantasyDraft;
    data['IsClosed'] = isClosed;
    data['LineupConfirmed'] = lineupConfirmed;
    data['LineupStatus'] = lineupStatus;
    return data;
  }
}
class PlayerSearch {
  final String draftKingsName;
  final int playerID;
  final String photoUrl;

  PlayerSearch({required this.draftKingsName, required this.playerID, required this.photoUrl});

  factory PlayerSearch.fromJson(Map<String, dynamic> json) {
    return PlayerSearch(
      draftKingsName: json['DraftKingsName'] ?? '',
      playerID: json['PlayerID'] ?? 0,
      photoUrl: json['PhotoUrl'] ?? '',
    );
  }
}

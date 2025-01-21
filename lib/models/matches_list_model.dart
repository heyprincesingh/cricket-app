import 'dart:convert';

class MatchDetails {
  MatchInfo? matchInfo;
  MatchScore? matchScore;

  MatchDetails({
    this.matchInfo,
    this.matchScore,
  });

  factory MatchDetails.fromJson(String str) => MatchDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MatchDetails.fromMap(Map<String, dynamic> json) => MatchDetails(
    matchInfo: json["matchInfo"] == null ? null : MatchInfo.fromMap(json["matchInfo"]),
    matchScore: json["matchScore"] == null ? null : MatchScore.fromMap(json["matchScore"]),
  );

  Map<String, dynamic> toMap() => {
    "matchInfo": matchInfo?.toMap(),
    "matchScore": matchScore?.toMap(),
  };
}

class MatchInfo {
  int? matchId;
  int? seriesId;
  String? seriesName;
  String? matchDesc;
  String? matchFormat;
  String? startDate;
  String? endDate;
  String? state;
  String? status;
  Team? team1;
  Team? team2;
  VenueInfo? venueInfo;
  int? currBatTeamId;
  String? seriesStartDt;
  String? seriesEndDt;
  bool? isTimeAnnounced;
  String? stateTitle;
  bool? isFantasyEnabled;

  MatchInfo({
    this.matchId,
    this.seriesId,
    this.seriesName,
    this.matchDesc,
    this.matchFormat,
    this.startDate,
    this.endDate,
    this.state,
    this.status,
    this.team1,
    this.team2,
    this.venueInfo,
    this.currBatTeamId,
    this.seriesStartDt,
    this.seriesEndDt,
    this.isTimeAnnounced,
    this.stateTitle,
    this.isFantasyEnabled,
  });

  factory MatchInfo.fromJson(String str) => MatchInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MatchInfo.fromMap(Map<String, dynamic> json) => MatchInfo(
    matchId: json["matchId"],
    seriesId: json["seriesId"],
    seriesName: json["seriesName"],
    matchDesc: json["matchDesc"],
    matchFormat: json["matchFormat"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    state: json["state"],
    status: json["status"],
    team1: json["team1"] == null ? null : Team.fromMap(json["team1"]),
    team2: json["team2"] == null ? null : Team.fromMap(json["team2"]),
    venueInfo: json["venueInfo"] == null ? null : VenueInfo.fromMap(json["venueInfo"]),
    currBatTeamId: json["currBatTeamId"],
    seriesStartDt: json["seriesStartDt"],
    seriesEndDt: json["seriesEndDt"],
    isTimeAnnounced: json["isTimeAnnounced"],
    stateTitle: json["stateTitle"],
    isFantasyEnabled: json["isFantasyEnabled"],
  );

  Map<String, dynamic> toMap() => {
    "matchId": matchId,
    "seriesId": seriesId,
    "seriesName": seriesName,
    "matchDesc": matchDesc,
    "matchFormat": matchFormat,
    "startDate": startDate,
    "endDate": endDate,
    "state": state,
    "status": status,
    "team1": team1?.toMap(),
    "team2": team2?.toMap(),
    "venueInfo": venueInfo?.toMap(),
    "currBatTeamId": currBatTeamId,
    "seriesStartDt": seriesStartDt,
    "seriesEndDt": seriesEndDt,
    "isTimeAnnounced": isTimeAnnounced,
    "stateTitle": stateTitle,
    "isFantasyEnabled": isFantasyEnabled,
  };
}

class Team {
  int? teamId;
  String? teamName;
  String? teamSName;
  int? imageId;

  Team({
    this.teamId,
    this.teamName,
    this.teamSName,
    this.imageId,
  });

  factory Team.fromJson(String str) => Team.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Team.fromMap(Map<String, dynamic> json) => Team(
    teamId: json["teamId"],
    teamName: json["teamName"],
    teamSName: json["teamSName"],
    imageId: json["imageId"],
  );

  Map<String, dynamic> toMap() => {
    "teamId": teamId,
    "teamName": teamName,
    "teamSName": teamSName,
    "imageId": imageId,
  };
}

class VenueInfo {
  int? id;
  String? ground;
  String? city;
  String? timezone;
  String? latitude;
  String? longitude;

  VenueInfo({
    this.id,
    this.ground,
    this.city,
    this.timezone,
    this.latitude,
    this.longitude,
  });

  factory VenueInfo.fromJson(String str) => VenueInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VenueInfo.fromMap(Map<String, dynamic> json) => VenueInfo(
    id: json["id"],
    ground: json["ground"],
    city: json["city"],
    timezone: json["timezone"],
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "ground": ground,
    "city": city,
    "timezone": timezone,
    "latitude": latitude,
    "longitude": longitude,
  };
}

class MatchScore {
  TeamScore? team1Score;
  TeamScore? team2Score;

  MatchScore({
    this.team1Score,
    this.team2Score,
  });

  factory MatchScore.fromJson(String str) => MatchScore.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MatchScore.fromMap(Map<String, dynamic> json) => MatchScore(
    team1Score: json["team1Score"] == null ? null : TeamScore.fromMap(json["team1Score"]),
    team2Score: json["team2Score"] == null ? null : TeamScore.fromMap(json["team2Score"]),
  );

  Map<String, dynamic> toMap() => {
    "team1Score": team1Score?.toMap(),
    "team2Score": team2Score?.toMap(),
  };
}

class TeamScore {
  Inngs1? inngs1;

  TeamScore({
    this.inngs1,
  });

  factory TeamScore.fromJson(String str) => TeamScore.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TeamScore.fromMap(Map<String, dynamic> json) => TeamScore(
    inngs1: json["inngs1"] == null ? null : Inngs1.fromMap(json["inngs1"]),
  );

  Map<String, dynamic> toMap() => {
    "inngs1": inngs1?.toMap(),
  };
}

class Inngs1 {
  int? inningsId;
  int? runs;
  int? wickets;
  double? overs;

  Inngs1({
    this.inningsId,
    this.runs,
    this.wickets,
    this.overs,
  });

  factory Inngs1.fromJson(String str) => Inngs1.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Inngs1.fromMap(Map<String, dynamic> json) => Inngs1(
    inningsId: json["inningsId"],
    runs: json["runs"],
    wickets: json["wickets"],
    overs: json["overs"]?.toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "inningsId": inningsId,
    "runs": runs,
    "wickets": wickets,
    "overs": overs,
  };
}

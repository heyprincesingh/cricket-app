class MatchDetails {
  MatchInfo? matchInfo;
  MatchScore? matchScore;

  MatchDetails({this.matchInfo, this.matchScore});

  MatchDetails.fromJson(Map<String, dynamic> json) {
    matchInfo = json['matchInfo'] != null ? MatchInfo.fromJson(json['matchInfo'] as Map<String, dynamic>) : null;
    matchScore = json['matchScore'] != null ? MatchScore.fromJson(json['matchScore'] as Map<String, dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.matchInfo != null) {
      data['matchInfo'] = this.matchInfo!.toJson();
    }
    if (this.matchScore != null) {
      data['matchScore'] = this.matchScore!.toJson();
    }
    return data;
  }
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
  Team1? team1;
  Team1? team2;
  VenueInfo? venueInfo;
  int? currBatTeamId;
  String? seriesStartDt;
  String? seriesEndDt;
  bool? isTimeAnnounced;
  String? stateTitle;
  bool? isFantasyEnabled;

  MatchInfo(
      {this.matchId,
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
        this.isFantasyEnabled});

  MatchInfo.fromJson(Map<String, dynamic> json) {
    matchId = json['matchId'] as int?;
    seriesId = json['seriesId'] as int?;
    seriesName = json['seriesName'] as String?;
    matchDesc = json['matchDesc'] as String?;
    matchFormat = json['matchFormat'] as String?;
    startDate = json['startDate'] as String?;
    endDate = json['endDate'] as String?;
    state = json['state'] as String?;
    status = json['status'] as String?;
    team1 = json['team1'] != null ? Team1.fromJson(json['team1'] as Map<String, dynamic>) : null;
    team2 = json['team2'] != null ? Team1.fromJson(json['team2'] as Map<String, dynamic>) : null;
    venueInfo = json['venueInfo'] != null ? VenueInfo.fromJson(json['venueInfo'] as Map<String, dynamic>) : null;
    currBatTeamId = json['currBatTeamId'] as int?;
    seriesStartDt = json['seriesStartDt'] as String?;
    seriesEndDt = json['seriesEndDt'] as String?;
    isTimeAnnounced = json['isTimeAnnounced'] as bool?;
    stateTitle = json['stateTitle'] as String?;
    isFantasyEnabled = json['isFantasyEnabled'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['matchId'] = this.matchId;
    data['seriesId'] = this.seriesId;
    data['seriesName'] = this.seriesName;
    data['matchDesc'] = this.matchDesc;
    data['matchFormat'] = this.matchFormat;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['state'] = this.state;
    data['status'] = this.status;
    if (this.team1 != null) {
      data['team1'] = this.team1!.toJson();
    }
    if (this.team2 != null) {
      data['team2'] = this.team2!.toJson();
    }
    if (this.venueInfo != null) {
      data['venueInfo'] = this.venueInfo!.toJson();
    }
    data['currBatTeamId'] = this.currBatTeamId;
    data['seriesStartDt'] = this.seriesStartDt;
    data['seriesEndDt'] = this.seriesEndDt;
    data['isTimeAnnounced'] = this.isTimeAnnounced;
    data['stateTitle'] = this.stateTitle;
    data['isFantasyEnabled'] = this.isFantasyEnabled;
    return data;
  }
}

class Team1 {
  int? teamId;
  String? teamName;
  String? teamSName;
  int? imageId;

  Team1({this.teamId, this.teamName, this.teamSName, this.imageId});

  Team1.fromJson(Map<String, dynamic> json) {
    teamId = json['teamId'] as int?;
    teamName = json['teamName'] as String?;
    teamSName = json['teamSName'] as String?;
    imageId = json['imageId'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['teamId'] = this.teamId;
    data['teamName'] = this.teamName;
    data['teamSName'] = this.teamSName;
    data['imageId'] = this.imageId;
    return data;
  }
}

class VenueInfo {
  int? id;
  String? ground;
  String? city;
  String? timezone;
  String? latitude;
  String? longitude;

  VenueInfo({this.id, this.ground, this.city, this.timezone, this.latitude, this.longitude});

  VenueInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    ground = json['ground'] as String?;
    city = json['city'] as String?;
    timezone = json['timezone'] as String?;
    latitude = json['latitude'] as String?;
    longitude = json['longitude'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['ground'] = this.ground;
    data['city'] = this.city;
    data['timezone'] = this.timezone;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class MatchScore {
  Team1Score? team1Score;
  Team1Score? team2Score;

  MatchScore({this.team1Score, this.team2Score});

  MatchScore.fromJson(Map<String, dynamic> json) {
    // Explicitly cast the dynamic type to Map<String, dynamic>
    if (json['team1Score'] != null) {
      team1Score = Team1Score.fromJson(Map<String, dynamic>.from(json['team1Score']));
    }
    if (json['team2Score'] != null) {
      team2Score = Team1Score.fromJson(Map<String, dynamic>.from(json['team2Score']));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.team1Score != null) {
      data['team1Score'] = this.team1Score!.toJson();
    }
    if (this.team2Score != null) {
      data['team2Score'] = this.team2Score!.toJson();
    }
    return data;
  }
}

class Team1Score {
  Inngs1? inngs1;

  Team1Score({this.inngs1});

  Team1Score.fromJson(Map<String, dynamic> json) {
    // Explicitly cast the dynamic type to Map<String, dynamic>
    if (json['inngs1'] != null) {
      inngs1 = Inngs1.fromJson(Map<String, dynamic>.from(json['inngs1']));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.inngs1 != null) {
      data['inngs1'] = this.inngs1!.toJson();
    }
    return data;
  }
}

class Inngs1 {
  int? inningsId;
  int? runs;
  int? wickets;
  double? overs;

  Inngs1({this.inningsId, this.runs, this.wickets, this.overs});

  Inngs1.fromJson(Map<String, dynamic> json) {
    inningsId = json['inningsId'] as int?;
    runs = json['runs'] as int?;
    wickets = json['wickets'] as int?;
    overs = json['overs'] as double?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['inningsId'] = this.inningsId;
    data['runs'] = this.runs;
    data['wickets'] = this.wickets;
    data['overs'] = this.overs;
    return data;
  }
}

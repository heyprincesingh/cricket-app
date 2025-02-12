import 'dart:convert';

class MatchDetailsModel {
  final List<ScoreCard>? scoreCard;
  final MatchHeader? matchHeader;
  final bool? isMatchComplete;
  final String? status;
  final int? responseLastUpdated;

  MatchDetailsModel({
    this.scoreCard,
    this.matchHeader,
    this.isMatchComplete,
    this.status,
    this.responseLastUpdated,
  });

  factory MatchDetailsModel.fromJson(String str) => MatchDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MatchDetailsModel.fromMap(Map<String, dynamic> json) => MatchDetailsModel(
    scoreCard: json["scoreCard"] == null ? [] : List<ScoreCard>.from(json["scoreCard"]!.map((x) => ScoreCard.fromMap(x))),
    matchHeader: json["matchHeader"] == null ? null : MatchHeader.fromMap(json["matchHeader"]),
    isMatchComplete: json["isMatchComplete"],
    status: json["status"],
    responseLastUpdated: json["responseLastUpdated"],
  );

  Map<String, dynamic> toMap() => {
    "scoreCard": scoreCard == null ? [] : List<dynamic>.from(scoreCard!.map((x) => x.toMap())),
    "matchHeader": matchHeader?.toMap(),
    "isMatchComplete": isMatchComplete,
    "status": status,
    "responseLastUpdated": responseLastUpdated,
  };
}

class MatchHeader {
  final int? matchId;
  final String? matchDescription;
  final String? matchFormat;
  final String? matchType;
  final bool? complete;
  final bool? domestic;
  final int? matchStartTimestamp;
  final int? matchCompleteTimestamp;
  final bool? dayNight;
  final int? year;
  final String? state;
  final String? status;
  final TossResults? tossResults;
  final Result? result;
  final RevisedTarget? revisedTarget;
  final List<PlayersOfTheMatch>? playersOfTheMatch;
  final List<dynamic>? playersOfTheSeries;
  final List<MatchTeamInfo>? matchTeamInfo;
  final bool? isMatchNotCovered;
  final Team? team1;
  final Team? team2;
  final String? seriesDesc;
  final int? seriesId;
  final String? seriesName;
  final String? alertType;
  final bool? livestreamEnabled;

  MatchHeader({
    this.matchId,
    this.matchDescription,
    this.matchFormat,
    this.matchType,
    this.complete,
    this.domestic,
    this.matchStartTimestamp,
    this.matchCompleteTimestamp,
    this.dayNight,
    this.year,
    this.state,
    this.status,
    this.tossResults,
    this.result,
    this.revisedTarget,
    this.playersOfTheMatch,
    this.playersOfTheSeries,
    this.matchTeamInfo,
    this.isMatchNotCovered,
    this.team1,
    this.team2,
    this.seriesDesc,
    this.seriesId,
    this.seriesName,
    this.alertType,
    this.livestreamEnabled,
  });

  factory MatchHeader.fromJson(String str) => MatchHeader.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MatchHeader.fromMap(Map<String, dynamic> json) => MatchHeader(
    matchId: json["matchId"],
    matchDescription: json["matchDescription"],
    matchFormat: json["matchFormat"],
    matchType: json["matchType"],
    complete: json["complete"],
    domestic: json["domestic"],
    matchStartTimestamp: json["matchStartTimestamp"],
    matchCompleteTimestamp: json["matchCompleteTimestamp"],
    dayNight: json["dayNight"],
    year: json["year"],
    state: json["state"],
    status: json["status"],
    tossResults: json["tossResults"] == null ? null : TossResults.fromMap(json["tossResults"]),
    result: json["result"] == null ? null : Result.fromMap(json["result"]),
    revisedTarget: json["revisedTarget"] == null ? null : RevisedTarget.fromMap(json["revisedTarget"]),
    playersOfTheMatch: json["playersOfTheMatch"] == null ? [] : List<PlayersOfTheMatch>.from(json["playersOfTheMatch"]!.map((x) => PlayersOfTheMatch.fromMap(x))),
    playersOfTheSeries: json["playersOfTheSeries"] == null ? [] : List<dynamic>.from(json["playersOfTheSeries"]!.map((x) => x)),
    matchTeamInfo: json["matchTeamInfo"] == null ? [] : List<MatchTeamInfo>.from(json["matchTeamInfo"]!.map((x) => MatchTeamInfo.fromMap(x))),
    isMatchNotCovered: json["isMatchNotCovered"],
    team1: json["team1"] == null ? null : Team.fromMap(json["team1"]),
    team2: json["team2"] == null ? null : Team.fromMap(json["team2"]),
    seriesDesc: json["seriesDesc"],
    seriesId: json["seriesId"],
    seriesName: json["seriesName"],
    alertType: json["alertType"],
    livestreamEnabled: json["livestreamEnabled"],
  );

  Map<String, dynamic> toMap() => {
    "matchId": matchId,
    "matchDescription": matchDescription,
    "matchFormat": matchFormat,
    "matchType": matchType,
    "complete": complete,
    "domestic": domestic,
    "matchStartTimestamp": matchStartTimestamp,
    "matchCompleteTimestamp": matchCompleteTimestamp,
    "dayNight": dayNight,
    "year": year,
    "state": state,
    "status": status,
    "tossResults": tossResults?.toMap(),
    "result": result?.toMap(),
    "revisedTarget": revisedTarget?.toMap(),
    "playersOfTheMatch": playersOfTheMatch == null ? [] : List<dynamic>.from(playersOfTheMatch!.map((x) => x.toMap())),
    "playersOfTheSeries": playersOfTheSeries == null ? [] : List<dynamic>.from(playersOfTheSeries!.map((x) => x)),
    "matchTeamInfo": matchTeamInfo == null ? [] : List<dynamic>.from(matchTeamInfo!.map((x) => x.toMap())),
    "isMatchNotCovered": isMatchNotCovered,
    "team1": team1?.toMap(),
    "team2": team2?.toMap(),
    "seriesDesc": seriesDesc,
    "seriesId": seriesId,
    "seriesName": seriesName,
    "alertType": alertType,
    "livestreamEnabled": livestreamEnabled,
  };
}

class MatchTeamInfo {
  final int? battingTeamId;
  final String? battingTeamShortName;
  final int? bowlingTeamId;
  final String? bowlingTeamShortName;

  MatchTeamInfo({
    this.battingTeamId,
    this.battingTeamShortName,
    this.bowlingTeamId,
    this.bowlingTeamShortName,
  });

  factory MatchTeamInfo.fromJson(String str) => MatchTeamInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MatchTeamInfo.fromMap(Map<String, dynamic> json) => MatchTeamInfo(
    battingTeamId: json["battingTeamId"],
    battingTeamShortName: json["battingTeamShortName"],
    bowlingTeamId: json["bowlingTeamId"],
    bowlingTeamShortName: json["bowlingTeamShortName"],
  );

  Map<String, dynamic> toMap() => {
    "battingTeamId": battingTeamId,
    "battingTeamShortName": battingTeamShortName,
    "bowlingTeamId": bowlingTeamId,
    "bowlingTeamShortName": bowlingTeamShortName,
  };
}

class PlayersOfTheMatch {
  final int? id;
  final String? name;
  final String? fullName;
  final String? nickName;
  final bool? captain;
  final bool? keeper;
  final bool? substitute;
  final String? teamName;
  final int? faceImageId;

  PlayersOfTheMatch({
    this.id,
    this.name,
    this.fullName,
    this.nickName,
    this.captain,
    this.keeper,
    this.substitute,
    this.teamName,
    this.faceImageId,
  });

  factory PlayersOfTheMatch.fromJson(String str) => PlayersOfTheMatch.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlayersOfTheMatch.fromMap(Map<String, dynamic> json) => PlayersOfTheMatch(
    id: json["id"],
    name: json["name"],
    fullName: json["fullName"],
    nickName: json["nickName"],
    captain: json["captain"],
    keeper: json["keeper"],
    substitute: json["substitute"],
    teamName: json["teamName"],
    faceImageId: json["faceImageId"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "fullName": fullName,
    "nickName": nickName,
    "captain": captain,
    "keeper": keeper,
    "substitute": substitute,
    "teamName": teamName,
    "faceImageId": faceImageId,
  };
}

class Result {
  final String? resultType;
  final String? winningTeam;
  final int? winningteamId;
  final int? winningMargin;
  final bool? winByRuns;
  final bool? winByInnings;

  Result({
    this.resultType,
    this.winningTeam,
    this.winningteamId,
    this.winningMargin,
    this.winByRuns,
    this.winByInnings,
  });

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    resultType: json["resultType"],
    winningTeam: json["winningTeam"],
    winningteamId: json["winningteamId"],
    winningMargin: json["winningMargin"],
    winByRuns: json["winByRuns"],
    winByInnings: json["winByInnings"],
  );

  Map<String, dynamic> toMap() => {
    "resultType": resultType,
    "winningTeam": winningTeam,
    "winningteamId": winningteamId,
    "winningMargin": winningMargin,
    "winByRuns": winByRuns,
    "winByInnings": winByInnings,
  };
}

class RevisedTarget {
  final String? reason;

  RevisedTarget({
    this.reason,
  });

  factory RevisedTarget.fromJson(String str) => RevisedTarget.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RevisedTarget.fromMap(Map<String, dynamic> json) => RevisedTarget(
    reason: json["reason"],
  );

  Map<String, dynamic> toMap() => {
    "reason": reason,
  };
}

class Team {
  final int? id;
  final String? name;
  final List<dynamic>? playerDetails;
  final String? shortName;

  Team({
    this.id,
    this.name,
    this.playerDetails,
    this.shortName,
  });

  factory Team.fromJson(String str) => Team.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Team.fromMap(Map<String, dynamic> json) => Team(
    id: json["id"],
    name: json["name"],
    playerDetails: json["playerDetails"] == null ? [] : List<dynamic>.from(json["playerDetails"]!.map((x) => x)),
    shortName: json["shortName"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "playerDetails": playerDetails == null ? [] : List<dynamic>.from(playerDetails!.map((x) => x)),
    "shortName": shortName,
  };
}

class TossResults {
  final int? tossWinnerId;
  final String? tossWinnerName;
  final String? decision;

  TossResults({
    this.tossWinnerId,
    this.tossWinnerName,
    this.decision,
  });

  factory TossResults.fromJson(String str) => TossResults.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TossResults.fromMap(Map<String, dynamic> json) => TossResults(
    tossWinnerId: json["tossWinnerId"],
    tossWinnerName: json["tossWinnerName"],
    decision: json["decision"],
  );

  Map<String, dynamic> toMap() => {
    "tossWinnerId": tossWinnerId,
    "tossWinnerName": tossWinnerName,
    "decision": decision,
  };
}

class ScoreCard {
  final int? matchId;
  final int? inningsId;
  final int? timeScore;
  final BatTeamDetails? batTeamDetails;
  final BowlTeamDetails? bowlTeamDetails;
  final ScoreDetails? scoreDetails;
  final ExtrasData? extrasData;
  final List<WicketsDatum>? wicketsData;
  final PpData? ppData;

  ScoreCard({
    this.matchId,
    this.inningsId,
    this.timeScore,
    this.batTeamDetails,
    this.bowlTeamDetails,
    this.scoreDetails,
    this.extrasData,
    this.wicketsData,
    this.ppData,
  });

  factory ScoreCard.fromJson(String str) => ScoreCard.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ScoreCard.fromMap(Map<String, dynamic> json) => ScoreCard(
    matchId: json["matchId"],
    inningsId: json["inningsId"],
    timeScore: json["timeScore"],
    batTeamDetails: json["batTeamDetails"] == null ? null : BatTeamDetails.fromMap(json["batTeamDetails"]),
    bowlTeamDetails: json["bowlTeamDetails"] == null ? null : BowlTeamDetails.fromMap(json["bowlTeamDetails"]),
    scoreDetails: json["scoreDetails"] == null ? null : ScoreDetails.fromMap(json["scoreDetails"]),
    extrasData: json["extrasData"] == null ? null : ExtrasData.fromMap(json["extrasData"]),
    wicketsData: json["wicketsData"] == null ? [] : List<WicketsDatum>.from(json["wicketsData"]!.map((x) => WicketsDatum.fromMap(x))),
    ppData: json["ppData"] == null ? null : PpData.fromMap(json["ppData"]),
  );

  Map<String, dynamic> toMap() => {
    "matchId": matchId,
    "inningsId": inningsId,
    "timeScore": timeScore,
    "batTeamDetails": batTeamDetails?.toMap(),
    "bowlTeamDetails": bowlTeamDetails?.toMap(),
    "scoreDetails": scoreDetails?.toMap(),
    "extrasData": extrasData?.toMap(),
    "wicketsData": wicketsData == null ? [] : List<dynamic>.from(wicketsData!.map((x) => x.toMap())),
    "ppData": ppData?.toMap(),
  };
}

class BatTeamDetails {
  final int? batTeamId;
  final String? batTeamName;
  final String? batTeamShortName;
  final List<BatsmenDatum>? batsmenData;

  BatTeamDetails({
    this.batTeamId,
    this.batTeamName,
    this.batTeamShortName,
    this.batsmenData,
  });

  factory BatTeamDetails.fromJson(String str) => BatTeamDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BatTeamDetails.fromMap(Map<String, dynamic> json) => BatTeamDetails(
    batTeamId: json["batTeamId"],
    batTeamName: json["batTeamName"],
    batTeamShortName: json["batTeamShortName"],
    batsmenData: json["batsmenData"] == null ? [] : List<BatsmenDatum>.from(json["batsmenData"]!.map((x) => BatsmenDatum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "batTeamId": batTeamId,
    "batTeamName": batTeamName,
    "batTeamShortName": batTeamShortName,
    "batsmenData": batsmenData == null ? [] : List<dynamic>.from(batsmenData!.map((x) => x.toMap())),
  };
}

class BatsmenDatum {
  final int? batId;
  final String? batName;
  final String? batShortName;
  final bool? isCaptain;
  final bool? isKeeper;
  final int? runs;
  final int? balls;
  final int? dots;
  final int? fours;
  final int? sixes;
  final int? mins;
  final double? strikeRate;
  final String? outDesc;
  final int? bowlerId;
  final int? fielderId1;
  final int? fielderId2;
  final int? fielderId3;
  final int? ones;
  final int? twos;
  final int? threes;
  final int? fives;
  final int? boundaries;
  final int? sixers;
  final String? wicketCode;
  final bool? isOverseas;
  final String? inMatchChange;
  final String? playingXiChange;

  BatsmenDatum({
    this.batId,
    this.batName,
    this.batShortName,
    this.isCaptain,
    this.isKeeper,
    this.runs,
    this.balls,
    this.dots,
    this.fours,
    this.sixes,
    this.mins,
    this.strikeRate,
    this.outDesc,
    this.bowlerId,
    this.fielderId1,
    this.fielderId2,
    this.fielderId3,
    this.ones,
    this.twos,
    this.threes,
    this.fives,
    this.boundaries,
    this.sixers,
    this.wicketCode,
    this.isOverseas,
    this.inMatchChange,
    this.playingXiChange,
  });

  factory BatsmenDatum.fromJson(String str) => BatsmenDatum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BatsmenDatum.fromMap(Map<String, dynamic> json) => BatsmenDatum(
    batId: json["batId"],
    batName: json["batName"],
    batShortName: json["batShortName"],
    isCaptain: json["isCaptain"],
    isKeeper: json["isKeeper"],
    runs: json["runs"],
    balls: json["balls"],
    dots: json["dots"],
    fours: json["fours"],
    sixes: json["sixes"],
    mins: json["mins"],
    strikeRate: json["strikeRate"]?.toDouble(),
    outDesc: json["outDesc"],
    bowlerId: json["bowlerId"],
    fielderId1: json["fielderId1"],
    fielderId2: json["fielderId2"],
    fielderId3: json["fielderId3"],
    ones: json["ones"],
    twos: json["twos"],
    threes: json["threes"],
    fives: json["fives"],
    boundaries: json["boundaries"],
    sixers: json["sixers"],
    wicketCode: json["wicketCode"],
    isOverseas: json["isOverseas"],
    inMatchChange: json["inMatchChange"],
    playingXiChange: json["playingXIChange"],
  );

  Map<String, dynamic> toMap() => {
    "batId": batId,
    "batName": batName,
    "batShortName": batShortName,
    "isCaptain": isCaptain,
    "isKeeper": isKeeper,
    "runs": runs,
    "balls": balls,
    "dots": dots,
    "fours": fours,
    "sixes": sixes,
    "mins": mins,
    "strikeRate": strikeRate,
    "outDesc": outDesc,
    "bowlerId": bowlerId,
    "fielderId1": fielderId1,
    "fielderId2": fielderId2,
    "fielderId3": fielderId3,
    "ones": ones,
    "twos": twos,
    "threes": threes,
    "fives": fives,
    "boundaries": boundaries,
    "sixers": sixers,
    "wicketCode": wicketCode,
    "isOverseas": isOverseas,
    "inMatchChange": inMatchChange,
    "playingXIChange": playingXiChange,
  };
}

class BowlTeamDetails {
  final int? bowlTeamId;
  final String? bowlTeamName;
  final String? bowlTeamShortName;
  final List<BowlersDatum>? bowlersData;

  BowlTeamDetails({
    this.bowlTeamId,
    this.bowlTeamName,
    this.bowlTeamShortName,
    this.bowlersData,
  });

  factory BowlTeamDetails.fromJson(String str) => BowlTeamDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BowlTeamDetails.fromMap(Map<String, dynamic> json) => BowlTeamDetails(
    bowlTeamId: json["bowlTeamId"],
    bowlTeamName: json["bowlTeamName"],
    bowlTeamShortName: json["bowlTeamShortName"],
    bowlersData: json["bowlersData"] == null ? [] : List<BowlersDatum>.from(json["bowlersData"]!.map((x) => BowlersDatum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "bowlTeamId": bowlTeamId,
    "bowlTeamName": bowlTeamName,
    "bowlTeamShortName": bowlTeamShortName,
    "bowlersData": bowlersData == null ? [] : List<dynamic>.from(bowlersData!.map((x) => x.toMap())),
  };
}

class BowlersDatum {
  final int? bowlerId;
  final String? bowlName;
  final String? bowlShortName;
  final bool? isCaptain;
  final bool? isKeeper;
  final double? overs;
  final int? maidens;
  final int? runs;
  final int? wickets;
  final double? economy;
  final int? noBalls;
  final int? wides;
  final int? dots;
  final int? balls;
  final double? runsPerBall;
  final bool? isOverseas;
  final String? inMatchChange;
  final String? playingXiChange;

  BowlersDatum({
    this.bowlerId,
    this.bowlName,
    this.bowlShortName,
    this.isCaptain,
    this.isKeeper,
    this.overs,
    this.maidens,
    this.runs,
    this.wickets,
    this.economy,
    this.noBalls,
    this.wides,
    this.dots,
    this.balls,
    this.runsPerBall,
    this.isOverseas,
    this.inMatchChange,
    this.playingXiChange,
  });

  factory BowlersDatum.fromJson(String str) => BowlersDatum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BowlersDatum.fromMap(Map<String, dynamic> json) => BowlersDatum(
    bowlerId: json["bowlerId"],
    bowlName: json["bowlName"],
    bowlShortName: json["bowlShortName"],
    isCaptain: json["isCaptain"],
    isKeeper: json["isKeeper"],
    overs: json["overs"]?.toDouble(),
    maidens: json["maidens"],
    runs: json["runs"],
    wickets: json["wickets"],
    economy: json["economy"]?.toDouble(),
    noBalls: json["no_balls"],
    wides: json["wides"],
    dots: json["dots"],
    balls: json["balls"],
    runsPerBall: json["runsPerBall"]?.toDouble(),
    isOverseas: json["isOverseas"],
    inMatchChange: json["inMatchChange"],
    playingXiChange: json["playingXIChange"],
  );

  Map<String, dynamic> toMap() => {
    "bowlerId": bowlerId,
    "bowlName": bowlName,
    "bowlShortName": bowlShortName,
    "isCaptain": isCaptain,
    "isKeeper": isKeeper,
    "overs": overs,
    "maidens": maidens,
    "runs": runs,
    "wickets": wickets,
    "economy": economy,
    "no_balls": noBalls,
    "wides": wides,
    "dots": dots,
    "balls": balls,
    "runsPerBall": runsPerBall,
    "isOverseas": isOverseas,
    "inMatchChange": inMatchChange,
    "playingXIChange": playingXiChange,
  };
}

class ExtrasData {
  final int? noBalls;
  final int? total;
  final int? byes;
  final int? penalty;
  final int? wides;
  final int? legByes;

  ExtrasData({
    this.noBalls,
    this.total,
    this.byes,
    this.penalty,
    this.wides,
    this.legByes,
  });

  factory ExtrasData.fromJson(String str) => ExtrasData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExtrasData.fromMap(Map<String, dynamic> json) => ExtrasData(
    noBalls: json["noBalls"],
    total: json["total"],
    byes: json["byes"],
    penalty: json["penalty"],
    wides: json["wides"],
    legByes: json["legByes"],
  );

  Map<String, dynamic> toMap() => {
    "noBalls": noBalls,
    "total": total,
    "byes": byes,
    "penalty": penalty,
    "wides": wides,
    "legByes": legByes,
  };
}

class PpData {
  PpData();

  factory PpData.fromJson(String str) => PpData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PpData.fromMap(Map<String, dynamic> json) => PpData(
  );

  Map<String, dynamic> toMap() => {
  };
}

class ScoreDetails {
  final int? ballNbr;
  final bool? isDeclared;
  final bool? isFollowOn;
  final double? overs;
  final double? revisedOvers;
  final double? runRate;
  final int? runs;
  final int? wickets;
  final double? runsPerBall;

  ScoreDetails({
    this.ballNbr,
    this.isDeclared,
    this.isFollowOn,
    this.overs,
    this.revisedOvers,
    this.runRate,
    this.runs,
    this.wickets,
    this.runsPerBall,
  });

  factory ScoreDetails.fromJson(String str) => ScoreDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ScoreDetails.fromMap(Map<String, dynamic> json) => ScoreDetails(
    ballNbr: json["ballNbr"],
    isDeclared: json["isDeclared"],
    isFollowOn: json["isFollowOn"],
    overs: json["overs"]?.toDouble(),
    revisedOvers: json["revisedOvers"],
    runRate: json["runRate"]?.toDouble(),
    runs: json["runs"],
    wickets: json["wickets"],
    runsPerBall: json["runsPerBall"]?.toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "ballNbr": ballNbr,
    "isDeclared": isDeclared,
    "isFollowOn": isFollowOn,
    "overs": overs,
    "revisedOvers": revisedOvers,
    "runRate": runRate,
    "runs": runs,
    "wickets": wickets,
    "runsPerBall": runsPerBall,
  };
}

class WicketsDatum {
  final int? batId;
  final String? batName;
  final int? wktNbr;
  final double? wktOver;
  final int? wktRuns;
  final int? ballNbr;

  WicketsDatum({
    this.batId,
    this.batName,
    this.wktNbr,
    this.wktOver,
    this.wktRuns,
    this.ballNbr,
  });

  factory WicketsDatum.fromJson(String str) => WicketsDatum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WicketsDatum.fromMap(Map<String, dynamic> json) => WicketsDatum(
    batId: json["batId"],
    batName: json["batName"],
    wktNbr: json["wktNbr"],
    wktOver: json["wktOver"]?.toDouble(),
    wktRuns: json["wktRuns"],
    ballNbr: json["ballNbr"],
  );

  Map<String, dynamic> toMap() => {
    "batId": batId,
    "batName": batName,
    "wktNbr": wktNbr,
    "wktOver": wktOver,
    "wktRuns": wktRuns,
    "ballNbr": ballNbr,
  };
}

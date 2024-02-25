class CovidData {
  bool success;
  Data data;
  String lastRefreshed;
  String lastOriginUpdate;

  CovidData({
    required this.success,
    required this.data,
    required this.lastRefreshed,
    required this.lastOriginUpdate,
  });

  factory CovidData.fromJson(Map<String, dynamic> json) {
    return CovidData(
      success: json['success'] ?? false,
      data: Data.fromJson(json['data']),
      lastRefreshed: json['lastRefreshed'] ?? '',
      lastOriginUpdate: json['lastOriginUpdate'] ?? '',
    );
  }
}

class Data {
  Summary summary;
  List<UnofficialSummary> unofficialSummary;
  List<Regional> regional;

  Data({
    required this.summary,
    required this.unofficialSummary,
    required this.regional,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      summary: Summary.fromJson(json['summary']),
      unofficialSummary: List<UnofficialSummary>.from(
        json['unofficial-summary'].map((x) => UnofficialSummary.fromJson(x)),
      ),
      regional: List<Regional>.from(
        json['regional'].map((x) => Regional.fromJson(x)),
      ),
    );
  }
}

class Summary {
  int total;
  int confirmedCasesIndian;
  int confirmedCasesForeign;
  int discharged;
  int deaths;
  int confirmedButLocationUnidentified;

  Summary({
    required this.total,
    required this.confirmedCasesIndian,
    required this.confirmedCasesForeign,
    required this.discharged,
    required this.deaths,
    required this.confirmedButLocationUnidentified,
  });

  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(
      total: json['total'] ?? 0,
      confirmedCasesIndian: json['confirmedCasesIndian'] ?? 0,
      confirmedCasesForeign: json['confirmedCasesForeign'] ?? 0,
      discharged: json['discharged'] ?? 0,
      deaths: json['deaths'] ?? 0,
      confirmedButLocationUnidentified:
          json['confirmedButLocationUnidentified'] ?? 0,
    );
  }
}

class UnofficialSummary {
  String source;
  int total;
  int recovered;
  int deaths;
  int active;

  UnofficialSummary({
    required this.source,
    required this.total,
    required this.recovered,
    required this.deaths,
    required this.active,
  });

  factory UnofficialSummary.fromJson(Map<String, dynamic> json) {
    return UnofficialSummary(
      source: json['source'] ?? '',
      total: json['total'] ?? 0,
      recovered: json['recovered'] ?? 0,
      deaths: json['deaths'] ?? 0,
      active: json['active'] ?? 0,
    );
  }
}

class Regional {
  String loc;
  int confirmedCasesIndian;
  int confirmedCasesForeign;
  int discharged;
  int deaths;
  int totalConfirmed;

  Regional({
    required this.loc,
    required this.confirmedCasesIndian,
    required this.confirmedCasesForeign,
    required this.discharged,
    required this.deaths,
    required this.totalConfirmed,
  });

  factory Regional.fromJson(Map<String, dynamic> json) {
    return Regional(
      loc: json['loc'] ?? '',
      confirmedCasesIndian: json['confirmedCasesIndian'] ?? 0,
      confirmedCasesForeign: json['confirmedCasesForeign'] ?? 0,
      discharged: json['discharged'] ?? 0,
      deaths: json['deaths'] ?? 0,
      totalConfirmed: json['totalConfirmed'] ?? 0,
    );
  }
}

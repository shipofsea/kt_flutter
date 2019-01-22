import 'dart:async';

import 'package:http/http.dart' as http;

import 'model.dart';

Future<Logs> getLogs() async {
  final responseLogs = await http
      .get('https://api.keeptruckin.com/api/w2/overview/logs', headers: {
    'X-Web-User-Auth':
        'P6n4a8jy0SxzR2p6ji0V9ft4kcIyUD869kxVfG7UiCI1zSnL+ACwYhhvMAHPMaZZ',
    'Authorization':
        'Basic a3RfZGFzaGJvYXJkX2F1dGg6RFQyOUp6c3JDY3V3MVh1MVg4TEg='
  });
  return logsFromJson(responseLogs.body);
}

Future<Scorecard> getScore() async {
  final responseScore = await http
      .get('https://api.keeptruckin.com/api/w2/overview/scorecards', headers: {
    'X-Web-User-Auth':
        'P6n4a8jy0SxzR2p6ji0V9ft4kcIyUD869kxVfG7UiCI1zSnL+ACwYhhvMAHPMaZZ',
    'Authorization':
        'Basic a3RfZGFzaGJvYXJkX2F1dGg6RFQyOUp6c3JDY3V3MVh1MVg4TEg='
  });
  return scorecardFromJson(responseScore.body);
}

Future<ElDevents> getELDevents() async {
  final responseELDevents = await http.get(
      'https://api.keeptruckin.com/api/w2/overview/driving_periods',
      headers: {
        'X-Web-User-Auth':
            'P6n4a8jy0SxzR2p6ji0V9ft4kcIyUD869kxVfG7UiCI1zSnL+ACwYhhvMAHPMaZZ',
        'Authorization':
            'Basic a3RfZGFzaGJvYXJkX2F1dGg6RFQyOUp6c3JDY3V3MVh1MVg4TEg='
      });
  return elDeventsFromJson(responseELDevents.body);
}

Future<Utilization> getUtilization() async {
  final responseUtilization = await http
      .get('https://api.keeptruckin.com/api/w2/overview/idling', headers: {
    'X-Web-User-Auth':
        'P6n4a8jy0SxzR2p6ji0V9ft4kcIyUD869kxVfG7UiCI1zSnL+ACwYhhvMAHPMaZZ',
    'Authorization':
        'Basic a3RfZGFzaGJvYXJkX2F1dGg6RFQyOUp6c3JDY3V3MVh1MVg4TEg='
  });
  return utilizationFromJson(responseUtilization.body);
}

Future<Drivers> getDrivers() async {
  final responseDrivers = await http
      .get('https://api.keeptruckin.com/api/w2/overview/drivers', headers: {
    'X-Web-User-Auth':
        'P6n4a8jy0SxzR2p6ji0V9ft4kcIyUD869kxVfG7UiCI1zSnL+ACwYhhvMAHPMaZZ',
    'Authorization':
        'Basic a3RfZGFzaGJvYXJkX2F1dGg6RFQyOUp6c3JDY3V3MVh1MVg4TEg='
  });
  return driversFromJson(responseDrivers.body);
}

String convertDate(String date) {
  List splits = date.split("-");

  String day = splits[2];
  String monthDay;

  if (splits[1] == "01") {
    monthDay = "JANUARY " + day;
  } else if ((splits[1] == "02")) {
    monthDay = "FEBRUARY " + day;
  } else if ((splits[1] == "03")) {
    monthDay = "MARCH " + day;
  } else if ((splits[1] == "04")) {
    monthDay = "APRIL " + day;
  } else if ((splits[1] == "05")) {
    monthDay = "MAY " + day;
  } else if ((splits[1] == "06")) {
    monthDay = "JUNE " + day;
  } else if ((splits[1] == "07")) {
    monthDay = "JULY " + day;
  } else if ((splits[1] == "08")) {
    monthDay = "AUGUST " + day;
  } else if ((splits[1] == "09")) {
    monthDay = "SEPTEMBER " + day;
  } else if ((splits[1] == "10")) {
    monthDay = "OCTOBER " + day;
  } else if ((splits[1] == "11")) {
    monthDay = "NOVEMBER " + day;
  } else if ((splits[1] == "12")) {
    monthDay = "DECEMBER " + day;
  }
  print(monthDay);

  return monthDay;
}
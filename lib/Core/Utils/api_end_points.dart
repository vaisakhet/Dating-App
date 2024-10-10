class ApiEndPoint {
  static const String baseUrl = 'http://82.180.145.66';

  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String login = '/api/token/';
  final String userList = '/api/list/matches/all';
  final String suggestedUserList = "/api/list/matches/suggested";
}

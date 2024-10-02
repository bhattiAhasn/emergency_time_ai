class ApiData {
  //All API's call end points
  //Base url
  static const String baseUrl =
      "http://openpolicy1.canadacentral.cloudapp.azure.com:8000";
  //Auth call end points

  static const String login = "$baseUrl/login";
  //Register user

  static const String profile = "$baseUrl/profile";

  static const String getPolls = "$baseUrl/polls/";
  //Register user
  static const String registerUser = "$baseUrl/register/";

  //show bills
  static const String allBills = "$baseUrl/bills/";

  static const String getBills = "$baseUrl/bills-bill/";

  static const String getLimit = "$baseUrl/bills-bill/";

  static const String seedBills = "$baseUrl/seed-bills/";

  static const String postComments = "$baseUrl/comments/";

  static String summarizeData(String billId) {
    return "$baseUrl/summarize/$billId";
  }

  static String billData(String billId) {
    return "$baseUrl/bills-bill/$billId";
  }

  static String chatBoat(String billId) {
    return "$baseUrl/chat/$billId";
  }

  static String getComments(String billId) {
    return "$baseUrl/comments/$billId";
  }

  static String votesBills(String billId, bool upvote) {
    return "$baseUrl/bills-bill/$billId/vote?upvote=$upvote";
  }

  static String votePollsSurvey(String pollId) {
    return "$baseUrl/polls/$pollId/vote";
  }

  static String pollsSurvey(String billId, bool upvote) {
    return "$baseUrl/polls/$billId/$upvote";
  }

  static String createPollUrl() {
    return "$baseUrl/polls/";
  }

  //forgot Password call end points
  static const String forgotPassword = "$baseUrl/forgot_password/";
  //verify OTP user
  static const String verifyOtp = "$baseUrl/otp_verification";
  //reset password
  static const String resetPassword = "$baseUrl/reset_password/";
  //reset password
  static const String logout = "$baseUrl/logout";

  static const String deleteComment = "$baseUrl/comments";
}

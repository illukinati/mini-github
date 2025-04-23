class MyUrl {
  static String baseUrl = "https://api.github.com/";
  static String allUsersUrl = "${baseUrl}users";

  static String userDetailUrl(String username) {
    return "${baseUrl}users/$username";
  }

  static String userReposUrl(String username) {
    return "${baseUrl}users/$username/repos";
  }
}

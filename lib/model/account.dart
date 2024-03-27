class Account {
  int id = 0;
  String username = '';

  Account();

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'username': username};
  }
}

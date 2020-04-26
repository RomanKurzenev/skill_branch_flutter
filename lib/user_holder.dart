import 'package:FlutterGalleryApp/models/user.dart';

class UserHolder {
  Map<String, User> users = {};

  void registerUser(String name, String phone, String email) {
    User user = User(name: name, phone: phone, email: email);
    print(user.toString());
    if (!users.containsKey(user.login)) {
      users[user.login] = user;
    } else {
      throw Exception("A user with this name already exists");
    }
  }

  User getUserByLogin(String login) {
    return users[login];
  }

  User registerUserByEmail(String fullName, String email) {
    //if (email.isEmpty) throw Exception('email is empty');
    if (users.containsKey(email)) throw Exception('A user with this name already exists');

    User user = User(name: fullName, email: email);
    users[user.email] = user;

    print(user.userInfo);
    return user;
  }

  

  User registerUserByPhone(String fullName, String phone) {
    if (phone.isEmpty) throw Exception('phone is empty');
    String validPhone = User.checkPhone(phone);

    if (users.containsKey(phone)) throw Exception("A user with this phone already exists");

    User user = User(name: fullName, phone: validPhone);
    users[user.login] = user;
    print(user.userInfo);
    return user;
  }

  void setFriends(String login, List<User> friends) {
    User user = getUserByLogin(login);

    user.addFriends(friends);
  }

  User findUserInFriends(String login, User friend) {
    User user = getUserByLogin(login);

    for (User user in user.friends) {
      if (user == friend) return user;
    }
    return throw Exception('${friend.login} is not a friend of the login');
  }

  List<User> importUsers(List<String> dataList) {
    List<User> listUsers = [];

    for (String str in dataList) {
      List<String> data = str.split(";");
      User user = User(name: data[0].trim(), phone: data[2].trim(), email: data[1].trim());
      listUsers.add(user);
    }
    return listUsers;
  }
}

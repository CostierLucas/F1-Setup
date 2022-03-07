class User {
  final String uid;
  final String? email;

  User(this.uid, this.email);
}

class ErrorRegister {
  static String error = "";

  setError(err) {
    switch (err) {
      case "The email address is badly formatted.":
        error = "Email incorrect";
        break;
      case "Password should be at least 6 characters":
        error = "Password Incorrect";
        break;
      case "The password is invalid or the user does not have a password.":
        error = "Password Incorrect or user doesnt exist";
        break;
      default:
        error = err;
    }
  }
}

class UserFirestore {
  final String uid;
  final String? email;
  final String? pseudo;

  UserFirestore(this.uid, this.email, this.pseudo);
}

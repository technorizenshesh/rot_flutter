class LocalData {
  static bool userType = true;

  static void setUserType(bool value) {
    value ? print("User....") : print("Administor_Supervisor....");
    userType = value;
  }
}

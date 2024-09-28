import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../app/data/apis/api_models/user_model.dart';

class CheckScreenPermission {
  List<Map<String, String>> administratorList = [
    {
      "id": "1",
      "type": "Administrator",
      "permission": "Exclusive permissions from ROT ",
      "date_time": "2024-08-30 10:46:14"
    },
    {
      "id": "2",
      "type": "Administrator",
      "permission": "Publish and update product in ROT Shops",
      "date_time": "2024-08-30 10:46:14"
    },
    {
      "id": "3",
      "type": "Administrator",
      "permission": "Manage my sales",
      "date_time": "2024-08-30 10:46:32"
    },
    {
      "id": "4",
      "type": "Administrator",
      "permission": "Purchases products",
      "date_time": "2024-08-30 10:46:32"
    },
    {
      "id": "5",
      "type": "Administrator",
      "permission": "Edit profile",
      "date_time": "2024-08-30 10:46:54"
    },
    {
      "id": "6",
      "type": "Administrator",
      "permission": "Change location",
      "date_time": "2024-08-30 10:46:54"
    },
    {
      "id": "7",
      "type": "Administrator",
      "permission": "Subcription manage",
      "date_time": "2024-08-30 10:47:13"
    },
    {
      "id": "8",
      "type": "Administrator",
      "permission": "General setting",
      "date_time": "2024-08-30 10:47:13"
    },
    {
      "id": "9",
      "type": "Administrator",
      "permission": "Change password",
      "date_time": "2024-08-30 10:47:30"
    },
    {
      "id": "10",
      "type": "Administrator",
      "permission": "Answer questions(Chating with users)",
      "date_time": "2024-08-30 10:47:30"
    },
    {
      "id": "11",
      "type": "Administrator",
      "permission": "Rate users",
      "date_time": "2024-08-30 10:47:45"
    },
    {
      "id": "12",
      "type": "Administrator",
      "permission": "Manage payments and invoices",
      "date_time": "2024-08-30 10:47:45"
    },
    {
      "id": "13",
      "type": "Administrator",
      "permission": "Exclusive ROT permissions",
      "date_time": "2024-08-30 10:48:09"
    },
    {
      "id": "14",
      "type": "Administrator",
      "permission": "View account balance",
      "date_time": "2024-08-30 10:48:09"
    },
    {
      "id": "15",
      "type": "Administrator",
      "permission": "Payment permissions",
      "date_time": "2024-08-30 10:48:25"
    },
    {
      "id": "16",
      "type": "Administrator",
      "permission": "Transaction history",
      "date_time": "2024-08-30 10:48:25"
    },
    {
      "id": "17",
      "type": "Administrator",
      "permission": "Bank information",
      "date_time": "2024-08-30 10:48:33"
    }
  ];

  List<Map<String, String>> supervisorList = [
    {
      "id": "18",
      "type": "Supervisor",
      "permission": "Exclusive permissions from ROT ",
      "date_time": "2024-08-30 10:46:14"
    },
    {
      "id": "19",
      "type": "Supervisor",
      "permission": "Publish and update product in ROT Shops",
      "date_time": "2024-08-30 10:46:14"
    },
    {
      "id": "20",
      "type": "Supervisor",
      "permission": "Manage my sales",
      "date_time": "2024-08-30 10:46:32"
    },
    {
      "id": "21",
      "type": "Supervisor",
      "permission": "Purchases products",
      "date_time": "2024-08-30 10:46:32"
    },
    {
      "id": "22",
      "type": "Supervisor",
      "permission": "Edit profile",
      "date_time": "2024-08-30 10:46:54"
    },
    {
      "id": "23",
      "type": "Supervisor",
      "permission": "Change location",
      "date_time": "2024-08-30 10:46:54"
    },
    {
      "id": "24",
      "type": "Supervisor",
      "permission": "Subcription manage",
      "date_time": "2024-08-30 10:47:13"
    },
    {
      "id": "25",
      "type": "Supervisor",
      "permission": "General setting",
      "date_time": "2024-08-30 10:47:13"
    },
    {
      "id": "26",
      "type": "Supervisor",
      "permission": "Change password",
      "date_time": "2024-08-30 10:47:30"
    },
    {
      "id": "27",
      "type": "Supervisor",
      "permission": "Answer questions(Chating with users)",
      "date_time": "2024-08-30 10:47:30"
    },
    {
      "id": "28",
      "type": "Supervisor",
      "permission": "Rate users",
      "date_time": "2024-08-30 10:47:45"
    },
    {
      "id": "29",
      "type": "Supervisor",
      "permission": "Manage payments and invoices",
      "date_time": "2024-08-30 10:47:45"
    },
    {
      "id": "30",
      "type": "Supervisor",
      "permission": "Exclusive ROT permissions",
      "date_time": "2024-08-30 10:48:09"
    },
    {
      "id": "31",
      "type": "Supervisor",
      "permission": "View account balance",
      "date_time": "2024-08-30 10:48:09"
    },
    {
      "id": "32",
      "type": "Supervisor",
      "permission": "Payment permissions",
      "date_time": "2024-08-30 10:48:25"
    },
    {
      "id": "33",
      "type": "Supervisor",
      "permission": "Transaction history",
      "date_time": "2024-08-30 10:48:25"
    },
    {
      "id": "34",
      "type": "Supervisor",
      "permission": "Bank information",
      "date_time": "2024-08-30 10:48:33"
    }
  ];

  static Future<bool> checkPermission(
      String permissionIdA, String permissionIdS) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData =
        jsonDecode(sharedPreferences.getString('User_data') ?? '');
    List<CollaboratorsPermission> collaboratorsPermission = [];
    if (jsonData != null) {
      UserData userData = UserData.fromJson(jsonData);
      collaboratorsPermission = userData.collaboratorsPermission!;
      if (collaboratorsPermission[0].type == 'Administrator') {
        for (int i = 0; i < collaboratorsPermission.length; i++) {
          if (collaboratorsPermission[i].id == permissionIdA) {
            return true;
          }
        }
      } else {
        for (int i = 0; i < collaboratorsPermission.length; i++) {
          if (collaboratorsPermission[i].id == permissionIdS) {
            return true;
          }
        }
      }
    }
    return false;
  }
}

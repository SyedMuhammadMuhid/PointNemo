

bool taskDone = false;
bool philipBadgeWon = false;
int userOnePoints = 50;
int userOneRank = 20;

int userTwoPoints = 166;
int userTwoRank = 04;

List<int> winUserPictures = [0,1,2];
List<int> missionPointsList = [10, 30, 50, 15, 20, 5, 30, 10, 5];
List<int> accomplishmentPointsList = [ 20, 5, 20, 15];
List<String> SideBarUsers = [
  "Debra Collins",
  "Harold Copper",
  "Alexander"
];

List<Map<String, int>> missionTextList = [
  {"Wipe down counters": 10},
  {"Fountain ice stock": 10},
  {"Restock coffee supplies": 50},
  {"Wipe down counters": 15},
  {"Turn off electronics and other appliances": 30},
  {"Wipe down ice machines out front": 5},
  {"Check that all display are in order": 30},
  {"Dust off tables": 10},
  {"Physically count all your products if necessary": 5},
];
List<Map<String, int>> accomplishmentTextList = [
  // {"Turn off electronics and other appliances": 20},
  {"Restock shelves if necessary": 5},
  {"Ensure that product tags are in order": 20},
  {"Enter your daily cash float": 15},
];

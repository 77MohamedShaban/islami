import 'package:islami/model/sura_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static late final SharedPreferences prefs;
  static Future<void> init() async {
    prefs= await SharedPreferences.getInstance();
  }
  static saveMostRecently(List<SuraModel> mostRecently){
    List<String> suraNames =mostRecently.map((recentSura) => recentSura.suraNameEn ,).toList();
    prefs.setStringList("mostRecent", suraNames);
  }
  static List<SuraModel> getMostRecently(){
    List<String> suraNames =prefs.getStringList("mostRecent")??[];
    List<SuraModel> mostRecentlySuras=[];
    for(int i=0;i<suraNames.length;i++){
      for(int j=0;j<SuraModel.surasList.length;j++){
            if(SuraModel.surasList[j].suraNameEn==suraNames[i]){
                 mostRecentlySuras.add(SuraModel.surasList[j]);
                 break;
            }
      }
    }
    return mostRecentlySuras;
  }
  static Onboardingbuild(bool) {
    prefs.setBool("buildOnboarding", bool);
  }

  static bool getOnboardingBuild() {
    return prefs.getBool("buildOnboarding")??true;
  }
}
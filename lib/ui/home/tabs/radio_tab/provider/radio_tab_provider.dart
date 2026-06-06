import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/resources/colors_manager.dart';
import 'package:just_audio/just_audio.dart';
import '../../../../../core/remote/network/api_manager.dart';
import '../models/radio_model.dart';
import '../models/reciters_model.dart';

enum RadioTabTypes { radio, reciters }

enum RadioStates { initial, loading, success, failure }

enum RecitersStates { initial, loading, success, failure }

class RadioTabProvider extends ChangeNotifier {
  RadioTabProvider() {
    getRadios();
    getReciters();
  }

  final AudioPlayer _audioPlayer = AudioPlayer();

  RadioTabTypes _selectedTab = RadioTabTypes.radio;

  RadioTabTypes get getSelectedTab => _selectedTab;

  void switchTab(RadioTabTypes type) {
    _selectedTab = type;
    notifyListeners();
  }

  TextStyle getTabTextStyle(RadioTabTypes type) {
    return TextStyle(
      fontSize: 16,
      fontWeight: _selectedTab == type ? FontWeight.w600 : FontWeight.w400,
      color: _selectedTab == type ? ColorsManager.black : Colors.white,
    );
  }

  List<Radios?>? radios;
  RadioStates radioState = RadioStates.initial;

  Future<void> getRadios() async {
    radioState = RadioStates.loading;
    notifyListeners();
    try {
      final result = await ApiManager.getRadios();
      radios = result.radios;
      radioState = RadioStates.success;
      notifyListeners();
    } catch (e) {
      print(e.toString());
      radioState = RadioStates.failure;
      notifyListeners();
    }
  }

  List<Reciters?>? reciters;
  RecitersStates recitersState = RecitersStates.initial;

  Future<void> getReciters() async {
    recitersState = RecitersStates.loading;
    notifyListeners();
    try {
      final result = await ApiManager.getReciters();
      reciters = result.reciters;
      recitersState = RecitersStates.success;
      notifyListeners();
    } catch (e) {
      print(e.toString());
      recitersState = RecitersStates.failure;
      notifyListeners();
    }
  }

  ///////////////////// audio player RadioTab //////////////////

  Radios? selectedRadioForAudio;

  Future<void> playRadioRadioTab(Radios? radio) async {
    if (selectedRadioForAudio == radio) {
      await _audioPlayer.pause();
      selectedRadioForAudio = null;
    } else {
      await _audioPlayer.setUrl(radio?.url ?? "");
      _audioPlayer.play();
      selectedRadioForAudio = radio;
    }
    notifyListeners();
  }

  Radios? selectedRadioForVolume;

  Future<void> setVolumeRadioTab(Radios? radio) async {
    if (selectedRadioForVolume == radio) {
      _audioPlayer.setVolume(1);
      selectedRadioForVolume = null;
    } else {
      _audioPlayer.setVolume(0);
      selectedRadioForVolume = radio;
    }
    notifyListeners();
  }

  ///////////////////// audio player RecitersTab //////////////////

  Reciters? selectedReciterForAudio;

  int currentSura = 1;

  String get formatedSuraNumber => currentSura.toString().padLeft(3, '0');

  Future<void> playRadioRecitersTab(Reciters? reciter) async {
    if (selectedReciterForAudio == reciter) {
      await _audioPlayer.pause();
      selectedReciterForAudio = null;
    } else {
      await _audioPlayer.setUrl(
        "${reciter?.moshaf?[0].server}$formatedSuraNumber.mp3",
      );
      _audioPlayer.play();
      selectedReciterForAudio = reciter;
    }
    notifyListeners();
  }

  Future<void> nextSura(Reciters reciter) async {
    if (currentSura < 115) {
      currentSura++;
      await _audioPlayer.pause();
      await _audioPlayer.setUrl(
        "${selectedReciterForAudio?.moshaf?[0].server}$formatedSuraNumber.mp3",
      );
      _audioPlayer.play();
      selectedReciterForAudio = reciter;
      notifyListeners();
    }
  }

  Future<void> previousSura(Reciters reciter) async {
    if (currentSura > 1) {
      currentSura--;
      await _audioPlayer.pause();
      await _audioPlayer.setUrl(
        "${selectedReciterForAudio?.moshaf?[0].server}$formatedSuraNumber.mp3",
      );
      _audioPlayer.play();
      selectedReciterForAudio = reciter;
      notifyListeners();
    }
  }

  Reciters? selectedReciterForVolume;

  Future<void> setVolumeRecitersTab(Reciters? reciter) async {
    notifyListeners();
    if (selectedReciterForVolume == reciter) {
      _audioPlayer.setVolume(1);
      selectedReciterForVolume = null;
    } else {
      _audioPlayer.setVolume(0);
      selectedReciterForVolume = reciter;
    }
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    _audioPlayer.dispose();
    super.dispose();
  }
}

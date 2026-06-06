import 'package:flutter/material.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/colors_manager.dart';
import 'package:islami/ui/home/tabs/radio_tab/models/radio_model.dart';
import 'package:islami/ui/home/tabs/radio_tab/provider/radio_tab_provider.dart';
import 'package:provider/provider.dart';

class RadioCard extends StatelessWidget {
  final Radios? radio;

  const RadioCard({super.key, required this.radio});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: ColorsManager.gold,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            AssetsManager.mosqueHadithDetails,
            color: ColorsManager.black.withValues(alpha: 0.45),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 12),
              Text(
                radio?.name ?? "",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.black,
                ),
              ),
              Consumer<RadioTabProvider>(
                builder: (context, provider, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 55),
                      IconButton(
                        onPressed: () {
                          if(radio!=null){
                            provider.playRadioRadioTab(radio);
                          }
                        },
                        icon: Icon(
                          provider.selectedRadioForAudio == radio
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                          color: ColorsManager.black,
                          size: 50,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if(radio!=null){
                            provider.setVolumeRadioTab(radio);
                          }
                        },
                        icon: Icon(
                          provider.selectedRadioForVolume == radio
                              ? Icons.volume_off_rounded
                              :
                          Icons.volume_up_rounded,
                          color: ColorsManager.black,
                          size: 30,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

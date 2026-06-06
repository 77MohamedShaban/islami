import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../models/reciters_model.dart';
import '../provider/radio_tab_provider.dart';

class RecitersCard extends StatelessWidget {
  final Reciters? reciter;
  const RecitersCard({super.key, this.reciter});

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
                reciter?.name ?? "",
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
                          if(reciter!=null){
                            provider.previousSura(reciter!);
                          }
                        },
                        icon: Icon(
                          Icons.skip_previous_outlined,
                          color: ColorsManager.black,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if(reciter!=null){
                            provider.playRadioRecitersTab(reciter);
                          }
                        },
                        icon: Icon(
                          provider.selectedReciterForAudio == reciter
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                          color: ColorsManager.black,
                          size: 50,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if(reciter!=null){
                          provider.nextSura(reciter!);
                          }
                        },
                        icon: Icon(
                          Icons.skip_next_outlined,
                          color: ColorsManager.black,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if(reciter!=null){
                            provider.setVolumeRecitersTab(reciter);
                          }
                        },
                        icon: Icon(
                          provider.selectedReciterForVolume == reciter
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

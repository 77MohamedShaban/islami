import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/radio_tab/provider/radio_tab_provider.dart';
import 'package:islami/ui/home/tabs/radio_tab/widgets/radio_tab_switcher.dart';
import 'package:islami/ui/home/tabs/radio_tab/widgets/radio_view_list.dart';
import 'package:islami/ui/home/tabs/radio_tab/widgets/reciters_view_list.dart';
import 'package:provider/provider.dart';
import '../../../../core/resources/assets_manager.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.quranBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AssetsManager.islamiHeader,
                  width: screenWidth * .75,
                ),
              ),
              const SizedBox(height: 24),
              const RadioTabSwitcher(),
              Consumer<RadioTabProvider>(builder: (context, provider, child) {
                switch(provider.getSelectedTab) {
                  case RadioTabTypes.radio:
                    return const RadioViewList();
                  case RadioTabTypes.reciters:
                  return const RecitersViewList();
                }
              },)
            ],
          ),
        ),
      ),
    );
  }
}

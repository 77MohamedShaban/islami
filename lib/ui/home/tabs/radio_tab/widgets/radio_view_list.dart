import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/radio_tab/widgets/radio_card.dart';
import 'package:provider/provider.dart';

import '../../../../../core/resources/colors_manager.dart';
import '../provider/radio_tab_provider.dart';

class RadioViewList extends StatelessWidget {
  const RadioViewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RadioTabProvider>(
      builder: (context, provider, child) {
        switch (provider.radioState) {
          case RadioStates.initial:
            return const SizedBox.shrink();
          case RadioStates.loading:
            return const Expanded(
              child: Center(
                child: CircularProgressIndicator(color: ColorsManager.gold),
              ),
            );
          case RadioStates.success:
            return Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 24),
                itemBuilder: (context, index) =>
                    RadioCard(radio: provider.radios?[index]),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemCount: provider.radios?.length ?? 0,
              ),
            );
          case RadioStates.failure:
            return const Expanded(
              child: Center(
                child: Text(
                  "Failed to load Radios",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            );
        }
      },
    );
  }
}

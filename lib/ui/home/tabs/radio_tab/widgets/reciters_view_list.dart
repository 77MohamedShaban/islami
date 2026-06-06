import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/radio_tab/widgets/reciters_card.dart';
import 'package:provider/provider.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../provider/radio_tab_provider.dart';

class RecitersViewList extends StatelessWidget {
  const RecitersViewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RadioTabProvider>(
      builder: (context, provider, child) {
        switch (provider.recitersState) {
          case RecitersStates.initial:
            return const SizedBox.shrink();
          case RecitersStates.loading:
            return const Expanded(
              child: Center(
                child: CircularProgressIndicator(color: ColorsManager.gold),
              ),
            );
          case RecitersStates.success:
            return Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 24),
                itemBuilder: (context, index) =>
                    RecitersCard(reciter: provider.reciters?[index]),
                separatorBuilder: (context, index) =>
                const SizedBox(height: 16),
                itemCount: provider.reciters?.length ?? 0,
              ),
            );
          case RecitersStates.failure:
            return const Expanded(
              child: Center(
                child: Text(
                  "Failed to load Reciters",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            );
        }
      },
    );
  }
}

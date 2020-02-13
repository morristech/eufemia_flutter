import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class PaymentCardsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cards',
        ),
        leading: IconButton(
          icon: Icon(EufemiaIcons.back_arrow),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: MediaQuery.of(context).size.aspectRatio < 1
            ? ListView(
                padding: const EdgeInsets.all(16.0),
                children: cardList,
              )
            : GridView(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: goldenRatio,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 8.0,
                ),
                children: cardList,
              ),
      ),
    );
  }

  final cardList = [
    PaymentCard(
      design: CardDesign.green,
      logo: CardLogo.matte,
      type: CardType.visaDebitWhite,
    ),
    PaymentCard(
      design: CardDesign.white,
      logo: CardLogo.matte,
      logoColor: EufemiaColors.darkGray,
      type: CardType.visaDebit,
    ),
    PaymentCard(
      design: CardDesign.white,
      logo: CardLogo.matte,
      logoColor: EufemiaColors.emeraldGreen,
      type: CardType.visaDebit,
    ),
    PaymentCard(
      design: CardDesign.white,
      logo: CardLogo.matte,
      logoColor: EufemiaColors.summerGreen,
      type: CardType.visaDebit,
    ),
    PaymentCard(
      design: CardDesign.grey,
      logo: CardLogo.matte,
      logoColor: EufemiaColors.darkGray,
      type: CardType.visaDebit,
    ),
    PaymentCard(
      design: CardDesign.gold,
      logo: CardLogo.matte,
      type: CardType.visaDebitWhite,
    ),
    PaymentCard(
      design: CardDesign.saga,
      logo: CardLogo.matte,
      logoColor: EufemiaColors.sagaGold,
      program: CardProgram.sagaGold,
      type: CardType.visaDebitWhite,
    ),
    PaymentCard(
      design: CardDesign.black,
      logo: CardLogo.metallic,
      program: CardProgram.privateBanking,
      type: CardType.visaDebitSilver,
    ),
  ]
      .map((i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: i,
          ))
      .toList();
}

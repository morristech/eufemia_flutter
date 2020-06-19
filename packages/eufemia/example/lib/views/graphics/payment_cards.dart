import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class PaymentCardsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
        leading: IconButton(
          icon: Icon(EufemiaIcons.back_arrow),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: ScrollableList(
          adaptive: true,
          gridChildAspectRatio: goldenRatio,
          children: cardList,
        ),
      ),
    );
  }

  final List<Widget> cardList = [
    PaymentCard(
      design: CardDesign.green,
      frontContent: PaymentCardFrontContent(
        logo: CardLogo.matte,
        type: CardType.visaDebitWhite,
      ),
    ),
    PaymentCard(
      design: CardDesign.white,
      frontContent: PaymentCardFrontContent(
        logo: CardLogo.matte,
        logoColor: EufemiaColors.darkGray,
        type: CardType.visaDebit,
      ),
    ),
    PaymentCard(
      design: CardDesign.white,
      frontContent: PaymentCardFrontContent(
        logo: CardLogo.matte,
        logoColor: EufemiaColors.emeraldGreen,
        type: CardType.visaDebit,
      ),
    ),
    PaymentCard(
      design: CardDesign.white,
      frontContent: PaymentCardFrontContent(
        logo: CardLogo.matte,
        logoColor: EufemiaColors.summerGreen,
        type: CardType.visaDebit,
      ),
    ),
    PaymentCard(
      design: CardDesign.grey,
      frontContent: PaymentCardFrontContent(
        logo: CardLogo.matte,
        logoColor: EufemiaColors.darkGray,
        type: CardType.visaDebit,
      ),
    ),
    PaymentCard(
      design: CardDesign.gold,
      frontContent: PaymentCardFrontContent(
        logo: CardLogo.matte,
        type: CardType.visaDebitWhite,
      ),
    ),
    PaymentCard(
      design: CardDesign.saga,
      frontContent: PaymentCardFrontContent(
        logo: CardLogo.matte,
        logoColor: EufemiaColors.saga,
        program: CardProgram.sagaGold,
        type: CardType.visaDebitWhite,
      ),
    ),
    PaymentCard(
      design: CardDesign.black,
      frontContent: PaymentCardFrontContent(
        logo: CardLogo.metallic,
        program: CardProgram.privateBanking,
        type: CardType.visaDebitSilver,
      ),
    ),
    PaymentCard(
      design: CardDesign.matteBlack,
      frontContent: PaymentCardFrontContent(
        logo: CardLogo.matte,
        logoColor: EufemiaColors.pbBackground,
        logoAlignment: Alignment.topRight,
        type: CardType.masterCardSilver,
      ),
      softLight: false,
    ),
  ]
      .map((i) => EufemiaPadding(
            padding: EufemiaInsets.small(EufemiaSides.vertical),
            child: i,
          ))
      .toList();
}

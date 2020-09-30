import 'package:eufemia/components.dart';
import 'package:eufemia/palette.dart';
import 'package:eufemia/spacing.dart';
import 'package:eufemia/typography.dart';
import 'package:flippable_box/flippable_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

/// Assets path to the card logos
const _logoBase = 'lib/assets/graphics/cards/logos';

/// Assets path to the card program illustrations
const _programBase = 'lib/assets/graphics/cards/programs';

/// Assets path to the card type illustrations
const _typeBase = 'lib/assets/graphics/cards/types';

/// {@category Components}
/// {@subCategory Graphics}
/// A configuration class that defines the front side of a [PaymentCard].
class PaymentCardFrontContent {
  /// The logo to display.
  final CardLogo logo;

  /// The program print to display.
  final CardProgram program;

  /// The issuer/type to display.
  final CardType type;

  /// The pre-defined preset to use for the widget.
  final CardPreset preset;

  /// The color of the DNB logo.
  final Color logoColor;

  /// The 4 last un-masked digits to display (masked PAN).
  final int digits;

  /// The text to display above the masked digits.
  final String digitsText;

  /// The alignment of the logo on the card.
  final Alignment logoAlignment;

  PaymentCardFrontContent({
    this.logo,
    this.program,
    this.type,
    this.preset,
    this.logoColor = EufemiaColors.white,
    this.digits = 1358,
    this.digitsText = 'KORTNUMMER',
    this.logoAlignment = Alignment.topLeft,
  });
}

/// {@category Components}
/// {@subCategory Graphics}
/// A configuration class that defines the back side of a [PaymentCard].
class PaymentCardBackContent {
  /// The account number to display on the back.
  final String accountNumber;

  /// The account name to display on the back.
  final String accountName;

  /// The name of the cardholder to display on the back.
  final String cardholder;

  /// The card type text to display on the back.
  final String type;

  PaymentCardBackContent({
    this.accountNumber,
    this.accountName,
    this.cardholder,
    this.type,
  });
}

/// {@category Components}
/// {@subCategory Graphics}
/// A payment card widget from the Eufemia design system
class PaymentCard extends StatefulWidget {
  /// The [CardDesign] design to use.
  final CardDesign design;

  /// Width of the card.
  final double width;

  /// If the card should have a drop-shadow or not.
  final bool shadow;

  /// If the card is flippable. If true, [backContent] must be set.
  final bool flippable;

  /// If the card should be lit by a soft, white light.
  final bool softLight;

  /// Configuration for the card front.
  final PaymentCardFrontContent frontContent;

  /// Configuration for the card back.
  final PaymentCardBackContent backContent;

  const PaymentCard({
    Key key,
    this.width = 343,
    this.shadow = true,
    this.flippable = true,
    this.softLight = true,
    this.backContent,
    @required this.frontContent,
    @required this.design,
  }) : super(key: key);

  @override
  _PaymentCardState createState() => _PaymentCardState();

  double get height => width / goldenRatio;
}

class _PaymentCardState extends State<PaymentCard> {
  bool isFlipped;

  @override
  void initState() {
    super.initState();
    isFlipped = false;
  }

  void flip() {
    if (widget.flippable) setState(() => isFlipped = !isFlipped);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildBoxDecoration(),
      child: SizedBox(
        width: widget.width,
        child: AspectRatio(
          aspectRatio: goldenRatio,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return GestureDetector(
                onTap: widget.flippable ? flip : null,
                child: widget.flippable
                    ? FlippableBox(
                        front: Container(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight,
                          child: _PaymentCardFront(
                            widget: widget,
                            softLight: widget.softLight,
                          ),
                        ),
                        back: Container(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight,
                          child: _PaymentCardBack(
                            widget: widget,
                            softLight: widget.softLight,
                          ),
                        ),
                        isFlipped: isFlipped,
                      )
                    : _PaymentCardFront(
                        widget: widget,
                        softLight: widget.softLight,
                      ),
              );
            },
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    final palette = EufemiaPalette.of(context);
    return BoxDecoration(
      boxShadow: widget.shadow
          ? [
              BoxShadow(
                color: palette.bright
                    ? Color.fromRGBO(51, 51, 51, 0.08).withOpacity(0.08)
                    : palette.white.withOpacity(0.1),
                blurRadius: 16.0,
                spreadRadius: 2.0,
              ),
            ]
          : null,
    );
  }

  /// The rendered height of the widget
  double get height => widget.width / goldenRatio;
}

/// The back of a [PaymentCard].
class _PaymentCardBack extends StatelessWidget {
  const _PaymentCardBack({
    Key key,
    @required this.widget,
    @required this.softLight,
  }) : super(key: key);

  /// The [PaymentCard] to add a backside to.
  final PaymentCard widget;

  /// If the back should be lit by a white, soft light.
  final bool softLight;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          getCardBase(widget.design, softLight),
          buildMagneticStripe(),
          buildBackContent(context, widget.backContent, constraints),
        ],
      );
    });
  }

  Widget buildBackContent(
    BuildContext context,
    PaymentCardBackContent content,
    BoxConstraints constraints,
  ) {
    final typography = EufemiaTypography.of(context);

    return AnimatedDefaultTextStyle(
      duration: Duration(milliseconds: 160),
      style: TextStyle(
        color: getTextColor(widget.design),
      ),
      child: Align(
        alignment: Alignment(-0.75, 0.25),
        child: EufemiaColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spaceBetween: EufemiaSpace.small,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(2.5),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 1, left: 1, right: 1),
                    width: constraints.maxWidth / 1.4,
                    height: constraints.maxHeight / 6,
                    color: Colors.grey[200],
                  ),
                  EufemiaPadding(
                    padding: EufemiaInsets.small(EufemiaSides.left),
                    child: Text(
                      content?.cardholder ?? 'Ola Nordmann',
                      style: TextStyle(
                        height: 1,
                        color: EufemiaColors.coal,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            EufemiaRow(
              mainAxisSize: MainAxisSize.min,
              spaceBetween: EufemiaSpace.medium,
              children: [
                EufemiaColumn(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kontonavn',
                      style: typography.styles.body
                          .copyWith(color: getTextColor(widget.design))
                          .toTextStyle(context),
                    ),
                    Text(content?.accountName ?? 'Brukskonto'),
                  ],
                ),
                EufemiaColumn(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kontonr.',
                      style: typography.styles.body
                          .copyWith(color: getTextColor(widget.design))
                          .toTextStyle(context),
                    ),
                    Text(content?.accountNumber ?? '1214 49 49534'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Align buildMagneticStripe() {
    return Align(
      alignment: Alignment.topCenter,
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          margin: const EdgeInsets.only(top: 16.0),
          height: constraints.maxHeight / 5,
          decoration: BoxDecoration(
            color: Colors.black,
            gradient: getMagnetStripeGradient(widget.design),
          ),
        );
      }),
    );
  }

  Align buildBackSupportDetails(BuildContext context) {
    final typography = EufemiaTypography.of(context);
    return Align(
      alignment: Alignment.topCenter,
      child: EufemiaPadding(
        padding: EufemiaInsets.small(EufemiaSides.horizontal),
        child: EufemiaPadding(
          padding: EufemiaInsets.extraSmall(EufemiaSides.vertical),
          child: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 160),
            style: typography.styles.subhead.toTextStyle(context).copyWith(
                  color: getTextColor(widget.design),
                  fontSize: 8.0,
                  fontWeight: FontWeight.w300,
                ),
            child: EufemiaRow(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('DNB Kundeservice +47 915 04800'),
                const Text('www.dnb.no'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// The front for a [PaymentCard] widget.
class _PaymentCardFront extends StatelessWidget {
  const _PaymentCardFront({
    Key key,
    @required this.widget,
    @required this.softLight,
  }) : super(key: key);

  /// The [PaymentCard] to add a front to.
  final PaymentCard widget;

  /// If the front should be lit by a soft white light.
  final bool softLight;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          getCardBase(widget.design, softLight),
          if (widget.frontContent.logo != null) ...{
            _PaymentCardLogo(
              alignment: widget.frontContent.logoAlignment,
              logo: widget.frontContent.logo,
              color: widget.frontContent.logoColor,
            ),
          },
          if (widget.frontContent.program != null) ...{
            _PaymentCardProgram(
              program: widget.frontContent.program,
            ),
          },
          if (widget.frontContent.type != null) ...{
            _PaymentCardType(
              type: widget.frontContent.type,
            ),
          },
          _PaymentCardDigits(
            design: widget.design,
            digitsText: widget.frontContent.digitsText,
            digits: widget.frontContent.digits,
          ),
        ],
      ),
    );
  }
}

/// The masked digits for a [PaymentCard] widget.
class _PaymentCardDigits extends StatelessWidget {
  const _PaymentCardDigits({
    Key key,
    @required this.design,
    this.digitsText,
    this.digits,
  }) : super(key: key);

  /// The design to use for displaying the digits.
  final CardDesign design;

  /// The text displayed over the digits.
  final String digitsText;

  /// The last 4 digits (masked PAN).
  final int digits;

  Brightness get _cardBrightness =>
      (design == CardDesign.white || design == CardDesign.grey)
          ? Brightness.light
          : Brightness.dark;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.only(
              left: constraints.maxWidth * 0.07,
              bottom: constraints.maxWidth * 0.07,
            ),
            child: AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 250),
              style: TextStyle(
                color: _cardBrightness == Brightness.dark
                    ? Colors.white
                    : EufemiaColors.coal,
              ),
              child: EufemiaColumn(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Opacity(
                    opacity: 0.5,
                    child: Text(
                      digitsText ?? '',
                      style:
                          TextStyle(fontSize: constraints.maxWidth * 0.02332),
                    ),
                  ),
                  EufemiaPadding(
                    padding: EufemiaInsets.extraSmall(EufemiaSides.top),
                    child: Text(
                      '**** $digits',
                      style: TextStyle(fontSize: constraints.maxWidth * 0.0583),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// The card type for a [PaymentCard] widget.
class _PaymentCardType extends StatelessWidget {
  const _PaymentCardType({
    Key key,
    @required this.type,
  }) : super(key: key);

  /// The type to display an illustration for.
  final CardType type;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: LayoutBuilder(
        builder: (context, snapshot) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: EdgeInsets.only(
                  right: constraints.maxWidth * 0.07,
                  bottom: constraints.maxWidth * 0.07,
                ),
                child: SvgPicture.asset(
                  getCardTypeAsset(type),
                  width: constraints.maxWidth / 5.5,
                  package: 'eufemia',
                ),
              );
            },
          );
        },
      ),
    );
  }

  String getCardTypeAsset(CardType type) {
    switch (type) {
      case CardType.masterCard:
        return '$_typeBase/mastercard.svg';
      case CardType.masterCardSilver:
        return '$_typeBase/mastercard_metallic.svg';
      case CardType.visaDebit:
        return '$_typeBase/visa.svg';
      case CardType.visaDebitSilver:
        return '$_typeBase/visa_metallic.svg';
      case CardType.visaDebitWhite:
        return '$_typeBase/visa_white.svg';
      default:
        return '$_typeBase/visa.svg';
    }
  }
}

/// The program logo/illustration for a [PaymentCard] widget
class _PaymentCardProgram extends StatelessWidget {
  const _PaymentCardProgram({
    Key key,
    @required this.program,
  }) : super(key: key);

  /// The program to display the illustration for.
  final CardProgram program;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.only(
              right: constraints.maxWidth * 0.07,
              top: constraints.maxWidth * 0.07,
            ),
            child: SvgPicture.asset(
              getCardProgramAsset(program),
              width: constraints.maxWidth / 5,
              package: 'eufemia',
            ),
          );
        },
      ),
    );
  }

  String getCardProgramAsset(CardProgram program) {
    switch (program) {
      case CardProgram.privateBanking:
        return '$_programBase/private_banking.svg';
      case CardProgram.privateBankingVisaPlatinum:
        return '$_programBase/private_banking_visa_platinum.svg';
      case CardProgram.sagaGold:
        return '$_programBase/saga_gold.svg';
      case CardProgram.sagaPlatinum:
        return '$_programBase/saga_platinum.svg';
      case CardProgram.sagaVisaPlatinum:
        return '$_programBase/saga_visa_platinum.svg';
      default:
        return '$_programBase/private_banking.svg';
    }
  }
}

/// A card issuer logo for a [PaymentCard] widget.
class _PaymentCardLogo extends StatelessWidget {
  const _PaymentCardLogo({
    Key key,
    @required this.logo,
    @required this.color,
    this.alignment = Alignment.topLeft,
  }) : super(key: key);

  /// The logo to display.
  final CardLogo logo;

  /// The color of the logo.
  final Color color;

  /// The alignment of the logo on the card.
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: alignment == Alignment.topLeft
                ? EdgeInsets.only(
                    left: constraints.maxWidth * 0.07,
                    top: constraints.maxWidth * 0.07,
                  )
                : EdgeInsets.only(
                    right: constraints.maxWidth * 0.07,
                    top: constraints.maxWidth * 0.07,
                  ),
            child: SvgPicture.asset(
              getCardLogoAsset(logo),
              width: constraints.maxWidth / 7.5,
              color: logo == CardLogo.matte ? color : null,
              package: 'eufemia',
            ),
          );
        },
      ),
    );
  }

  String getCardLogoAsset(CardLogo logo) {
    switch (logo) {
      case CardLogo.metallic:
        return '$_logoBase/dnb_metallic.svg';
      case CardLogo.matte:
        return '$_logoBase/dnb.svg';
      default:
        return '$_logoBase/dnb.svg';
    }
  }
}

Color getTextColor(CardDesign design) {
  switch (design) {
    case CardDesign.matteBlack:
    case CardDesign.black:
    case CardDesign.green:
      return Colors.white;
    case CardDesign.saga:
      return EufemiaColors.saga;
    default:
      return EufemiaColors.coal;
  }
}

CardBase getCardBase(CardDesign design, bool softLight) {
  switch (design) {
    case CardDesign.black:
      return CardBase(
        startColor: Colors.black,
        endColor: Colors.black,
        softLight: softLight,
      );
    case CardDesign.white:
      return CardBase(
        startColor: Color(0xFFFAFAFA),
        endColor: Colors.white,
        stops: [0.0463, 0.9204],
        softLight: softLight,
      );
    case CardDesign.grey:
      return CardBase(
        startColor: Color(0xFFCCCCCC),
        endColor: Color(0xFFE8E8E8),
        softLight: softLight,
      );
    case CardDesign.gold:
      return CardBase(
        startColor: Color(0xFFBFA970),
        endColor: Color(0xFFD3BD83),
        stops: [0.0463, 0.8457],
        softLight: softLight,
      );
    case CardDesign.saga:
      return CardBase(
        startColor: Color(0xFF241E23),
        endColor: Color(0xFF251D23),
        stops: [0.0631, 0.852],
        softLight: softLight,
      );
    case CardDesign.brightGreen:
      return CardBase(
        startColor: Color(0xFF2CC48E),
        endColor: Color(0xFF28B482),
        stops: [0.0631, 0.8266],
        softLight: softLight,
      );
    case CardDesign.brightBlue:
      return CardBase(
        startColor: Color(0xFF50C9DE),
        endColor: Color(0xFF4BBED2),
        stops: [0.0631, 0.8266],
        softLight: softLight,
      );
    case CardDesign.matteBlack:
      return CardBase(
        startColor: Color(0xFF393939),
        endColor: Color(0xFF252525),
        stops: [0.1979, 0.9268],
        softLight: softLight,
      );
    default:
      return CardBase(
        startColor: Color(0xFF008484),
        endColor: Color(0xFF007272),
        softLight: softLight,
      );
  }
}

Gradient getMagnetStripeGradient(CardDesign design) {
  switch (design) {
    case CardDesign.black:
    case CardDesign.matteBlack:
    case CardDesign.green:
    case CardDesign.brightGreen:
    case CardDesign.brightBlue:
    case CardDesign.grey:
      return RadialGradient(
        colors: [
          Colors.grey[400],
          Colors.grey[300],
        ],
        radius: 5.0,
        center: Alignment.centerRight,
      );
    case CardDesign.gold:
      return RadialGradient(
        colors: [
          Color.fromRGBO(181, 156, 79, 1),
          Color.fromRGBO(171, 141, 79, 1),
        ],
        radius: 7.5,
        center: Alignment.centerRight,
      );
    case CardDesign.saga:
      return RadialGradient(
        colors: [
          Color.fromRGBO(217, 177, 121, 1),
          Color.fromRGBO(154, 113, 65, 1),
        ],
        radius: 7.5,
        center: Alignment.centerRight,
      );
    default:
      return RadialGradient(
        colors: [
          Color(0xFF333333),
          Colors.black,
        ],
        radius: 5.0,
        center: Alignment.centerRight,
      );
  }
}

class EufemiaSides {
  final bool hasTop;
  final bool hasBottom;
  final bool hasLeft;
  final bool hasRight;

  static const EufemiaSides all = EufemiaSides(
    hasLeft: true,
    hasRight: true,
    hasTop: true,
    hasBottom: true,
  );

  static const EufemiaSides top = EufemiaSides(
    hasTop: true,
  );
  static const EufemiaSides bottom = EufemiaSides(
    hasBottom: true,
  );
  static const EufemiaSides right = EufemiaSides(
    hasRight: true,
  );
  static const EufemiaSides left = EufemiaSides(
    hasLeft: true,
  );

  static const EufemiaSides notRight = EufemiaSides(
    hasTop: true,
    hasBottom: true,
    hasLeft: true,
  );
  static const EufemiaSides notTop = EufemiaSides(
    hasRight: true,
    hasBottom: true,
    hasLeft: true,
  );

  static const EufemiaSides notLeft = EufemiaSides(
    hasRight: true,
    hasBottom: true,
    hasTop: true,
  );
  static const EufemiaSides notBottom = EufemiaSides(
    hasRight: true,
    hasLeft: true,
    hasTop: true,
  );

  static const EufemiaSides vertical = EufemiaSides(
    hasTop: true,
    hasBottom: true,
  );
  static const EufemiaSides horizontal = EufemiaSides(
    hasLeft: true,
    hasRight: true,
  );

  // Adds the sides
  EufemiaSides operator &(EufemiaSides other) {
    return this + other;
  }

  // Adds the values of both sides
  EufemiaSides operator +(EufemiaSides other) {
    if (other is EufemiaSides) {
      return EufemiaSides(
        hasBottom: hasBottom || other.hasBottom,
        hasRight: hasRight || other.hasRight,
        hasLeft: hasLeft || other.hasLeft,
        hasTop: hasTop || other.hasTop,
      );
    }

    return this;
  }

  EufemiaSides operator -(EufemiaSides other) {
    if (other is EufemiaSides) {
      return EufemiaSides(
        hasBottom: hasBottom && !other.hasBottom,
        hasRight: hasRight && !other.hasRight,
        hasLeft: hasLeft && !other.hasLeft,
        hasTop: hasTop && !other.hasTop,
      );
    }

    return this;
  }

  const EufemiaSides({
    this.hasTop = false,
    this.hasBottom = false,
    this.hasLeft = false,
    this.hasRight = false,
  })  : assert(hasTop != null),
        assert(hasBottom != null),
        assert(hasLeft != null),
        assert(hasRight != null);
}

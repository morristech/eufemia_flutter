enum IconSize { small, medium, large }

double getIconSize(IconSize size) {
  switch (size) {
    case IconSize.small:
      return small;
    case IconSize.medium:
      return medium;
    case IconSize.large:
      return large;
  }
  // Never reaches this stage
  return null;
}

const small = 16.0;
const medium = 24.0;
const large = 32.0;

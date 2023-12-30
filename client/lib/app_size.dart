enum AppSize { large, medium, small }

AppSize appSize(double width) {
  if (width > 1000) {
    return AppSize.large;
  } else if (width > 600) {
    return AppSize.medium;
  }
  return AppSize.small;
}

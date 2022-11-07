import 'package:getwidget/getwidget.dart';
import 'package:trifs_app/utils/constants/colors.dart';

class AppLoader {
  static imageLoader() {
    return GFLoader(
      type: GFLoaderType.circle,
      loaderColorOne: AppColors.primaryColor,
      loaderColorTwo: AppColors.primaryColor,
      loaderColorThree: AppColors.primaryColor,
      size: 20,
    );
  }
}

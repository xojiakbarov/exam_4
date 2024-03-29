import 'package:flutter/cupertino.dart';
import 'package:med_g/assets/colors.dart';
import 'package:med_g/assets/fonts.dart';
import 'package:med_g/assets/icons.dart';
import 'package:med_g/assets/images.dart';
import 'package:med_g/assets/theme.dart';
import 'package:med_g/features/calendar/data/models/model.dart';
import 'package:med_g/features/calendar/domain/entities/entities.dart';


extension BuildContextGeneral on BuildContext {
  AppColors get colors {
    return AppColors();
  }

  AppTheme get theme {
    return AppTheme();
  }

  AppFonts get style {
    return theme.darkTheme().extension<AppFonts>()!;
  }


  AppIcons get icons {
    return AppIcons();
  }

  AppImages get images {
    return AppImages();
  }
}

extension CalendarToCalendarEntities on CalendarModel {
  CalendarEntities get toEntities {
    return CalendarEntities(
      description: description ?? '',
      title: title,
      icon: icon,
      startTime: startTime,
      endTime: endTime,
    );
  }
}

// extension NotificationToNotificationEntites on MockDataNotificationsModel {
//   NotificationEntities get toEntitiesNotification {
//     return NotificationEntities(
//       dateTime: dateTime,
//       title: title,
//       subTitle: subTitle,
//     );
//   }
// }



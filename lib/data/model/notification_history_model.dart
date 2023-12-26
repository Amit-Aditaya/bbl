// To parse this JSON data, do
//
//     final notificationHistoryModel = notificationHistoryModelFromJson(jsonString);

import 'dart:convert';

NotificationHistoryModel notificationHistoryModelFromJson(String str) =>
    NotificationHistoryModel.fromJson(json.decode(str));

String notificationHistoryModelToJson(NotificationHistoryModel data) =>
    json.encode(data.toJson());

class NotificationHistoryModel {
  NotificationHistoryModel({
    required this.totalCount,
    required this.offset,
    required this.limit,
    required this.notifications,
  });

  int totalCount;
  int offset;
  int limit;
  List<Notification> notifications;

  factory NotificationHistoryModel.fromJson(Map<String, dynamic> json) =>
      NotificationHistoryModel(
        totalCount: json["total_count"],
        offset: json["offset"],
        limit: json["limit"],
        notifications: List<Notification>.from(
            json["notifications"].map((x) => Notification.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "offset": offset,
        "limit": limit,
        "notifications":
            List<dynamic>.from(notifications.map((x) => x.toJson())),
      };
}

class Notification {
  Notification({
    this.admBigPicture,
    this.admGroup,
    this.admGroupMessage,
    this.admLargeIcon,
    this.admSmallIcon,
    this.admSound,
    this.spokenText,
    this.alexaSsml,
    this.alexaDisplayTitle,
    this.amazonBackgroundData,
    this.androidAccentColor,
    this.androidGroup,
    this.androidGroupMessage,
    this.androidLedColor,
    required this.androidSound,
    required this.androidVisibility,
    required this.appId,
    this.bigPicture,
    required this.buttons,
    required this.canceled,
    this.chromeBigPicture,
    this.chromeIcon,
    this.chromeWebIcon,
    this.chromeWebImage,
    this.chromeWebBadge,
    this.contentAvailable,
    required this.contents,
    required this.converted,
    required this.data,
    this.delayedOption,
    this.deliveryTimeOfDay,
    required this.errored,
    required this.excludedSegments,
    required this.failed,
    this.firefoxIcon,
    required this.globalImage,
    required this.headings,
    required this.id,
    this.includePlayerIds,
    this.includeExternalUserIds,
    required this.includedSegments,
    this.threadId,
    this.iosBadgeCount,
    this.iosBadgeType,
    this.iosCategory,
    this.iosInterruptionLevel,
    this.iosRelevanceScore,
    this.iosSound,
    required this.apnsAlert,
    this.targetContentIdentifier,
    required this.isAdm,
    required this.isAndroid,
    required this.isChrome,
    required this.isChromeWeb,
    this.isAlexa,
    required this.isFirefox,
    required this.isIos,
    required this.isSafari,
    required this.isWp,
    required this.isWpWns,
    required this.isEdge,
    required this.isHuawei,
    required this.isSms,
    this.largeIcon,
    required this.priority,
    required this.queuedAt,
    required this.remaining,
    required this.sendAfter,
    required this.completedAt,
    this.smallIcon,
    required this.successful,
    this.received,
    this.tags,
    this.filters,
    this.templateId,
    required this.ttl,
    required this.url,
    this.webUrl,
    this.appUrl,
    this.webButtons,
    this.webPushTopic,
    this.wpSound,
    this.wpWnsSound,
    required this.platformDeliveryStats,
    this.iosAttachments,
    this.huaweiSound,
    this.huaweiLedColor,
    this.huaweiAccentColor,
    required this.huaweiVisibility,
    this.huaweiGroup,
    this.huaweiGroupMessage,
    this.huaweiChannelId,
    this.huaweiExistingChannelId,
    this.huaweiSmallIcon,
    this.huaweiLargeIcon,
    this.huaweiBigPicture,
    this.huaweiMsgType,
    this.throttleRatePerMinute,
    this.fcapGroupIds,
    this.fcapStatus,
    this.smsFrom,
    this.smsMediaUrls,
    required this.name,
    this.emailClickTrackingDisabled,
    required this.isEmail,
    this.emailSubject,
    this.emailFromName,
    this.emailFromAddress,
    this.emailPreheader,
  });

  dynamic admBigPicture;
  dynamic admGroup;
  dynamic admGroupMessage;
  dynamic admLargeIcon;
  dynamic admSmallIcon;
  dynamic admSound;
  dynamic spokenText;
  dynamic alexaSsml;
  dynamic alexaDisplayTitle;
  dynamic amazonBackgroundData;
  dynamic androidAccentColor;
  dynamic androidGroup;
  dynamic androidGroupMessage;
  dynamic androidLedColor;
  dynamic androidSound;
  dynamic androidVisibility;
  dynamic appId;
  dynamic bigPicture;
  dynamic buttons;
  bool canceled;
  dynamic chromeBigPicture;
  dynamic chromeIcon;
  dynamic chromeWebIcon;
  dynamic chromeWebImage;
  dynamic chromeWebBadge;
  dynamic contentAvailable;
  Contents contents;
  dynamic converted;
  dynamic data;
  dynamic delayedOption;
  dynamic deliveryTimeOfDay;
  dynamic errored;
  List<dynamic> excludedSegments;
  int failed;
  dynamic firefoxIcon;
  dynamic globalImage;
  Contents headings;
  String id;
  dynamic includePlayerIds;
  dynamic includeExternalUserIds;
  List<IncludedSegment> includedSegments;
  dynamic threadId;
  dynamic iosBadgeCount;
  dynamic iosBadgeType;
  dynamic iosCategory;
  dynamic iosInterruptionLevel;
  dynamic iosRelevanceScore;
  dynamic iosSound;
  ApnsAlert apnsAlert;
  dynamic targetContentIdentifier;
  bool isAdm;
  bool isAndroid;
  bool isChrome;
  bool isChromeWeb;
  dynamic isAlexa;
  bool isFirefox;
  bool isIos;
  bool isSafari;
  bool isWp;
  bool isWpWns;
  bool isEdge;
  bool isHuawei;
  bool isSms;
  dynamic largeIcon;
  int priority;
  int queuedAt;
  int remaining;
  int sendAfter;
  dynamic completedAt;
  dynamic smallIcon;
  int successful;
  dynamic received;
  dynamic tags;
  dynamic filters;
  dynamic templateId;
  dynamic ttl;
  dynamic url;
  dynamic webUrl;
  dynamic appUrl;
  dynamic webButtons;
  dynamic webPushTopic;
  dynamic wpSound;
  dynamic wpWnsSound;
  dynamic platformDeliveryStats;
  dynamic iosAttachments;
  dynamic huaweiSound;
  dynamic huaweiLedColor;
  dynamic huaweiAccentColor;
  String huaweiVisibility;
  dynamic huaweiGroup;
  dynamic huaweiGroupMessage;
  dynamic huaweiChannelId;
  dynamic huaweiExistingChannelId;
  dynamic huaweiSmallIcon;
  dynamic huaweiLargeIcon;
  dynamic huaweiBigPicture;
  dynamic huaweiMsgType;
  dynamic throttleRatePerMinute;
  dynamic fcapGroupIds;
  dynamic fcapStatus;
  dynamic smsFrom;
  dynamic smsMediaUrls;
  dynamic name;
  dynamic emailClickTrackingDisabled;
  dynamic isEmail;
  dynamic emailSubject;
  dynamic emailFromName;
  dynamic emailFromAddress;
  dynamic emailPreheader;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        admBigPicture: json["adm_big_picture"],
        admGroup: json["adm_group"],
        admGroupMessage: json["adm_group_message"],
        admLargeIcon: json["adm_large_icon"],
        admSmallIcon: json["adm_small_icon"],
        admSound: json["adm_sound"],
        spokenText: json["spoken_text"],
        alexaSsml: json["alexa_ssml"],
        alexaDisplayTitle: json["alexa_display_title"],
        amazonBackgroundData: json["amazon_background_data"],
        androidAccentColor: json["android_accent_color"],
        androidGroup: json["android_group"],
        androidGroupMessage: json["android_group_message"],
        androidLedColor: json["android_led_color"],
        androidSound:
            json["android_sound"] == null ? null : json["android_sound"],
        androidVisibility: json["android_visibility"],
        appId: json["app_id"],
        bigPicture: json["big_picture"],
        buttons: json["buttons"] == null ? null : json["buttons"],
        canceled: json["canceled"],
        chromeBigPicture: json["chrome_big_picture"],
        chromeIcon: json["chrome_icon"],
        chromeWebIcon: json["chrome_web_icon"],
        chromeWebImage: json["chrome_web_image"],
        chromeWebBadge: json["chrome_web_badge"],
        contentAvailable: json["content_available"],
        contents: Contents.fromJson(json["contents"]),
        converted: json["converted"],
        data: json["data"] == null ? null : ApnsAlert.fromJson(json["data"]),
        delayedOption: json["delayed_option"],
        deliveryTimeOfDay: json["delivery_time_of_day"],
        errored: json["errored"],
        excludedSegments:
            List<dynamic>.from(json["excluded_segments"].map((x) => x)),
        failed: json["failed"],
        firefoxIcon: json["firefox_icon"],
        globalImage: json["global_image"] == null ? null : json["global_image"],
        headings: Contents.fromJson(json["headings"]),
        id: json["id"],
        includePlayerIds: json["include_player_ids"],
        includeExternalUserIds: json["include_external_user_ids"],
        includedSegments: List<IncludedSegment>.from(
            json["included_segments"].map((x) => includedSegmentValues.map[x])),
        threadId: json["thread_id"],
        iosBadgeCount: json["ios_badgeCount"],
        iosBadgeType: json["ios_badgeType"],
        iosCategory: json["ios_category"],
        iosInterruptionLevel: json["ios_interruption_level"],
        iosRelevanceScore: json["ios_relevance_score"],
        iosSound: json["ios_sound"],
        apnsAlert: ApnsAlert.fromJson(json["apns_alert"]),
        targetContentIdentifier: json["target_content_identifier"],
        isAdm: json["isAdm"],
        isAndroid: json["isAndroid"],
        isChrome: json["isChrome"],
        isChromeWeb: json["isChromeWeb"],
        isAlexa: json["isAlexa"],
        isFirefox: json["isFirefox"],
        isIos: json["isIos"],
        isSafari: json["isSafari"],
        isWp: json["isWP"],
        isWpWns: json["isWP_WNS"],
        isEdge: json["isEdge"],
        isHuawei: json["isHuawei"],
        isSms: json["isSMS"],
        largeIcon: json["large_icon"],
        priority: json["priority"],
        queuedAt: json["queued_at"],
        remaining: json["remaining"],
        sendAfter: json["send_after"],
        completedAt: json["completed_at"] == null ? null : json["completed_at"],
        smallIcon: json["small_icon"],
        successful: json["successful"],
        received: json["received"],
        tags: json["tags"],
        filters: json["filters"],
        templateId: json["template_id"],
        ttl: json["ttl"],
        url: json["url"] == null ? null : json["url"],
        webUrl: json["web_url"],
        appUrl: json["app_url"],
        webButtons: json["web_buttons"],
        webPushTopic: json["web_push_topic"],
        wpSound: json["wp_sound"],
        wpWnsSound: json["wp_wns_sound"],
        platformDeliveryStats:
            PlatformDeliveryStats.fromJson(json["platform_delivery_stats"]),
        iosAttachments: json["ios_attachments"],
        huaweiSound: json["huawei_sound"],
        huaweiLedColor: json["huawei_led_color"],
        huaweiAccentColor: json["huawei_accent_color"],
        huaweiVisibility: json["huawei_visibility"],
        huaweiGroup: json["huawei_group"],
        huaweiGroupMessage: json["huawei_group_message"],
        huaweiChannelId: json["huawei_channel_id"],
        huaweiExistingChannelId: json["huawei_existing_channel_id"],
        huaweiSmallIcon: json["huawei_small_icon"],
        huaweiLargeIcon: json["huawei_large_icon"],
        huaweiBigPicture: json["huawei_big_picture"],
        huaweiMsgType: json["huawei_msg_type"],
        throttleRatePerMinute: json["throttle_rate_per_minute"],
        fcapGroupIds: json["fcap_group_ids"],
        fcapStatus: fcapStatusValues.map[json["fcap_status"]],
        smsFrom: json["sms_from"],
        smsMediaUrls: json["sms_media_urls"],
        name: json["name"] == null ? null : json["name"],
        emailClickTrackingDisabled: json["email_click_tracking_disabled"],
        isEmail: json["isEmail"],
        emailSubject: json["email_subject"],
        emailFromName: json["email_from_name"],
        emailFromAddress: json["email_from_address"],
        emailPreheader: json["email_preheader"],
      );

  Map<String, dynamic> toJson() => {
        "adm_big_picture": admBigPicture,
        "adm_group": admGroup,
        "adm_group_message": admGroupMessage,
        "adm_large_icon": admLargeIcon,
        "adm_small_icon": admSmallIcon,
        "adm_sound": admSound,
        "spoken_text": spokenText,
        "alexa_ssml": alexaSsml,
        "alexa_display_title": alexaDisplayTitle,
        "amazon_background_data": amazonBackgroundData,
        "android_accent_color": androidAccentColor,
        "android_group": androidGroup,
        "android_group_message": androidGroupMessage,
        "android_led_color": androidLedColor,
        "android_sound": androidSound == null ? null : androidSound,
        "android_visibility": androidVisibility,
        "app_id": appId,
        "big_picture": bigPicture,
        "buttons": buttons == null ? null : buttons,
        "canceled": canceled,
        "chrome_big_picture": chromeBigPicture,
        "chrome_icon": chromeIcon,
        "chrome_web_icon": chromeWebIcon,
        "chrome_web_image": chromeWebImage,
        "chrome_web_badge": chromeWebBadge,
        "content_available": contentAvailable,
        "contents": contents.toJson(),
        "converted": converted,
        "data": data == null ? null : data.toJson(),
        "delayed_option": delayedOption,
        "delivery_time_of_day": deliveryTimeOfDay,
        "errored": errored,
        "excluded_segments": List<dynamic>.from(excludedSegments.map((x) => x)),
        "failed": failed,
        "firefox_icon": firefoxIcon,
        "global_image": globalImage == null ? null : globalImage,
        "headings": headings.toJson(),
        "id": id,
        "include_player_ids": includePlayerIds,
        "include_external_user_ids": includeExternalUserIds,
        "included_segments": List<dynamic>.from(
            includedSegments.map((x) => includedSegmentValues.reverse[x])),
        "thread_id": threadId,
        "ios_badgeCount": iosBadgeCount,
        "ios_badgeType": iosBadgeType,
        "ios_category": iosCategory,
        "ios_interruption_level": iosInterruptionLevel,
        "ios_relevance_score": iosRelevanceScore,
        "ios_sound": iosSound,
        "apns_alert": apnsAlert.toJson(),
        "target_content_identifier": targetContentIdentifier,
        "isAdm": isAdm,
        "isAndroid": isAndroid,
        "isChrome": isChrome,
        "isChromeWeb": isChromeWeb,
        "isAlexa": isAlexa,
        "isFirefox": isFirefox,
        "isIos": isIos,
        "isSafari": isSafari,
        "isWP": isWp,
        "isWP_WNS": isWpWns,
        "isEdge": isEdge,
        "isHuawei": isHuawei,
        "isSMS": isSms,
        "large_icon": largeIcon,
        "priority": priority,
        "queued_at": queuedAt,
        "remaining": remaining,
        "send_after": sendAfter,
        "completed_at": completedAt == null ? null : completedAt,
        "small_icon": smallIcon,
        "successful": successful,
        "received": received,
        "tags": tags,
        "filters": filters,
        "template_id": templateId,
        "ttl": ttl,
        "url": url == null ? null : url,
        "web_url": webUrl,
        "app_url": appUrl,
        "web_buttons": webButtons,
        "web_push_topic": webPushTopic,
        "wp_sound": wpSound,
        "wp_wns_sound": wpWnsSound,
        "platform_delivery_stats": platformDeliveryStats.toJson(),
        "ios_attachments": iosAttachments,
        "huawei_sound": huaweiSound,
        "huawei_led_color": huaweiLedColor,
        "huawei_accent_color": huaweiAccentColor,
        "huawei_visibility": huaweiVisibility,
        "huawei_group": huaweiGroup,
        "huawei_group_message": huaweiGroupMessage,
        "huawei_channel_id": huaweiChannelId,
        "huawei_existing_channel_id": huaweiExistingChannelId,
        "huawei_small_icon": huaweiSmallIcon,
        "huawei_large_icon": huaweiLargeIcon,
        "huawei_big_picture": huaweiBigPicture,
        "huawei_msg_type": huaweiMsgType,
        "throttle_rate_per_minute": throttleRatePerMinute,
        "fcap_group_ids": fcapGroupIds,
        "fcap_status": fcapStatusValues.reverse[fcapStatus],
        "sms_from": smsFrom,
        "sms_media_urls": smsMediaUrls,
        "name": name == null ? null : name,
        "email_click_tracking_disabled": emailClickTrackingDisabled,
        "isEmail": isEmail,
        "email_subject": emailSubject,
        "email_from_name": emailFromName,
        "email_from_address": emailFromAddress,
        "email_preheader": emailPreheader,
      };
}

class ApnsAlert {
  ApnsAlert();

  factory ApnsAlert.fromJson(Map<String, dynamic> json) => ApnsAlert();

  Map<String, dynamic> toJson() => {};
}

class Contents {
  Contents({
    required this.en,
  });

  String en;

  factory Contents.fromJson(Map<String, dynamic> json) => Contents(
        en: json["en"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "en": en == null ? null : en,
      };
}

enum FcapStatus { UNCAPPED }

final fcapStatusValues = EnumValues({"uncapped": FcapStatus.UNCAPPED});

enum IncludedSegment { SUBSCRIBED_USERS }

final includedSegmentValues =
    EnumValues({"Subscribed Users": IncludedSegment.SUBSCRIBED_USERS});

class PlatformDeliveryStats {
  PlatformDeliveryStats({
    required this.android,
  });

  Android? android;

  factory PlatformDeliveryStats.fromJson(Map<String, dynamic> json) =>
      PlatformDeliveryStats(
        android:
            json["android"] == null ? null : Android.fromJson(json["android"]),
      );

  Map<String, dynamic> toJson() => {
        "android": android == null ? null : android?.toJson(),
      };
}

class Android {
  Android({
    required this.successful,
    required this.failed,
    required this.errored,
    required this.converted,
    required this.received,
  });

  int successful;
  int failed;
  int errored;
  int converted;
  int received;

  factory Android.fromJson(Map<String, dynamic> json) => Android(
        successful: json["successful"],
        failed: json["failed"],
        errored: json["errored"],
        converted: json["converted"],
        received: json["received"],
      );

  Map<String, dynamic> toJson() => {
        "successful": successful,
        "failed": failed,
        "errored": errored,
        "converted": converted,
        "received": received,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

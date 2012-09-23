.class Lcom/android/server/NotificationManagerService$2;
.super Landroid/content/BroadcastReceiver;
.source "NotificationManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/NotificationManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/NotificationManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/NotificationManagerService;)V
    .registers 2
    .parameter

    .prologue
    .line 321
    iput-object p1, p0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 15
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 324
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 326
    .local v0, action:Ljava/lang/String;
    const/4 v6, 0x0

    .line 328
    .local v6, queryRestart:Z
    const-string v8, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2f

    const-string v8, "android.intent.action.PACKAGE_RESTARTED"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2f

    const-string v8, "android.intent.action.PACKAGE_CHANGED"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2f

    const-string v8, "android.intent.action.QUERY_PACKAGE_RESTART"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2f

    const-string v8, "android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_72

    .line 333
    :cond_2f
    const/4 v4, 0x0

    .line 334
    .local v4, pkgList:[Ljava/lang/String;
    const-string v8, "android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_55

    .line 335
    const-string v8, "android.intent.extra.changed_package_list"

    invoke-virtual {p2, v8}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 349
    :goto_3e
    if-eqz v4, :cond_64

    array-length v8, v4

    if-lez v8, :cond_64

    .line 350
    move-object v1, v4

    .local v1, arr$:[Ljava/lang/String;
    array-length v3, v1

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_46
    if-ge v2, v3, :cond_64

    aget-object v5, v1, v2

    .line 351
    .local v5, pkgName:Ljava/lang/String;
    iget-object v11, p0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    if-nez v6, :cond_70

    move v8, v9

    :goto_4f
    invoke-virtual {v11, v5, v10, v10, v8}, Lcom/android/server/NotificationManagerService;->cancelAllNotificationsInt(Ljava/lang/String;IIZ)Z

    .line 350
    add-int/lit8 v2, v2, 0x1

    goto :goto_46

    .line 336
    .end local v1           #arr$:[Ljava/lang/String;
    .end local v2           #i$:I
    .end local v3           #len$:I
    .end local v5           #pkgName:Ljava/lang/String;
    :cond_55
    if-eqz v6, :cond_5e

    .line 337
    const-string v8, "android.intent.extra.PACKAGES"

    invoke-virtual {p2, v8}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    goto :goto_3e

    .line 339
    :cond_5e
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v7

    .line 340
    .local v7, uri:Landroid/net/Uri;
    if-nez v7, :cond_65

    .line 368
    .end local v4           #pkgList:[Ljava/lang/String;
    .end local v7           #uri:Landroid/net/Uri;
    :cond_64
    :goto_64
    return-void

    .line 343
    .restart local v4       #pkgList:[Ljava/lang/String;
    .restart local v7       #uri:Landroid/net/Uri;
    :cond_65
    invoke-virtual {v7}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v5

    .line 344
    .restart local v5       #pkgName:Ljava/lang/String;
    if-eqz v5, :cond_64

    .line 347
    new-array v4, v9, [Ljava/lang/String;

    .end local v4           #pkgList:[Ljava/lang/String;
    aput-object v5, v4, v10

    .restart local v4       #pkgList:[Ljava/lang/String;
    goto :goto_3e

    .end local v7           #uri:Landroid/net/Uri;
    .restart local v1       #arr$:[Ljava/lang/String;
    .restart local v2       #i$:I
    .restart local v3       #len$:I
    :cond_70
    move v8, v10

    .line 351
    goto :goto_4f

    .line 354
    .end local v1           #arr$:[Ljava/lang/String;
    .end local v2           #i$:I
    .end local v3           #len$:I
    .end local v4           #pkgList:[Ljava/lang/String;
    .end local v5           #pkgName:Ljava/lang/String;
    :cond_72
    const-string v8, "android.intent.action.SCREEN_ON"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_80

    .line 357
    iget-object v8, p0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    #setter for: Lcom/android/server/NotificationManagerService;->mScreenOn:Z
    invoke-static {v8, v9}, Lcom/android/server/NotificationManagerService;->access$1102(Lcom/android/server/NotificationManagerService;Z)Z

    goto :goto_64

    .line 358
    :cond_80
    const-string v8, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_8e

    .line 359
    iget-object v8, p0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    #setter for: Lcom/android/server/NotificationManagerService;->mScreenOn:Z
    invoke-static {v8, v10}, Lcom/android/server/NotificationManagerService;->access$1102(Lcom/android/server/NotificationManagerService;Z)Z

    goto :goto_64

    .line 360
    :cond_8e
    const-string v8, "android.intent.action.PHONE_STATE"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_ad

    .line 361
    iget-object v8, p0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    const-string v9, "state"

    invoke-virtual {p2, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    sget-object v10, Landroid/telephony/TelephonyManager;->EXTRA_STATE_OFFHOOK:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    #setter for: Lcom/android/server/NotificationManagerService;->mInCall:Z
    invoke-static {v8, v9}, Lcom/android/server/NotificationManagerService;->access$1202(Lcom/android/server/NotificationManagerService;Z)Z

    .line 363
    iget-object v8, p0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    #calls: Lcom/android/server/NotificationManagerService;->updateNotificationPulse()V
    invoke-static {v8}, Lcom/android/server/NotificationManagerService;->access$1300(Lcom/android/server/NotificationManagerService;)V

    goto :goto_64

    .line 364
    :cond_ad
    const-string v8, "android.intent.action.USER_PRESENT"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_64

    .line 366
    iget-object v8, p0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    #getter for: Lcom/android/server/NotificationManagerService;->mNotificationLight:Lcom/android/server/LightsService$Light;
    invoke-static {v8}, Lcom/android/server/NotificationManagerService;->access$1400(Lcom/android/server/NotificationManagerService;)Lcom/android/server/LightsService$Light;

    move-result-object v8

    invoke-virtual {v8}, Lcom/android/server/LightsService$Light;->turnOff()V

    goto :goto_64
.end method

.class public Lcom/android/server/enterprise/ApnSettingsPolicy;
.super Landroid/app/enterprise/IApnSettingsPolicy$Stub;
.source "ApnSettingsPolicy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/enterprise/ApnSettingsPolicy$Carriers;
    }
.end annotation


# static fields
.field public static AUTH_TYPE_CHAP:I = 0x0

.field public static AUTH_TYPE_NONE:I = 0x0

.field private static AUTH_TYPE_NOTSET:I = 0x0

.field public static AUTH_TYPE_PAP:I = 0x0

.field public static AUTH_TYPE_PAP_OR_CHAP:I = 0x0

.field private static final TAG:Ljava/lang/String; = "ApnSettingsPolicyService"


# instance fields
.field private dunRequired:Z

.field private mContext:Landroid/content/Context;

.field private mEDM:Landroid/app/enterprise/EnterpriseDeviceManager;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 28
    const/4 v0, -0x1

    sput v0, Lcom/android/server/enterprise/ApnSettingsPolicy;->AUTH_TYPE_NOTSET:I

    .line 30
    const/4 v0, 0x0

    sput v0, Lcom/android/server/enterprise/ApnSettingsPolicy;->AUTH_TYPE_NONE:I

    .line 32
    const/4 v0, 0x1

    sput v0, Lcom/android/server/enterprise/ApnSettingsPolicy;->AUTH_TYPE_PAP:I

    .line 34
    const/4 v0, 0x2

    sput v0, Lcom/android/server/enterprise/ApnSettingsPolicy;->AUTH_TYPE_CHAP:I

    .line 36
    const/4 v0, 0x3

    sput v0, Lcom/android/server/enterprise/ApnSettingsPolicy;->AUTH_TYPE_PAP_OR_CHAP:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .parameter "ctx"

    .prologue
    .line 59
    invoke-direct {p0}, Landroid/app/enterprise/IApnSettingsPolicy$Stub;-><init>()V

    .line 26
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/enterprise/ApnSettingsPolicy;->dunRequired:Z

    .line 40
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/enterprise/ApnSettingsPolicy;->mEDM:Landroid/app/enterprise/EnterpriseDeviceManager;

    .line 60
    iput-object p1, p0, Lcom/android/server/enterprise/ApnSettingsPolicy;->mContext:Landroid/content/Context;

    .line 61
    return-void
.end method

.method private enforceApnPermission()I
    .registers 3

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getEDM()Landroid/app/enterprise/EnterpriseDeviceManager;

    move-result-object v0

    const-string v1, "android.permission.sec.MDM_APN"

    invoke-virtual {v0, v1}, Landroid/app/enterprise/EnterpriseDeviceManager;->enforceActiveAdminPermission(Ljava/lang/String;)V

    .line 56
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    return v0
.end method

.method private getApnListConditionStr()Ljava/lang/String;
    .registers 9

    .prologue
    const/4 v7, 0x3

    .line 396
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v4

    .line 397
    .local v4, telMan:Landroid/telephony/TelephonyManager;
    invoke-virtual {v4}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v5

    if-eqz v5, :cond_12

    invoke-virtual {v4}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_1b

    .line 399
    :cond_12
    const-string v5, "ApnSettingsPolicyService"

    const-string v6, "No SIM "

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 400
    const/4 v0, 0x0

    .line 419
    :cond_1a
    :goto_1a
    return-object v0

    .line 403
    :cond_1b
    const-string v5, "gsm.sim.operator.numeric"

    invoke-static {v5}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 406
    .local v3, numeric:Ljava/lang/String;
    const/4 v0, 0x0

    .line 408
    .local v0, APNLIST_SELECTION:Ljava/lang/String;
    if-eqz v3, :cond_1a

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x4

    if-le v5, v6, :cond_1a

    .line 410
    const/4 v5, 0x0

    invoke-virtual {v3, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 412
    .local v1, mcc:Ljava/lang/String;
    invoke-virtual {v3, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 413
    .local v2, mnc:Ljava/lang/String;
    if-eqz v1, :cond_1a

    if-eqz v2, :cond_1a

    .line 414
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mcc = \""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " AND "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "mnc"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1a
.end method

.method private getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;
    .registers 6
    .parameter "ColumnName"
    .parameter "cursor"

    .prologue
    .line 554
    const-string v1, ""

    .line 556
    .local v1, value:Ljava/lang/String;
    :try_start_2
    invoke-interface {p2, p1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p2, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 557
    if-nez v1, :cond_e

    .line 558
    const-string v1, ""
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_e} :catch_f

    .line 565
    :cond_e
    :goto_e
    return-object v1

    .line 560
    :catch_f
    move-exception v0

    .line 561
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_e
.end method

.method private getEDM()Landroid/app/enterprise/EnterpriseDeviceManager;
    .registers 3

    .prologue
    .line 43
    iget-object v0, p0, Lcom/android/server/enterprise/ApnSettingsPolicy;->mEDM:Landroid/app/enterprise/EnterpriseDeviceManager;

    if-nez v0, :cond_10

    .line 44
    iget-object v0, p0, Lcom/android/server/enterprise/ApnSettingsPolicy;->mContext:Landroid/content/Context;

    const-string v1, "enterprise_policy"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/enterprise/EnterpriseDeviceManager;

    iput-object v0, p0, Lcom/android/server/enterprise/ApnSettingsPolicy;->mEDM:Landroid/app/enterprise/EnterpriseDeviceManager;

    .line 47
    :cond_10
    iget-object v0, p0, Lcom/android/server/enterprise/ApnSettingsPolicy;->mEDM:Landroid/app/enterprise/EnterpriseDeviceManager;

    return-object v0
.end method

.method private isValidApnId(J)Z
    .registers 14
    .parameter "apId"

    .prologue
    const/4 v10, 0x1

    const/4 v5, 0x2

    .line 358
    const/4 v8, 0x0

    .line 359
    .local v8, isValid:Z
    const/4 v6, 0x0

    .line 361
    .local v6, c:Landroid/database/Cursor;
    const-wide/16 v3, 0x0

    cmp-long v0, v3, p1

    if-gez v0, :cond_a2

    .line 362
    const/4 v0, 0x3

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "_id"

    aput-object v3, v2, v0

    const-string v0, "numeric"

    aput-object v0, v2, v10

    const-string v0, "type"

    aput-object v0, v2, v5

    .line 366
    .local v2, ID_PROJECTION:[Ljava/lang/String;
    :try_start_1a
    const-string v0, "gsm.sim.operator.numeric"

    const-string v3, ""

    invoke-static {v0, v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 368
    .local v9, numeric:Ljava/lang/String;
    sget-object v0, Lcom/android/server/enterprise/ApnSettingsPolicy$Carriers;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v0, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    .line 369
    .local v1, url:Landroid/net/Uri;
    iget-object v0, p0, Lcom/android/server/enterprise/ApnSettingsPolicy;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 370
    const-string v0, "ApnSettingsPolicyService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isValidApnId() row count : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " for apId : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 371
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v8

    .line 372
    if-eqz v8, :cond_8e

    .line 373
    const/4 v0, 0x1

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8d

    const/4 v0, 0x2

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_8d

    const/4 v0, 0x2

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    const-string v3, "dun"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8d

    const/4 v0, 0x2

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    const-string v3, "mms"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_8a
    .catchall {:try_start_1a .. :try_end_8a} :catchall_9b
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_8a} :catch_94

    move-result v0

    if-eqz v0, :cond_8e

    .line 379
    :cond_8d
    const/4 v8, 0x0

    .line 385
    :cond_8e
    if-eqz v6, :cond_93

    .line 386
    .end local v1           #url:Landroid/net/Uri;
    .end local v9           #numeric:Ljava/lang/String;
    :goto_90
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 390
    .end local v2           #ID_PROJECTION:[Ljava/lang/String;
    :cond_93
    :goto_93
    return v8

    .line 382
    .restart local v2       #ID_PROJECTION:[Ljava/lang/String;
    :catch_94
    move-exception v7

    .line 383
    .local v7, e:Ljava/lang/Exception;
    :try_start_95
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_98
    .catchall {:try_start_95 .. :try_end_98} :catchall_9b

    .line 385
    if-eqz v6, :cond_93

    goto :goto_90

    .end local v7           #e:Ljava/lang/Exception;
    :catchall_9b
    move-exception v0

    if-eqz v6, :cond_a1

    .line 386
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 385
    :cond_a1
    throw v0

    .line 389
    .end local v2           #ID_PROJECTION:[Ljava/lang/String;
    :cond_a2
    const-string v0, "ApnSettingsPolicyService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isValidApnId() : invalid apId : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_93
.end method

.method private setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .parameter "isNewAp"
    .parameter "values"
    .parameter "key"
    .parameter "value"

    .prologue
    .line 575
    if-eqz p1, :cond_31

    .line 576
    if-nez p4, :cond_2c

    const-string v0, ""

    :goto_6
    invoke-virtual {p2, p3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 582
    :cond_9
    :goto_9
    const-string v0, "ApnSettingsPolicyService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setColumnValue: key="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " value="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 583
    return-void

    .line 576
    :cond_2c
    invoke-virtual {p4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    .line 579
    :cond_31
    if-eqz p4, :cond_9

    .line 580
    invoke-virtual {p4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, p3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_9
.end method

.method private udpateApnType(Landroid/app/enterprise/ApnSettings;)V
    .registers 10
    .parameter "apn"

    .prologue
    const/4 v3, 0x0

    .line 72
    const/4 v2, 0x0

    .line 73
    .local v2, status:Z
    const/4 v1, 0x0

    .line 74
    .local v1, isNew:Z
    invoke-direct {p0}, Lcom/android/server/enterprise/ApnSettingsPolicy;->enforceApnPermission()I

    .line 75
    invoke-virtual {p1}, Landroid/app/enterprise/ApnSettings;->getId()J

    move-result-wide v4

    const-wide/16 v6, -0x1

    cmp-long v4, v4, v6

    if-nez v4, :cond_11

    .line 76
    const/4 v1, 0x1

    .line 79
    :cond_11
    iget-object v4, p0, Lcom/android/server/enterprise/ApnSettingsPolicy;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "tether_dun_required"

    invoke-static {v4, v5, v3}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    if-nez v4, :cond_39

    :goto_1f
    iput-boolean v3, p0, Lcom/android/server/enterprise/ApnSettingsPolicy;->dunRequired:Z

    .line 81
    invoke-virtual {p1}, Landroid/app/enterprise/ApnSettings;->getType()Ljava/lang/String;

    move-result-object v0

    .line 82
    .local v0, apnType:Ljava/lang/String;
    iget-boolean v3, p0, Lcom/android/server/enterprise/ApnSettingsPolicy;->dunRequired:Z

    if-eqz v3, :cond_c0

    .line 83
    if-eqz v0, :cond_b9

    .line 84
    const-string v3, "*"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3b

    .line 85
    const-string v3, "default,supl,mms,dun"

    invoke-virtual {p1, v3}, Landroid/app/enterprise/ApnSettings;->setType(Ljava/lang/String;)V

    .line 132
    :goto_38
    return-void

    .line 79
    .end local v0           #apnType:Ljava/lang/String;
    :cond_39
    const/4 v3, 0x1

    goto :goto_1f

    .line 86
    .restart local v0       #apnType:Ljava/lang/String;
    :cond_3b
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    const-string v4, "default"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_8f

    .line 87
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    const-string v4, "mms"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_65

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    const-string v4, "dun"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_65

    .line 89
    const-string v3, "default,supl,mms,dun"

    invoke-virtual {p1, v3}, Landroid/app/enterprise/ApnSettings;->setType(Ljava/lang/String;)V

    goto :goto_38

    .line 90
    :cond_65
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    const-string v4, "mms"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_77

    .line 91
    const-string v3, "default,supl,mms"

    invoke-virtual {p1, v3}, Landroid/app/enterprise/ApnSettings;->setType(Ljava/lang/String;)V

    goto :goto_38

    .line 92
    :cond_77
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    const-string v4, "dun"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_89

    .line 93
    const-string v3, "default,supl,dun"

    invoke-virtual {p1, v3}, Landroid/app/enterprise/ApnSettings;->setType(Ljava/lang/String;)V

    goto :goto_38

    .line 95
    :cond_89
    const-string v3, "default,supl"

    invoke-virtual {p1, v3}, Landroid/app/enterprise/ApnSettings;->setType(Ljava/lang/String;)V

    goto :goto_38

    .line 97
    :cond_8f
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    const-string v4, "dun"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_a1

    .line 99
    const-string v3, "dun"

    invoke-virtual {p1, v3}, Landroid/app/enterprise/ApnSettings;->setType(Ljava/lang/String;)V

    goto :goto_38

    .line 100
    :cond_a1
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    const-string v4, "mms"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_b3

    .line 101
    const-string v3, "mms"

    invoke-virtual {p1, v3}, Landroid/app/enterprise/ApnSettings;->setType(Ljava/lang/String;)V

    goto :goto_38

    .line 103
    :cond_b3
    const-string v3, "default,supl,mms,dun"

    invoke-virtual {p1, v3}, Landroid/app/enterprise/ApnSettings;->setType(Ljava/lang/String;)V

    goto :goto_38

    .line 106
    :cond_b9
    const-string v3, "default,supl,mms,dun"

    invoke-virtual {p1, v3}, Landroid/app/enterprise/ApnSettings;->setType(Ljava/lang/String;)V

    goto/16 :goto_38

    .line 109
    :cond_c0
    if-eqz v0, :cond_111

    .line 110
    const-string v3, "*"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d1

    .line 111
    const-string v3, "default,supl,mms"

    invoke-virtual {p1, v3}, Landroid/app/enterprise/ApnSettings;->setType(Ljava/lang/String;)V

    goto/16 :goto_38

    .line 112
    :cond_d1
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    const-string v4, "default"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_f7

    .line 113
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    const-string v4, "mms"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_f0

    .line 114
    const-string v3, "default,supl,mms"

    invoke-virtual {p1, v3}, Landroid/app/enterprise/ApnSettings;->setType(Ljava/lang/String;)V

    goto/16 :goto_38

    .line 116
    :cond_f0
    const-string v3, "default,supl"

    invoke-virtual {p1, v3}, Landroid/app/enterprise/ApnSettings;->setType(Ljava/lang/String;)V

    goto/16 :goto_38

    .line 118
    :cond_f7
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    const-string v4, "mms"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_10a

    .line 119
    const-string v3, "mms"

    invoke-virtual {p1, v3}, Landroid/app/enterprise/ApnSettings;->setType(Ljava/lang/String;)V

    goto/16 :goto_38

    .line 121
    :cond_10a
    const-string v3, "default,supl,mms"

    invoke-virtual {p1, v3}, Landroid/app/enterprise/ApnSettings;->setType(Ljava/lang/String;)V

    goto/16 :goto_38

    .line 124
    :cond_111
    const-string v3, "default,supl,mms"

    invoke-virtual {p1, v3}, Landroid/app/enterprise/ApnSettings;->setType(Ljava/lang/String;)V

    goto/16 :goto_38
.end method

.method private validateString(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .parameter "value"

    .prologue
    .line 586
    if-nez p1, :cond_3

    .end local p1
    :goto_2
    return-object p1

    .restart local p1
    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    goto :goto_2
.end method


# virtual methods
.method public declared-synchronized addUpdateApn(ZLandroid/app/enterprise/ApnSettings;)J
    .registers 39
    .parameter "isNewAp"
    .parameter "apnSettings"

    .prologue
    .line 199
    monitor-enter p0

    const/16 v28, 0x1

    .line 200
    .local v28, success:Z
    const-wide/16 v25, -0x1

    .line 201
    .local v25, rowId:J
    const/4 v10, 0x0

    .local v10, devMCC:Ljava/lang/String;
    const/4 v11, 0x0

    .local v11, devMNC:Ljava/lang/String;
    const/4 v12, 0x0

    .line 203
    .local v12, devSimOperatorNumeric:Ljava/lang/String;
    if-nez p2, :cond_e

    move-wide/from16 v33, v25

    .line 354
    :goto_c
    monitor-exit p0

    return-wide v33

    .line 206
    :cond_e
    :try_start_e
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/ApnSettingsPolicy;->udpateApnType(Landroid/app/enterprise/ApnSettings;)V

    .line 207
    invoke-virtual/range {p2 .. p2}, Landroid/app/enterprise/ApnSettings;->getId()J

    move-result-wide v5

    .line 208
    .local v5, apId:J
    invoke-virtual/range {p2 .. p2}, Landroid/app/enterprise/ApnSettings;->getUser()Ljava/lang/String;

    move-result-object v31

    .line 209
    .local v31, user:Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/app/enterprise/ApnSettings;->getServer()Ljava/lang/String;

    move-result-object v27

    .line 210
    .local v27, server:Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/app/enterprise/ApnSettings;->getPassword()Ljava/lang/String;

    move-result-object v21

    .line 211
    .local v21, password:Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/app/enterprise/ApnSettings;->getProxy()Ljava/lang/String;

    move-result-object v23

    .line 212
    .local v23, proxy:Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/app/enterprise/ApnSettings;->getPort()I

    move-result v22

    .line 213
    .local v22, port:I
    invoke-virtual/range {p2 .. p2}, Landroid/app/enterprise/ApnSettings;->getMmsProxy()Ljava/lang/String;

    move-result-object v17

    .line 214
    .local v17, mmsProxy:Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/app/enterprise/ApnSettings;->getMmsc()Ljava/lang/String;

    move-result-object v18

    .line 215
    .local v18, mmsc:Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/app/enterprise/ApnSettings;->getType()Ljava/lang/String;

    move-result-object v7

    .line 216
    .local v7, apType:Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/app/enterprise/ApnSettings;->getAuthType()I

    move-result v9

    .line 217
    .local v9, authType:I
    invoke-virtual/range {p2 .. p2}, Landroid/app/enterprise/ApnSettings;->getName()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/ApnSettingsPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 218
    .local v20, name:Ljava/lang/String;
    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->length()I

    move-result v33

    const/16 v34, 0x41

    move/from16 v0, v33

    move/from16 v1, v34

    if-le v0, v1, :cond_5f

    .line 219
    const-string v33, "ApnSettingsPolicyService"

    const-string v34, "APN name maximum length (65)"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    const-wide/16 v33, -0x1

    goto :goto_c

    .line 222
    :cond_5f
    invoke-virtual/range {p2 .. p2}, Landroid/app/enterprise/ApnSettings;->getApn()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/ApnSettingsPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 223
    .local v8, apn:Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v33

    const/16 v34, 0x78

    move/from16 v0, v33

    move/from16 v1, v34

    if-le v0, v1, :cond_81

    .line 224
    const-string v33, "ApnSettingsPolicyService"

    const-string v34, "APN excedes maximum length (120)"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 225
    const-wide/16 v33, -0x1

    goto :goto_c

    .line 227
    :cond_81
    invoke-virtual/range {p2 .. p2}, Landroid/app/enterprise/ApnSettings;->getMcc()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/ApnSettingsPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 228
    .local v15, mcc:Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/app/enterprise/ApnSettings;->getMnc()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/ApnSettingsPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 229
    .local v19, mnc:Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/app/enterprise/ApnSettings;->getMmsPort()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/ApnSettingsPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_a4
    .catchall {:try_start_e .. :try_end_a4} :catchall_351

    move-result-object v16

    .line 234
    .local v16, mmsPort:Ljava/lang/String;
    :try_start_a5
    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 235
    invoke-static {v15}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 236
    const/4 v14, -0x1

    .line 238
    .local v14, iMmsPort:I
    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->isEmpty()Z

    move-result v33

    if-nez v33, :cond_c2

    const-string v33, "*"

    move-object/from16 v0, v16

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v33

    if-eqz v33, :cond_c2

    .line 239
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    .line 242
    :cond_c2
    if-nez p1, :cond_ca

    const-wide/16 v33, 0x1

    cmp-long v33, v33, v5

    if-gtz v33, :cond_104

    :cond_ca
    if-eqz v15, :cond_104

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v33

    if-eqz v33, :cond_104

    if-eqz v19, :cond_104

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v33

    if-eqz v33, :cond_104

    if-eqz v20, :cond_104

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->length()I

    move-result v33

    if-eqz v33, :cond_104

    if-eqz v8, :cond_104

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v33

    if-eqz v33, :cond_104

    const/16 v33, -0x1

    move/from16 v0, v33

    move/from16 v1, v22

    if-gt v0, v1, :cond_104

    const/16 v33, -0x1

    move/from16 v0, v33

    if-gt v0, v14, :cond_104

    const/16 v33, -0x2

    move/from16 v0, v33

    if-gt v0, v9, :cond_104

    const/16 v33, 0x3

    move/from16 v0, v33

    if-ge v0, v9, :cond_193

    .line 246
    :cond_104
    const/16 v28, 0x0

    .line 247
    if-nez p1, :cond_128

    const-wide/16 v33, 0x1

    cmp-long v33, v33, v5

    if-lez v33, :cond_128

    .line 248
    const-string v33, "ApnSettingsPolicyService"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "addUpdateAp() : invalid ap Id "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    :cond_128
    if-eqz v20, :cond_130

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->length()I

    move-result v33

    if-nez v33, :cond_137

    .line 250
    :cond_130
    const-string v33, "ApnSettingsPolicyService"

    const-string v34, "addUpdateAp() : invalid ap name"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    :cond_137
    if-eqz v8, :cond_13f

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v33

    if-nez v33, :cond_146

    .line 252
    :cond_13f
    const-string v33, "ApnSettingsPolicyService"

    const-string v34, "addUpdateAp() : invalid ap apn"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 253
    :cond_146
    if-eqz v15, :cond_14e

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v33

    if-nez v33, :cond_155

    .line 254
    :cond_14e
    const-string v33, "ApnSettingsPolicyService"

    const-string v34, "addUpdateAp() : invalid ap mcc"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 255
    :cond_155
    if-eqz v19, :cond_15d

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v33

    if-nez v33, :cond_164

    .line 256
    :cond_15d
    const-string v33, "ApnSettingsPolicyService"

    const-string v34, "addUpdateAp() : invalid ap mnc"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    :cond_164
    const/16 v33, -0x1

    move/from16 v0, v33

    move/from16 v1, v22

    if-le v0, v1, :cond_173

    .line 258
    const-string v33, "ApnSettingsPolicyService"

    const-string v34, "addUpdateAp() : invalid ap port"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 259
    :cond_173
    const/16 v33, -0x1

    move/from16 v0, v33

    if-le v0, v14, :cond_180

    .line 260
    const-string v33, "ApnSettingsPolicyService"

    const-string v34, "addUpdateAp() : invalid ap iMmsPort"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 261
    :cond_180
    const/16 v33, -0x2

    move/from16 v0, v33

    if-gt v0, v9, :cond_18c

    const/16 v33, 0x3

    move/from16 v0, v33

    if-ge v0, v9, :cond_193

    .line 262
    :cond_18c
    const-string v33, "ApnSettingsPolicyService"

    const-string v34, "addUpdateAp() : invalid ap authType"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_193
    .catchall {:try_start_a5 .. :try_end_193} :catchall_351
    .catch Ljava/lang/Exception; {:try_start_a5 .. :try_end_193} :catch_349

    .line 269
    .end local v14           #iMmsPort:I
    :cond_193
    :goto_193
    if-eqz v28, :cond_345

    .line 271
    :try_start_195
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/enterprise/ApnSettingsPolicy;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    const-string v34, "phone"

    invoke-virtual/range {v33 .. v34}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Landroid/telephony/TelephonyManager;

    .line 273
    .local v29, tm:Landroid/telephony/TelephonyManager;
    invoke-virtual/range {v29 .. v29}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v12

    .line 275
    if-eqz v12, :cond_1c9

    const/16 v33, 0x4

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v34

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_1c9

    .line 277
    const/16 v33, 0x0

    const/16 v34, 0x3

    move/from16 v0, v33

    move/from16 v1, v34

    invoke-virtual {v12, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 279
    const/16 v33, 0x3

    move/from16 v0, v33

    invoke-virtual {v12, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v11

    .line 284
    :cond_1c9
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/android/server/enterprise/ApnSettingsPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 285
    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/ApnSettingsPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    .line 286
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/ApnSettingsPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    .line 287
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/ApnSettingsPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 288
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/ApnSettingsPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    .line 289
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/ApnSettingsPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 290
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/ApnSettingsPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 291
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/android/server/enterprise/ApnSettingsPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 293
    new-instance v32, Landroid/content/ContentValues;

    invoke-direct/range {v32 .. v32}, Landroid/content/ContentValues;-><init>()V

    .line 295
    .local v32, values:Landroid/content/ContentValues;
    const-string v33, "name"

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, v32

    move-object/from16 v3, v33

    move-object/from16 v4, v20

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/ApnSettingsPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    const-string v34, "numeric"

    if-eqz v15, :cond_21f

    if-nez v19, :cond_354

    :cond_21f
    const/16 v33, 0x0

    :goto_221
    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, v32

    move-object/from16 v3, v34

    move-object/from16 v4, v33

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/ApnSettingsPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 299
    const-string v33, "mcc"

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, v32

    move-object/from16 v3, v33

    invoke-direct {v0, v1, v2, v3, v15}, Lcom/android/server/enterprise/ApnSettingsPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    const-string v33, "mnc"

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, v32

    move-object/from16 v3, v33

    move-object/from16 v4, v19

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/ApnSettingsPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    const-string v33, "apn"

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, v32

    move-object/from16 v3, v33

    invoke-direct {v0, v1, v2, v3, v8}, Lcom/android/server/enterprise/ApnSettingsPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 302
    const-string v33, "user"

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, v32

    move-object/from16 v3, v33

    move-object/from16 v4, v31

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/ApnSettingsPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 303
    const-string v33, "server"

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, v32

    move-object/from16 v3, v33

    move-object/from16 v4, v27

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/ApnSettingsPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 304
    const-string v33, "password"

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, v32

    move-object/from16 v3, v33

    move-object/from16 v4, v21

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/ApnSettingsPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 305
    const-string v33, "proxy"

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, v32

    move-object/from16 v3, v33

    move-object/from16 v4, v23

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/ApnSettingsPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    const-string v34, "port"

    if-ltz v22, :cond_36d

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v33

    :goto_29b
    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, v32

    move-object/from16 v3, v34

    move-object/from16 v4, v33

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/ApnSettingsPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 308
    const-string v33, "mmsproxy"

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, v32

    move-object/from16 v3, v33

    move-object/from16 v4, v17

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/ApnSettingsPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 309
    const-string v33, "mmsport"

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, v32

    move-object/from16 v3, v33

    move-object/from16 v4, v16

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/ApnSettingsPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 310
    const-string v33, "mmsc"

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, v32

    move-object/from16 v3, v33

    move-object/from16 v4, v18

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/ApnSettingsPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 312
    if-eqz p1, :cond_375

    .line 313
    const-string v33, "authtype"

    const/16 v34, -0x2

    move/from16 v0, v34

    if-ge v0, v9, :cond_371

    const/16 v34, 0x4

    move/from16 v0, v34

    if-le v0, v9, :cond_371

    .end local v9           #authType:I
    :goto_2e5
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 318
    :cond_2ec
    :goto_2ec
    const-string v33, "type"

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, v32

    move-object/from16 v3, v33

    invoke-direct {v0, v1, v2, v3, v7}, Lcom/android/server/enterprise/ApnSettingsPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 320
    if-eqz v11, :cond_316

    if-eqz v10, :cond_316

    .line 321
    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_316

    invoke-virtual {v10, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_316

    .line 322
    const-string v33, "current"

    const/16 v34, 0x1

    invoke-static/range {v34 .. v34}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 326
    :cond_316
    invoke-virtual/range {v32 .. v32}, Landroid/content/ContentValues;->size()I

    move-result v33

    if-lez v33, :cond_3d0

    .line 327
    if-eqz p1, :cond_396

    .line 329
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/enterprise/ApnSettingsPolicy;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v33

    sget-object v34, Lcom/android/server/enterprise/ApnSettingsPolicy$Carriers;->CONTENT_URI:Landroid/net/Uri;

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    move-object/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v30

    .line 331
    .local v30, url:Landroid/net/Uri;
    if-eqz v30, :cond_393

    const/16 v28, 0x1

    .line 332
    :goto_338
    if-eqz v28, :cond_345

    .line 333
    const-string v33, "ApnSettingsPolicyService"

    const-string v34, "addUpdateAp Created rowUri : "

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 334
    invoke-static/range {v30 .. v30}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J
    :try_end_344
    .catchall {:try_start_195 .. :try_end_344} :catchall_351
    .catch Ljava/lang/Exception; {:try_start_195 .. :try_end_344} :catch_38e

    move-result-wide v25

    .end local v29           #tm:Landroid/telephony/TelephonyManager;
    .end local v30           #url:Landroid/net/Uri;
    .end local v32           #values:Landroid/content/ContentValues;
    :cond_345
    :goto_345
    move-wide/from16 v33, v25

    .line 354
    goto/16 :goto_c

    .line 264
    .restart local v9       #authType:I
    :catch_349
    move-exception v13

    .line 265
    .local v13, e:Ljava/lang/Exception;
    const/16 v28, 0x0

    .line 266
    :try_start_34c
    invoke-virtual {v13}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_34f
    .catchall {:try_start_34c .. :try_end_34f} :catchall_351

    goto/16 :goto_193

    .line 199
    .end local v5           #apId:J
    .end local v7           #apType:Ljava/lang/String;
    .end local v8           #apn:Ljava/lang/String;
    .end local v9           #authType:I
    .end local v13           #e:Ljava/lang/Exception;
    .end local v15           #mcc:Ljava/lang/String;
    .end local v16           #mmsPort:Ljava/lang/String;
    .end local v17           #mmsProxy:Ljava/lang/String;
    .end local v18           #mmsc:Ljava/lang/String;
    .end local v19           #mnc:Ljava/lang/String;
    .end local v20           #name:Ljava/lang/String;
    .end local v21           #password:Ljava/lang/String;
    .end local v22           #port:I
    .end local v23           #proxy:Ljava/lang/String;
    .end local v27           #server:Ljava/lang/String;
    .end local v31           #user:Ljava/lang/String;
    :catchall_351
    move-exception v33

    monitor-exit p0

    throw v33

    .line 297
    .restart local v5       #apId:J
    .restart local v7       #apType:Ljava/lang/String;
    .restart local v8       #apn:Ljava/lang/String;
    .restart local v9       #authType:I
    .restart local v15       #mcc:Ljava/lang/String;
    .restart local v16       #mmsPort:Ljava/lang/String;
    .restart local v17       #mmsProxy:Ljava/lang/String;
    .restart local v18       #mmsc:Ljava/lang/String;
    .restart local v19       #mnc:Ljava/lang/String;
    .restart local v20       #name:Ljava/lang/String;
    .restart local v21       #password:Ljava/lang/String;
    .restart local v22       #port:I
    .restart local v23       #proxy:Ljava/lang/String;
    .restart local v27       #server:Ljava/lang/String;
    .restart local v29       #tm:Landroid/telephony/TelephonyManager;
    .restart local v31       #user:Ljava/lang/String;
    .restart local v32       #values:Landroid/content/ContentValues;
    :cond_354
    :try_start_354
    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v33

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    goto/16 :goto_221

    .line 306
    :cond_36d
    const-string v33, ""

    goto/16 :goto_29b

    .line 313
    :cond_371
    sget v9, Lcom/android/server/enterprise/ApnSettingsPolicy;->AUTH_TYPE_NOTSET:I

    goto/16 :goto_2e5

    .line 315
    :cond_375
    if-nez p1, :cond_2ec

    const/16 v33, -0x2

    move/from16 v0, v33

    if-ge v0, v9, :cond_2ec

    const/16 v33, 0x4

    move/from16 v0, v33

    if-le v0, v9, :cond_2ec

    .line 316
    const-string v33, "authtype"

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V
    :try_end_38c
    .catchall {:try_start_354 .. :try_end_38c} :catchall_351
    .catch Ljava/lang/Exception; {:try_start_354 .. :try_end_38c} :catch_38e

    goto/16 :goto_2ec

    .line 350
    .end local v9           #authType:I
    .end local v29           #tm:Landroid/telephony/TelephonyManager;
    .end local v32           #values:Landroid/content/ContentValues;
    :catch_38e
    move-exception v13

    .line 351
    .restart local v13       #e:Ljava/lang/Exception;
    :try_start_38f
    invoke-virtual {v13}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_392
    .catchall {:try_start_38f .. :try_end_392} :catchall_351

    goto :goto_345

    .line 331
    .end local v13           #e:Ljava/lang/Exception;
    .restart local v29       #tm:Landroid/telephony/TelephonyManager;
    .restart local v30       #url:Landroid/net/Uri;
    .restart local v32       #values:Landroid/content/ContentValues;
    :cond_393
    const/16 v28, 0x0

    goto :goto_338

    .line 338
    .end local v30           #url:Landroid/net/Uri;
    :cond_396
    :try_start_396
    sget-object v33, Lcom/android/server/enterprise/ApnSettingsPolicy$Carriers;->CONTENT_URI:Landroid/net/Uri;

    move-object/from16 v0, v33

    invoke-static {v0, v5, v6}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v30

    .line 339
    .restart local v30       #url:Landroid/net/Uri;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/enterprise/ApnSettingsPolicy;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v33

    const/16 v34, 0x0

    const/16 v35, 0x0

    move-object/from16 v0, v33

    move-object/from16 v1, v30

    move-object/from16 v2, v32

    move-object/from16 v3, v34

    move-object/from16 v4, v35

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v24

    .line 341
    .local v24, rowCount:I
    if-lez v24, :cond_3cd

    const/16 v28, 0x1

    .line 342
    :goto_3be
    if-eqz v28, :cond_345

    .line 343
    const-string v33, "ApnSettingsPolicyService"

    const-string v34, "addUpdateAp Updated rowUri : "

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 344
    invoke-static/range {v30 .. v30}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v25

    goto/16 :goto_345

    .line 341
    :cond_3cd
    const/16 v28, 0x0

    goto :goto_3be

    .line 348
    .end local v24           #rowCount:I
    .end local v30           #url:Landroid/net/Uri;
    :cond_3d0
    const-string v33, "ApnSettingsPolicyService"

    const-string v34, "addUpdateAp Error: Empty dataset."

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3d7
    .catchall {:try_start_396 .. :try_end_3d7} :catchall_351
    .catch Ljava/lang/Exception; {:try_start_396 .. :try_end_3d7} :catch_38e

    goto/16 :goto_345
.end method

.method public declared-synchronized deleteApn(J)Z
    .registers 10
    .parameter "apId"

    .prologue
    const/4 v3, 0x0

    .line 170
    monitor-enter p0

    const/4 v1, -0x1

    .line 172
    .local v1, rowCount:I
    :try_start_3
    invoke-direct {p0}, Lcom/android/server/enterprise/ApnSettingsPolicy;->enforceApnPermission()I

    .line 174
    const-wide/16 v4, 0x1

    cmp-long v4, v4, p1

    if-lez v4, :cond_15

    .line 175
    const-string v4, "ApnSettingsPolicyService"

    const-string v5, "deleteAp : apId is invalid"

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_48

    .line 185
    :cond_13
    :goto_13
    monitor-exit p0

    return v3

    .line 179
    :cond_15
    :try_start_15
    sget-object v4, Lcom/android/server/enterprise/ApnSettingsPolicy$Carriers;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v4, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v2

    .line 180
    .local v2, uri:Landroid/net/Uri;
    iget-object v4, p0, Lcom/android/server/enterprise/ApnSettingsPolicy;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v4, v2, v5, v6}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 181
    const-string v4, "ApnSettingsPolicyService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "deleteAp : deleted rowCount from ApTable : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3f
    .catchall {:try_start_15 .. :try_end_3f} :catchall_48
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_3f} :catch_43

    .line 185
    .end local v2           #uri:Landroid/net/Uri;
    :goto_3f
    if-lez v1, :cond_13

    const/4 v3, 0x1

    goto :goto_13

    .line 182
    :catch_43
    move-exception v0

    .line 183
    .local v0, e:Ljava/lang/Exception;
    :try_start_44
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_47
    .catchall {:try_start_44 .. :try_end_47} :catchall_48

    goto :goto_3f

    .line 170
    .end local v0           #e:Ljava/lang/Exception;
    :catchall_48
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public getApnList()Ljava/util/List;
    .registers 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/app/enterprise/ApnSettings;",
            ">;"
        }
    .end annotation

    .prologue
    .line 423
    invoke-direct/range {p0 .. p0}, Lcom/android/server/enterprise/ApnSettingsPolicy;->enforceApnPermission()I

    .line 424
    const/4 v11, 0x0

    .line 425
    .local v11, cursor:Landroid/database/Cursor;
    const/4 v7, 0x0

    .line 426
    .local v7, apnList:Ljava/util/List;,"Ljava/util/List<Landroid/app/enterprise/ApnSettings;>;"
    const/16 v1, 0xf

    new-array v3, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "_id"

    aput-object v2, v3, v1

    const/4 v1, 0x1

    const-string v2, "name"

    aput-object v2, v3, v1

    const/4 v1, 0x2

    const-string v2, "mcc"

    aput-object v2, v3, v1

    const/4 v1, 0x3

    const-string v2, "mnc"

    aput-object v2, v3, v1

    const/4 v1, 0x4

    const-string v2, "apn"

    aput-object v2, v3, v1

    const/4 v1, 0x5

    const-string v2, "user"

    aput-object v2, v3, v1

    const/4 v1, 0x6

    const-string v2, "server"

    aput-object v2, v3, v1

    const/4 v1, 0x7

    const-string v2, "password"

    aput-object v2, v3, v1

    const/16 v1, 0x8

    const-string v2, "proxy"

    aput-object v2, v3, v1

    const/16 v1, 0x9

    const-string v2, "port"

    aput-object v2, v3, v1

    const/16 v1, 0xa

    const-string v2, "mmsproxy"

    aput-object v2, v3, v1

    const/16 v1, 0xb

    const-string v2, "mmsport"

    aput-object v2, v3, v1

    const/16 v1, 0xc

    const-string v2, "mmsc"

    aput-object v2, v3, v1

    const/16 v1, 0xd

    const-string v2, "authtype"

    aput-object v2, v3, v1

    const/16 v1, 0xe

    const-string v2, "type"

    aput-object v2, v3, v1

    .line 432
    .local v3, columns:[Ljava/lang/String;
    invoke-direct/range {p0 .. p0}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getApnListConditionStr()Ljava/lang/String;

    move-result-object v4

    .line 437
    .local v4, APNLIST_SELECTION:Ljava/lang/String;
    :try_start_5f
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/enterprise/ApnSettingsPolicy;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/android/server/enterprise/ApnSettingsPolicy$Carriers;->CONTENT_URI:Landroid/net/Uri;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 439
    if-eqz v11, :cond_148

    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_148

    .line 440
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V
    :try_end_7c
    .catchall {:try_start_5f .. :try_end_7c} :catchall_155
    .catch Ljava/lang/Exception; {:try_start_5f .. :try_end_7c} :catch_14e

    .line 442
    .end local v7           #apnList:Ljava/util/List;,"Ljava/util/List<Landroid/app/enterprise/ApnSettings;>;"
    .local v8, apnList:Ljava/util/List;,"Ljava/util/List<Landroid/app/enterprise/ApnSettings;>;"
    :cond_7c
    :try_start_7c
    new-instance v9, Landroid/app/enterprise/ApnSettings;

    invoke-direct {v9}, Landroid/app/enterprise/ApnSettings;-><init>()V

    .line 443
    .local v9, apnSettings:Landroid/app/enterprise/ApnSettings;
    const-string v1, "_id"

    move-object/from16 v0, p0

    invoke-direct {v0, v1, v11}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v13

    .line 444
    .local v13, id:J
    invoke-virtual {v9, v13, v14}, Landroid/app/enterprise/ApnSettings;->setId(J)V

    .line 445
    const-string v1, "name"

    move-object/from16 v0, p0

    invoke-direct {v0, v1, v11}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Landroid/app/enterprise/ApnSettings;->setName(Ljava/lang/String;)V

    .line 446
    const-string v1, "mcc"

    move-object/from16 v0, p0

    invoke-direct {v0, v1, v11}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Landroid/app/enterprise/ApnSettings;->setMcc(Ljava/lang/String;)V

    .line 447
    const-string v1, "mnc"

    move-object/from16 v0, p0

    invoke-direct {v0, v1, v11}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Landroid/app/enterprise/ApnSettings;->setMnc(Ljava/lang/String;)V

    .line 448
    const-string v1, "apn"

    move-object/from16 v0, p0

    invoke-direct {v0, v1, v11}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Landroid/app/enterprise/ApnSettings;->setApn(Ljava/lang/String;)V

    .line 449
    const-string v1, "user"

    move-object/from16 v0, p0

    invoke-direct {v0, v1, v11}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Landroid/app/enterprise/ApnSettings;->setUser(Ljava/lang/String;)V

    .line 450
    const-string v1, "server"

    move-object/from16 v0, p0

    invoke-direct {v0, v1, v11}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Landroid/app/enterprise/ApnSettings;->setServer(Ljava/lang/String;)V

    .line 451
    const-string v1, "password"

    move-object/from16 v0, p0

    invoke-direct {v0, v1, v11}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Landroid/app/enterprise/ApnSettings;->setPassword(Ljava/lang/String;)V

    .line 452
    const-string v1, "proxy"

    move-object/from16 v0, p0

    invoke-direct {v0, v1, v11}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Landroid/app/enterprise/ApnSettings;->setProxy(Ljava/lang/String;)V

    .line 453
    const-string v1, "port"

    move-object/from16 v0, p0

    invoke-direct {v0, v1, v11}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v17

    .line 454
    .local v17, strPort:Ljava/lang/String;
    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_fd

    .line 455
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v15

    .line 456
    .local v15, port:I
    invoke-virtual {v9, v15}, Landroid/app/enterprise/ApnSettings;->setPort(I)V

    .line 458
    .end local v15           #port:I
    :cond_fd
    const-string v1, "mmsproxy"

    move-object/from16 v0, p0

    invoke-direct {v0, v1, v11}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Landroid/app/enterprise/ApnSettings;->setMmsProxy(Ljava/lang/String;)V

    .line 459
    const-string v1, "mmsport"

    move-object/from16 v0, p0

    invoke-direct {v0, v1, v11}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Landroid/app/enterprise/ApnSettings;->setMmsPort(Ljava/lang/String;)V

    .line 460
    const-string v1, "mmsc"

    move-object/from16 v0, p0

    invoke-direct {v0, v1, v11}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Landroid/app/enterprise/ApnSettings;->setMmsc(Ljava/lang/String;)V

    .line 461
    const-string v1, "authtype"

    move-object/from16 v0, p0

    invoke-direct {v0, v1, v11}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v16

    .line 462
    .local v16, strAuthType:Ljava/lang/String;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_133

    .line 463
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    .line 464
    .local v10, authType:I
    invoke-virtual {v9, v10}, Landroid/app/enterprise/ApnSettings;->setAuthType(I)V

    .line 466
    .end local v10           #authType:I
    :cond_133
    const-string v1, "type"

    move-object/from16 v0, p0

    invoke-direct {v0, v1, v11}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Landroid/app/enterprise/ApnSettings;->setType(Ljava/lang/String;)V

    .line 468
    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 470
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_144
    .catchall {:try_start_7c .. :try_end_144} :catchall_15c
    .catch Ljava/lang/Exception; {:try_start_7c .. :try_end_144} :catch_15f

    move-result v1

    if-nez v1, :cond_7c

    move-object v7, v8

    .line 475
    .end local v8           #apnList:Ljava/util/List;,"Ljava/util/List<Landroid/app/enterprise/ApnSettings;>;"
    .end local v9           #apnSettings:Landroid/app/enterprise/ApnSettings;
    .end local v13           #id:J
    .end local v16           #strAuthType:Ljava/lang/String;
    .end local v17           #strPort:Ljava/lang/String;
    .restart local v7       #apnList:Ljava/util/List;,"Ljava/util/List<Landroid/app/enterprise/ApnSettings;>;"
    :cond_148
    if-eqz v11, :cond_14d

    .line 476
    :goto_14a
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 478
    :cond_14d
    return-object v7

    .line 472
    :catch_14e
    move-exception v12

    .line 473
    .local v12, e:Ljava/lang/Exception;
    :goto_14f
    :try_start_14f
    invoke-virtual {v12}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_152
    .catchall {:try_start_14f .. :try_end_152} :catchall_155

    .line 475
    if-eqz v11, :cond_14d

    goto :goto_14a

    .end local v12           #e:Ljava/lang/Exception;
    :catchall_155
    move-exception v1

    :goto_156
    if-eqz v11, :cond_15b

    .line 476
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 475
    :cond_15b
    throw v1

    .end local v7           #apnList:Ljava/util/List;,"Ljava/util/List<Landroid/app/enterprise/ApnSettings;>;"
    .restart local v8       #apnList:Ljava/util/List;,"Ljava/util/List<Landroid/app/enterprise/ApnSettings;>;"
    :catchall_15c
    move-exception v1

    move-object v7, v8

    .end local v8           #apnList:Ljava/util/List;,"Ljava/util/List<Landroid/app/enterprise/ApnSettings;>;"
    .restart local v7       #apnList:Ljava/util/List;,"Ljava/util/List<Landroid/app/enterprise/ApnSettings;>;"
    goto :goto_156

    .line 472
    .end local v7           #apnList:Ljava/util/List;,"Ljava/util/List<Landroid/app/enterprise/ApnSettings;>;"
    .restart local v8       #apnList:Ljava/util/List;,"Ljava/util/List<Landroid/app/enterprise/ApnSettings;>;"
    :catch_15f
    move-exception v12

    move-object v7, v8

    .end local v8           #apnList:Ljava/util/List;,"Ljava/util/List<Landroid/app/enterprise/ApnSettings;>;"
    .restart local v7       #apnList:Ljava/util/List;,"Ljava/util/List<Landroid/app/enterprise/ApnSettings;>;"
    goto :goto_14f
.end method

.method public getApnSettings(J)Landroid/app/enterprise/ApnSettings;
    .registers 21
    .parameter "apId"

    .prologue
    .line 482
    invoke-direct/range {p0 .. p0}, Lcom/android/server/enterprise/ApnSettingsPolicy;->enforceApnPermission()I

    .line 483
    const/4 v15, -0x1

    .line 484
    .local v15, rowCount:I
    const/4 v10, 0x0

    .line 489
    .local v10, cursor:Landroid/database/Cursor;
    const-wide/16 v4, 0x1

    cmp-long v2, v4, p1

    if-lez v2, :cond_14

    .line 490
    const-string v2, "ApnSettingsPolicyService"

    const-string v4, "getApnSettings : apId is invalid"

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 491
    const/4 v8, 0x0

    .line 528
    :goto_13
    return-object v8

    .line 494
    :cond_14
    :try_start_14
    sget-object v2, Lcom/android/server/enterprise/ApnSettingsPolicy$Carriers;->CONTENT_URI:Landroid/net/Uri;

    move-wide/from16 v0, p1

    invoke-static {v2, v0, v1}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v3

    .line 495
    .local v3, uri:Landroid/net/Uri;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/enterprise/ApnSettingsPolicy;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 496
    if-eqz v10, :cond_fc

    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_fc

    .line 497
    new-instance v8, Landroid/app/enterprise/ApnSettings;

    invoke-direct {v8}, Landroid/app/enterprise/ApnSettings;-><init>()V

    .line 498
    .local v8, apnSettings:Landroid/app/enterprise/ApnSettings;
    const-string v2, "_id"

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v10}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v12

    .line 499
    .local v12, id:J
    invoke-virtual {v8, v12, v13}, Landroid/app/enterprise/ApnSettings;->setId(J)V

    .line 500
    const-string v2, "name"

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v10}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Landroid/app/enterprise/ApnSettings;->setName(Ljava/lang/String;)V

    .line 501
    const-string v2, "mcc"

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v10}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Landroid/app/enterprise/ApnSettings;->setMcc(Ljava/lang/String;)V

    .line 502
    const-string v2, "mnc"

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v10}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Landroid/app/enterprise/ApnSettings;->setMnc(Ljava/lang/String;)V

    .line 503
    const-string v2, "apn"

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v10}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Landroid/app/enterprise/ApnSettings;->setApn(Ljava/lang/String;)V

    .line 504
    const-string v2, "user"

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v10}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Landroid/app/enterprise/ApnSettings;->setUser(Ljava/lang/String;)V

    .line 505
    const-string v2, "server"

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v10}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Landroid/app/enterprise/ApnSettings;->setServer(Ljava/lang/String;)V

    .line 506
    const-string v2, "password"

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v10}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Landroid/app/enterprise/ApnSettings;->setPassword(Ljava/lang/String;)V

    .line 507
    const-string v2, "proxy"

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v10}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Landroid/app/enterprise/ApnSettings;->setProxy(Ljava/lang/String;)V

    .line 508
    const-string v2, "port"

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v10}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v17

    .line 509
    .local v17, strPort:Ljava/lang/String;
    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_b5

    .line 510
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    .line 511
    .local v14, port:I
    invoke-virtual {v8, v14}, Landroid/app/enterprise/ApnSettings;->setPort(I)V

    .line 513
    .end local v14           #port:I
    :cond_b5
    const-string v2, "mmsproxy"

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v10}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Landroid/app/enterprise/ApnSettings;->setMmsProxy(Ljava/lang/String;)V

    .line 514
    const-string v2, "mmsport"

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v10}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Landroid/app/enterprise/ApnSettings;->setMmsPort(Ljava/lang/String;)V

    .line 515
    const-string v2, "mmsc"

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v10}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Landroid/app/enterprise/ApnSettings;->setMmsc(Ljava/lang/String;)V

    .line 516
    const-string v2, "authtype"

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v10}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v16

    .line 517
    .local v16, strAuthType:Ljava/lang/String;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_eb

    .line 518
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    .line 519
    .local v9, authType:I
    invoke-virtual {v8, v9}, Landroid/app/enterprise/ApnSettings;->setAuthType(I)V

    .line 521
    .end local v9           #authType:I
    :cond_eb
    const-string v2, "type"

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v10}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getColumnValue(Ljava/lang/String;Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Landroid/app/enterprise/ApnSettings;->setType(Ljava/lang/String;)V
    :try_end_f6
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_f6} :catch_f8

    goto/16 :goto_13

    .line 525
    .end local v3           #uri:Landroid/net/Uri;
    .end local v8           #apnSettings:Landroid/app/enterprise/ApnSettings;
    .end local v12           #id:J
    .end local v16           #strAuthType:Ljava/lang/String;
    .end local v17           #strPort:Ljava/lang/String;
    :catch_f8
    move-exception v11

    .line 526
    .local v11, e:Ljava/lang/Exception;
    invoke-virtual {v11}, Ljava/lang/Exception;->printStackTrace()V

    .line 528
    .end local v11           #e:Ljava/lang/Exception;
    :cond_fc
    const/4 v8, 0x0

    goto/16 :goto_13
.end method

.method public getPreferredApn()Landroid/app/enterprise/ApnSettings;
    .registers 11

    .prologue
    const/4 v3, 0x0

    .line 533
    invoke-direct {p0}, Lcom/android/server/enterprise/ApnSettingsPolicy;->enforceApnPermission()I

    .line 534
    const/4 v6, 0x0

    .line 536
    .local v6, apn:Landroid/app/enterprise/ApnSettings;
    const-string v0, "ApnSettingsPolicyService"

    const-string v1, "getPreferredApn():"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 538
    iget-object v0, p0, Lcom/android/server/enterprise/ApnSettingsPolicy;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/android/server/enterprise/ApnSettingsPolicy$Carriers;->PREFERAPN_URI:Landroid/net/Uri;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "_id"

    aput-object v5, v2, v4

    const/4 v4, 0x1

    const-string v5, "name"

    aput-object v5, v2, v4

    const/4 v4, 0x2

    const-string v5, "apn"

    aput-object v5, v2, v4

    const-string v5, "name ASC"

    move-object v4, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 542
    .local v9, cursor:Landroid/database/Cursor;
    if-eqz v9, :cond_61

    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_61

    .line 543
    const-string v0, "_id"

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    .line 544
    .local v7, apnId:J
    const-string v0, "ApnSettingsPolicyService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getPreferredApn():"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 545
    const-wide/16 v0, 0x0

    cmp-long v0, v7, v0

    if-lez v0, :cond_61

    .line 546
    invoke-virtual {p0, v7, v8}, Lcom/android/server/enterprise/ApnSettingsPolicy;->getApnSettings(J)Landroid/app/enterprise/ApnSettings;

    move-result-object v6

    .line 550
    .end local v7           #apnId:J
    :cond_61
    return-object v6
.end method

.method public declared-synchronized setPreferredApn(J)Z
    .registers 11
    .parameter "apId"

    .prologue
    const-wide/16 v5, 0x0

    .line 139
    monitor-enter p0

    const/4 v2, 0x0

    .line 141
    .local v2, success:Z
    :try_start_4
    invoke-direct {p0}, Lcom/android/server/enterprise/ApnSettingsPolicy;->enforceApnPermission()I
    :try_end_7
    .catchall {:try_start_4 .. :try_end_7} :catchall_72

    .line 144
    cmp-long v4, v5, p1

    if-eqz v4, :cond_29

    cmp-long v4, v5, p1

    if-lez v4, :cond_29

    .line 145
    :try_start_f
    const-string v4, "ApnSettingsPolicyService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "setPreferedAp() : invalid ap Id "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_27
    .catchall {:try_start_f .. :try_end_27} :catchall_72
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_27} :catch_6d

    .line 160
    .end local p1
    :cond_27
    :goto_27
    monitor-exit p0

    return v2

    .line 147
    .restart local p1
    :cond_29
    :try_start_29
    invoke-direct {p0, p1, p2}, Lcom/android/server/enterprise/ApnSettingsPolicy;->isValidApnId(J)Z

    move-result v2

    .line 148
    if-eqz v2, :cond_27

    .line 149
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 150
    .local v3, values:Landroid/content/ContentValues;
    const-string v4, "apn_id"

    cmp-long v5, v5, p1

    if-nez v5, :cond_3c

    const-wide/16 p1, -0x1

    .end local p1
    :cond_3c
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 151
    iget-object v4, p0, Lcom/android/server/enterprise/ApnSettingsPolicy;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v5, Lcom/android/server/enterprise/ApnSettingsPolicy$Carriers;->PREFERAPN_URI:Landroid/net/Uri;

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v3, v6, v7}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 153
    .local v1, rowCount:I
    if-lez v1, :cond_75

    const/4 v2, 0x1

    .line 154
    :goto_54
    const-string v4, "ApnSettingsPolicyService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "setPreferedAp() row count : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6c
    .catchall {:try_start_29 .. :try_end_6c} :catchall_72
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_6c} :catch_6d

    goto :goto_27

    .line 157
    .end local v1           #rowCount:I
    .end local v3           #values:Landroid/content/ContentValues;
    :catch_6d
    move-exception v0

    .line 158
    .local v0, e:Ljava/lang/Exception;
    :try_start_6e
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_71
    .catchall {:try_start_6e .. :try_end_71} :catchall_72

    goto :goto_27

    .line 139
    .end local v0           #e:Ljava/lang/Exception;
    :catchall_72
    move-exception v4

    monitor-exit p0

    throw v4

    .line 153
    .restart local v1       #rowCount:I
    .restart local v3       #values:Landroid/content/ContentValues;
    :cond_75
    const/4 v2, 0x0

    goto :goto_54
.end method

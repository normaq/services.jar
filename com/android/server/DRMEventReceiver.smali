.class public Lcom/android/server/DRMEventReceiver;
.super Landroid/content/BroadcastReceiver;
.source "DRMEventReceiver.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "DRMEventReceiver"

.field static isLogEnabled:Z

.field static final mStartingServiceSync:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 32
    new-instance v0, Ljava/lang/Object;

    invoke-direct/range {v0 .. v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/server/DRMEventReceiver;->mStartingServiceSync:Ljava/lang/Object;

    .line 33
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/server/DRMEventReceiver;->isLogEnabled:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static beginStartingService(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 5
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 58
    sget-boolean v0, Lcom/android/server/DRMEventReceiver;->isLogEnabled:Z

    if-eqz v0, :cond_b

    .line 59
    const-string v0, "DRMEventReceiver"

    const-string v1, "DRMEventReceiver : beginStartingService"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    :cond_b
    sget-object v1, Lcom/android/server/DRMEventReceiver;->mStartingServiceSync:Ljava/lang/Object;

    monitor-enter v1

    .line 63
    :try_start_e
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "start Service"

    invoke-virtual {v0, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 64
    invoke-virtual {p0, p1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 65
    monitor-exit v1

    .line 66
    return-void

    .line 65
    :catchall_1a
    move-exception v0

    monitor-exit v1
    :try_end_1c
    .catchall {:try_start_e .. :try_end_1c} :catchall_1a

    throw v0
.end method

.method public static finishStartingService(Landroid/app/Service;I)V
    .registers 4
    .parameter "service"
    .parameter "startId"

    .prologue
    .line 73
    sget-boolean v0, Lcom/android/server/DRMEventReceiver;->isLogEnabled:Z

    if-eqz v0, :cond_b

    .line 74
    const-string v0, "DRMEventReceiver"

    const-string v1, "DRMEventReceiver : finishStartingService"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    :cond_b
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 5
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 37
    sget-boolean v0, Lcom/android/server/DRMEventReceiver;->isLogEnabled:Z

    if-eqz v0, :cond_b

    .line 38
    const-string v0, "DRMEventReceiver"

    const-string v1, "DRMEventReceiver : onReceive"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    :cond_b
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/android/server/DRMEventReceiver;->onReceiveWithPrivilege(Landroid/content/Context;Landroid/content/Intent;Z)V

    .line 41
    return-void
.end method

.method protected onReceiveWithPrivilege(Landroid/content/Context;Landroid/content/Intent;Z)V
    .registers 7
    .parameter "context"
    .parameter "intent"
    .parameter "privileged"

    .prologue
    .line 46
    sget-boolean v0, Lcom/android/server/DRMEventReceiver;->isLogEnabled:Z

    if-eqz v0, :cond_20

    .line 47
    const-string v0, "DRMEventReceiver"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DRMEventReceiver : onReceiveWithPrivilege intent.getType"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    :cond_20
    const-class v0, Lcom/android/server/DrmEventService;

    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 50
    invoke-static {p1, p2}, Lcom/android/server/DRMEventReceiver;->beginStartingService(Landroid/content/Context;Landroid/content/Intent;)V

    .line 51
    return-void
.end method

.class Lcom/android/server/pm/PackageManagerService$2;
.super Ljava/lang/Object;
.source "PackageManagerService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/pm/PackageManagerService;->freeStorageAndNotify(JLandroid/content/pm/IPackageDataObserver;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/pm/PackageManagerService;

.field final synthetic val$freeStorageSize:J

.field final synthetic val$observer:Landroid/content/pm/IPackageDataObserver;


# direct methods
.method constructor <init>(Lcom/android/server/pm/PackageManagerService;JLandroid/content/pm/IPackageDataObserver;)V
    .registers 5
    .parameter
    .parameter
    .parameter

    .prologue
    .line 2232
    iput-object p1, p0, Lcom/android/server/pm/PackageManagerService$2;->this$0:Lcom/android/server/pm/PackageManagerService;

    iput-wide p2, p0, Lcom/android/server/pm/PackageManagerService$2;->val$freeStorageSize:J

    iput-object p4, p0, Lcom/android/server/pm/PackageManagerService$2;->val$observer:Landroid/content/pm/IPackageDataObserver;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    .line 2234
    iget-object v2, p0, Lcom/android/server/pm/PackageManagerService$2;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v2, v2, Lcom/android/server/pm/PackageManagerService;->mHandler:Lcom/android/server/pm/PackageManagerService$PackageHandler;

    invoke-virtual {v2, p0}, Lcom/android/server/pm/PackageManagerService$PackageHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 2235
    const/4 v1, -0x1

    .line 2236
    .local v1, retCode:I
    iget-object v2, p0, Lcom/android/server/pm/PackageManagerService$2;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v2, v2, Lcom/android/server/pm/PackageManagerService;->mInstaller:Lcom/android/server/pm/Installer;

    iget-wide v3, p0, Lcom/android/server/pm/PackageManagerService$2;->val$freeStorageSize:J

    invoke-virtual {v2, v3, v4}, Lcom/android/server/pm/Installer;->freeCache(J)I

    move-result v1

    .line 2237
    if-gez v1, :cond_1b

    .line 2238
    const-string v2, "PackageManager"

    const-string v3, "Couldn\'t clear application caches"

    invoke-static {v2, v3}, Landroid/util/safelog/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2240
    :cond_1b
    iget-object v2, p0, Lcom/android/server/pm/PackageManagerService$2;->val$observer:Landroid/content/pm/IPackageDataObserver;

    if-eqz v2, :cond_28

    .line 2242
    :try_start_1f
    iget-object v3, p0, Lcom/android/server/pm/PackageManagerService$2;->val$observer:Landroid/content/pm/IPackageDataObserver;

    const/4 v4, 0x0

    if-ltz v1, :cond_29

    const/4 v2, 0x1

    :goto_25
    invoke-interface {v3, v4, v2}, Landroid/content/pm/IPackageDataObserver;->onRemoveCompleted(Ljava/lang/String;Z)V
    :try_end_28
    .catch Landroid/os/RemoteException; {:try_start_1f .. :try_end_28} :catch_2b

    .line 2247
    :cond_28
    :goto_28
    return-void

    .line 2242
    :cond_29
    const/4 v2, 0x0

    goto :goto_25

    .line 2243
    :catch_2b
    move-exception v0

    .line 2244
    .local v0, e:Landroid/os/RemoteException;
    const-string v2, "PackageManager"

    const-string v3, "RemoveException when invoking call back"

    invoke-static {v2, v3}, Landroid/util/safelog/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_28
.end method

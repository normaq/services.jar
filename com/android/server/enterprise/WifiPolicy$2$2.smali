.class Lcom/android/server/enterprise/WifiPolicy$2$2;
.super Ljava/lang/Object;
.source "WifiPolicy.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/enterprise/WifiPolicy$2;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/server/enterprise/WifiPolicy$2;


# direct methods
.method constructor <init>(Lcom/android/server/enterprise/WifiPolicy$2;)V
    .registers 2
    .parameter

    .prologue
    .line 2583
    iput-object p1, p0, Lcom/android/server/enterprise/WifiPolicy$2$2;->this$1:Lcom/android/server/enterprise/WifiPolicy$2;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 2585
    iget-object v0, p0, Lcom/android/server/enterprise/WifiPolicy$2$2;->this$1:Lcom/android/server/enterprise/WifiPolicy$2;

    iget-object v0, v0, Lcom/android/server/enterprise/WifiPolicy$2;->this$0:Lcom/android/server/enterprise/WifiPolicy;

    #calls: Lcom/android/server/enterprise/WifiPolicy;->edmUpdateConfiguredNetworks()V
    invoke-static {v0}, Lcom/android/server/enterprise/WifiPolicy;->access$100(Lcom/android/server/enterprise/WifiPolicy;)V

    .line 2586
    return-void
.end method

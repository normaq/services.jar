.class Lcom/android/server/NetworkTimeUpdateService$MyHandler;
.super Landroid/os/Handler;
.source "NetworkTimeUpdateService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/NetworkTimeUpdateService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/NetworkTimeUpdateService;


# direct methods
.method public constructor <init>(Lcom/android/server/NetworkTimeUpdateService;Landroid/os/Looper;)V
    .registers 3
    .parameter
    .parameter "l"

    .prologue
    .line 253
    iput-object p1, p0, Lcom/android/server/NetworkTimeUpdateService$MyHandler;->this$0:Lcom/android/server/NetworkTimeUpdateService;

    .line 254
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 255
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 4
    .parameter "msg"

    .prologue
    .line 259
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_e

    .line 266
    :goto_5
    return-void

    .line 263
    :pswitch_6
    iget-object v0, p0, Lcom/android/server/NetworkTimeUpdateService$MyHandler;->this$0:Lcom/android/server/NetworkTimeUpdateService;

    iget v1, p1, Landroid/os/Message;->what:I

    #calls: Lcom/android/server/NetworkTimeUpdateService;->onPollNetworkTime(I)V
    invoke-static {v0, v1}, Lcom/android/server/NetworkTimeUpdateService;->access$300(Lcom/android/server/NetworkTimeUpdateService;I)V

    goto :goto_5

    .line 259
    :pswitch_data_e
    .packed-switch 0x1
        :pswitch_6
        :pswitch_6
        :pswitch_6
    .end packed-switch
.end method

//
//  testMarco.h
//  Test
//
//  Created by 叶义峰 on 2021/4/29.
//

#ifndef testMarco_h
#define testMarco_h
//
//  TKMacro.h
//  whiteBoardDemo
//
//  Created by ifeng on 2017/2/28.
//  Copyright © 2017年 beijing. All rights reserved.
//

#ifndef TKMacro_h
#define TKMacro_h
#ifdef DEBUG
#define TKLog(...) NSLog(__VA_ARGS__)
#else
#define TKLog(...) do { } while (0)
#endif

#import <UIKit/UIKit.h>

// https
#define HTTPS_MACRO 1

#define sHttp      HTTPS_MACRO ? @"https" : @"http"
#define sPort      HTTPS_MACRO ? @"443"   : @"80"
#define isHTTPS  HTTPS_MACRO ? @"YES"    : @"NO"

#define TKUserPeerIDInfo @"TKUserPeerIDInfo"
#define TKUserBanChatInfo @"TKUserBanChatInfo"

#define TKDISPATH_ONCE_BLOCK(onceBlock)   static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);
//GCD - 在Main线程上运行
#define  TKDISPTCH_MAIN_THREAD(mainQueueBlock)  dispatch_async(dispatch_get_main_queue(), mainQueueBlock);
//GCD - 开启异步线程
#define TKDISPATCH_GLOBAL_QUEQUE_DEFAULT(globalQueueBlock)  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlock);

// 延迟时间
#define TKDisTime(time) dispatch_time(DISPATCH_TIME_NOW, (int64_t)time * NSEC_PER_SEC)

// 延迟执行
#define TKDisMainAfter(disTime,block) dispatch_after(disTime, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){dispatch_async(dispatch_get_main_queue(), block);});


// 本地缓存用户信息
#define TKUserInfo @"TKUserInfo"
#define TKCacheTime @"cacheTime"
#define TKBanChat sDisablechat

//色值设置
#define UIColorRGB(rgb) ([[UIColor alloc] initWithRed:(((rgb >> 16) & 0xff) / 255.0f) green:(((rgb >> 8) & 0xff) / 255.0f) blue:(((rgb) & 0xff) /                              255.0f) alpha:1.0f])
#define UIColorRGBA(rgb,a) ([[UIColor alloc] initWithRed:(((rgb >> 16) & 0xff) / 255.0f) green:(((rgb >> 8) & 0xff) / 255.0f) blue:(((rgb) & 0xff) /                      255.0f) alpha:a])
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]


#define Fit(height) (IS_PAD ? (height) : (height) * 0.8)
// 屏幕 尺寸
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define ScreenW [UIScreen mainScreen].bounds.size.width
// 导航栏高度
#define TKNavHeight (IS_IPHONE ? 45 : 60)

//新版布局  4.0
#define KNewLayoutVideoSpace    Fit(5)
#define KNewLayoutScreenWidth   (ScreenW - 2 * KNewLayoutRightSpece)
#define KNewLayoutDefaultSpace  Fit(10)  //默认间距
#define KNewLayoutRightSpece    (IS_IPHONE_X ?  44 : Fit(10))//和顶部的上课按钮对齐
#define TKNavStatusBarH (IS_IPHONE_X ? 44 : 10)

//顶底布局 视频比例 1:5.5
#define TKVideoUpDownLayoutScale 5.5

// 屏幕比例，相对pad 1024 * 768
#define Proportion (ScreenH/768.0)
#define TKMainWindow  [UIApplication sharedApplication].keyWindow
#define TKScreenScale [UIScreen mainScreen].scale

#define IS_IPHONE_X ([TKUtil isiPhoneX] && IS_IPHONE)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_PAD (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)

// 系统判定
#define iOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define iOS7Later ([UIDevice currentDevice].systemVersion.floatValue >= 7.0f)
#define iOS8Later ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
#define iOS9Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.0f)
#define iOS9_1Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.1f)
#define iOS10_0Later ([UIDevice currentDevice].systemVersion.floatValue >= 10.0f)

// 引用
#define tk_weakify(var)   __weak typeof(var) weakSelf = var
#define tk_strongify(var) __strong typeof(var) strongSelf = var

// 字体
#define TKFont(s) [UIFont systemFontOfSize:s]
// >9.0
//[UIFont fontWithName:@"PingFang-SC-Light" size:s]

#define TITLE_FONT TKFont(16)
#define TEXT_FONT  TKFont(14)
#define IS_CH_SYMBOL(chr) ((int)(chr)>127)

// 最大小视频数量
#define sMaxVideo  7

#define TK_BUNDLE_NAME @"TKResources.bundle"
#define TK_FRAMEWORK_NAME @"TKUISDK.framework"

#define FrameworkPath  [[NSBundle mainBundle] pathForResource:@"Frameworks/TKUISDK" ofType:@"framework"]
#define FrameworkBundle  [NSBundle bundleWithPath:FrameworkPath]
#define TK_BUNDLE [NSBundle bundleWithPath: [[FrameworkBundle resourcePath] stringByAppendingPathComponent: TK_BUNDLE_NAME]]

#define LOADIMAGE(name) [UIImage imageWithContentsOfFile:[[TK_BUNDLE resourcePath] stringByAppendingPathComponent:name]]
#define LOADWAV(name) [[TK_BUNDLE resourcePath] stringByAppendingPathComponent:name]

#define TKMTLocalized(s) [TK_BUNDLE localizedStringForKey:s value:@"" table:nil]

// 奖杯
#define TrophyImgPath(companyid, name)      [NSString stringWithFormat:@"Trophy/%@/%@/trophyimg",companyid,name]
#define TrophyGifPath(companyid, name)      [NSString stringWithFormat:@"Trophy/%@/%@/icon",companyid,name]
#define TrophyAudioPath(companyid, name) [NSString stringWithFormat:@"Trophy/%@/%@/trophyvoice.wav",companyid,name]


// 友盟统计 AppKey
#define kUMAnalyticsKey ((IS_PAD) ? @"5ec3b680167edd3d63000028" : @"5ec4a829167edd1e170001a6")

#define kUMAnalyticsKey_iPhone @"5ec4a829167edd1e170001a6"
#define kUMAnalyticsKey_iPad   @"5ec3b680167edd3d63000028"

/// [TKEduSessionHandle shareInstance]
#define TK_ESH [TKEduSessionHandle shareInstance]
/// [TKEduClassRoom shareInstance]
#define TK_ECR [TKEduClassRoom shareInstance]
/// [TKEduSessionHandle shareInstance].fileManager
#define TK_EFManager TK_ESH.fileManager

static  NSString *const sMobile                       = @"mobile";//拍照上传入口
static  NSString *const sLowConsume                 = @"LowConsume";

// 信令
static  NSString *const sPubMsg                     = @"pubMsg";//发送信令
static  NSString *const sDelMsg                     = @"delMsg";//删除信令

static  NSString *const sClassBegin                 = @"ClassBegin";//上课
static  NSString *const sStreamFailure              = @"StreamFailure";
static  NSString *const sAllAll                     = @"__AllAll";
static  NSString *const sVideoDraghandle            = @"videoDraghandle";//视频拖拽
static  NSString *const sDoubleClickVideo           = @"doubleClickVideo";//双击视频
static  NSString *const sVideoZoom                  = @"VideoChangeSize";//视频缩放
static  NSString *const sChangeServerArea           = @"RemoteControl";// 助教协助切换服务器（课件服务器）
static  NSString *const sServerName                 = @"servername";//助教协助切换服务器（优选网络）
static  NSString *const sUpdateTime                 = @"UpdateTime";
static  NSString *const sMuteAudio                  = @"allMute";// 全体静音
static  NSString *const sAllTurnPage                = @"allTurnPage";//全体翻页
static  NSString *const sEveryoneBanChat            = @"EveryoneBanChat";//全体禁言
static  NSString *const sStudentGotoLookPlayback    = @"studentGotoLookPlayback";//学生课中离开去看回放
static  NSString *const sWBFullScreen               = @"FullScreen";// 全屏
static  NSString *const sBigRoom                    = @"BigRoom";// 大并发
static  NSString *const sTimer                      = @"timer";// 计时器
static  NSString *const sSwitchLayout               = @"switchLayout";// 布局切换
static  NSString *const sVideoDisk                  = @"videoDisk";   // 视频轮盘
static  NSString *const sAllGraffitiPermissions     = @"AllGraffitiPermissions";   //全体涂鸦

// 白板信令
static  NSString *const sWBPageCount                = @"WBPageCount";//加页
static  NSString *const sShowPage                   = @"ShowPage";//显示文档
static  NSString *const sDocumentFilePage_ShowPage  = @"DocumentFilePage_ShowPage";//ShowPage ID
static  NSString *const sActionShow                 = @"show";
static  NSString *const sSharpsChange               = @"SharpsChange";//画笔
static  NSString *const sDocumentChange             = @"DocumentChange";//添加或删除文档
static  NSString *const sOnPageFinished             = @"onPageFinished";
static  NSString *const sChangeWebPageFullScreen    = @"changeWebPageFullScreen";//白板放大事件
static  NSString *const sOnJsPlay                   = @"onJsPlay";
static  NSString *const scloseDynamicPptWebPlay     = @"closeDynamicPptWebPlay";//closeNewPptVideo更改为closeDynamicPptWebPlay

// 用户属性
static  NSString *const sRole                       = @"role";//角色
static  NSString *const sRaisehand                   = @"raisehand"; // 举手
static  NSString *const sPrimaryColor                = @"primaryColor";//画笔颜色值
static  NSString *const sPublishstate               = @"publishstate";//发布状态
static  NSString *const sGiftNumber                 = @"giftnumber";
static  NSString *const sType                       = @"type";//扣除奖杯属性-1
static  NSString *const sTKVersion                  = @"tk_version";//用户属性中添加的版本号，用来兼容老版本
static  NSString *const sTKLowConsume               = @"tk_lowConsume";//用户属性中添加的设备类型（低配 0 非低配 1），用来兼容老设备
static  NSString *const sGiftinfo                   = @"giftinfo";
static  NSString *const sDisablechat                = @"disablechat";// 禁言
static  NSString *const sInblacklist                = @"inblacklist";// 加入黑名单
static  NSString *const sCandraw                    = @"candraw";    // 画笔
static  NSString *const sCanupload                  = @"canupload";  // 上传
static  NSString *const sCanTurnPage                = @"canTurnPage";// 翻页
static  NSString *const sTotalauthority             = @"totalauthority";// 主讲
static  NSString *const sCanShare                   = @"canshare";// 屏幕共享
static  NSString *const sCancelDesktopShare         = @"cancelDesktopShare";// 关闭屏幕共享
static  NSString *const sUdpState                   = @"udpstate";//UDP状态发生变化，1是畅通，2是防火墙导致不畅通
static  NSString *const sVolume                     = @"volume";
static  NSString *const sDisableVideo               = @"disablevideo";
static  NSString *const sDisableAudio               = @"disableaudio";
static  NSString *const sFromId                     = @"fromId";
static  NSString *const sUser                        = @"User";
static  NSString *const sIsInBackGround              = @"isInBackGround";
static  NSString *const sDisableQuestion            = @"disableQuestion";
static  NSString *const sControlStudentSpeakers     = @"ControlStudentSpeakers";

// 工具箱 - 抢答器
static  NSString *const sQiangDaQi                  = @"qiangDaQi";
static  NSString *const sQiangDaQiMesg              = @"qiangDaQiMesg";
static  NSString *const sQiangDaZhe                 = @"QiangDaZhe";
static  NSString *const sResponderDrag              = @"ResponderDrag";
static  NSString *const sActionID                   = @"actionID";

// 自定义
static  NSString *const sNeedPictureInPictureSmall  = @"needPictureInPictureSmall";

// 通知对象
static  NSString *const sTellAll                    = @"__all";//所有人
static  NSString *const sTellNone                   = @"__none";
static  NSString *const sTellAllExpectSender        = @"__allExceptSender";//除自己以外的所有人
static  NSString *const sTellAllExpectAuditor       = @"__allExceptAuditor";//除旁听用户以外的所有人
static  NSString *const sTellAllExceptAuditorAndSender = @"__allExceptAuditorAndSender";//除自己和旁听外的所有人
static  NSString *const sSuperUsers                 = @"__allSuperUsers";

//小白板
static  NSString *const sAssociatedMsgID            = @"associatedMsgID";
static  NSString *const sName                       = @"name";
static  NSString *const s_Prepareing                = @"_prepareing";
static  NSString *const s_Dispenseed                = @"_dispenseed";
static  NSString *const s_Recycle                   = @"_recycle";
static  NSString *const s_AgainDispenseed           = @"_againDispenseed";

static  NSString *const sBlackBoardState            = @"blackBoardState";
static  NSString *const sCurrentTapKey              = @"currentTapKey";
static  NSString *const sCurrentTapPage             = @"currentTapPage";

static  NSString *const sBlackBoard_new             = @"BlackBoard_new";
static  NSString *const sUserHasNewBlackBoard       = @"UserHasNewBlackBoard";
static  NSString *const sWhiteboardID               = @"whiteboardID";
static  NSString *const sMiniBlackBoard_upload_Student      = @"MiniBlackBoard_upload_Student";
static  NSString *const sMiniBlackBoard_upload      = @"MiniBlackBoard_upload";

static  NSString *const sBlackBoardCommon           = @"blackBoardCommon";

// 布局
static  NSString *const sLayout_VideoTop         = @"CoursewareDown";
static  NSString *const sLayout_VideoDown        = @"VideoDown";
static  NSString *const sLayout_VideoLeft        = @"VideoLeft";
static  NSString *const sLayout_VideoLeft_1      = @"_Bilateral";
static  NSString *const sLayout_VideoRight       = @"Encompassment";
static  NSString *const sLayout_VideoRight_1     = @"Bilateral";
static  NSString *const sLayout_OnlyVideo        = @"OnlyVideo";
static  NSString *const sLayout_MainPeople       = @"MainPeople";

static  NSString *const sLayout_one_right        = @"oneToOne";
static  NSString *const sLayout_one_Left         = @"oneToOneLeft";
static  NSString *const sLayout_one_Division     = @"oneToOneDoubleDivision";
static  NSString *const sLayout_one_Video        = @"oneToOneDoubleVideo";

// 播放mp3，mp4
static  NSString *const sVideo_MediaFilePage_ShowPage   = @"Video_MediaFilePage_ShowPage";
static  NSString *const sAudio_MediaFilePage_ShowPage   = @"Audio_MediaFilePage_ShowPage";

//白板类型
static  NSString *const sVideoWhiteboard                = @"VideoWhiteboard";

//拍摄照片、选择照片上传
static  NSString *const sTakePhotosUploadNotification   = @"sTakePhotosUploadNotification";
static  NSString *const sChoosePhotosUploadNotification = @"sChoosePhotosUploadNotification";

static NSString *const kTKMethodNameKey = @"TKCacheMsg_MethodName"; //缓存函数名
static NSString *const kTKParameterKey = @"TKCacheMsg_Parameter";  //缓存参数

// 被T时间
static NSString *const TKKickTime = @"TKKickTime";
static NSString *const TKKickRoom = @"TKKickRoom";

// 上下台时间间隔标识符
static NSString *const TKUnderPlatformTime = @"TKUnderPlatformTime";


// 通知sEveryoneBanChat
static NSString *const TK_BanChat_Noti                 = @"BanChatNoti";//禁言

static NSString *const TK_QA_BanChat_Noti                 = @"BanQAChatNoti";//禁言

static NSString *const TK_Quesionaire_StopAnswer_Noti         = @"QuestionaireStopAnswer";//终止作答

static NSString *const TKHaveOpenedFileList = @"HAVE OPENED FILE LIST";

static NSString *const TKFileRename = @"FileRename";    // 文件重命名

//签到
static NSString *const sSignIn                  = @"InitSignIn";

static NSString *const sUserSignIn                  = @"UserSignIn";

//公告
static NSString *const sLiveRoomNotice          = @"LiveRoomNoticeInform";

//问答
static NSString *const sQAMsg                   = @"questionAnswer";

//问卷
static NSString *const sQuestionaireIn            = @"QuestionnaireIn";

//视频隔离
static NSString *const sVideoIsolation            = @"VideoISolation";

//音频隔离
static NSString *const sAudioIsolation            = @"AutioIsolation";
//双摄视频框切换
static NSString *const sLiveSwitchDualVideo       = @"LiveSwitchDualVideo";
//直播双摄 辅摄隐藏
static NSString *const sLiveHideVideo             = @"LiveHideVideo";
#endif /* TKMacro_h */


#endif /* testMarco_h */

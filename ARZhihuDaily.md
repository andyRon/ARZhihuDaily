
### 对[zhihuDaily]
(https://github.com/beyanger/zhihuDaily)的分析

-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
Objective C                    141           5249           2177          20111
JSON                           380              0              0           8196
C/C++ Header                   151           3180           6618           2956
-------------------------------------------------------------------------------
SUM:                           672           8429           8795          31263
-------------------------------------------------------------------------------

- Theme  用户关注的主题内容
Model
    SYThemeItem
    SYEditor            编辑
    SYRecommenderResult  推荐结果
    SYRecommenderItem
Controller
    SYStoryListController     故事（或新闻）列表控制器
    SYThemeController         编辑列表控制器
    SYEditorDetailController  编辑（或推荐者）介绍页控制器
    SYRecommendController      每篇文章详情页最上的推荐者点击后列表页控制器
    SYCollectionController     收藏页

- Home 
Model
    SYStory

    SYDetailStory
    SYExtraStory
    SYComment
    SYReplyComment
    SYRecommender           推荐者
    SYCommentParam
Controller
    SYHomeController        
    SYDetailController
    SYWebViewController
    SYCommentsController
View
    SYTableViewCell         故事列表页的cell
    SYTopView               故事详情页顶部
    SYStoryNavigationView   故事详情页底部导航栏
    SYImageView             故事详情页图片展示时页面
    SYLoadingLayer
    SYShareView             故事详情分享页面
    SYCommentCell           故事评论的cell
    SYCommentPannel         故事的点赞，举报等
    SYCommentView           故事详情页写点评条
    SYHomeHeaderView
    SYPicturesView          首页顶部滚动图片页面
    SYTopImageView          首页顶部滚动单个图片
    SYRefreshView           首页和列表页顶部刷新菊花转

- LeftDrawer
    SYLeftDrawerController

- Main
Model 
    SYTheme
    SYVersion
View
    SYToolButton
Controller
    SYMainViewController
    SYDemoViewController
    SYNavigationController
    SYBaseViewController
    



### 知识点
MMDrawerController
Reachability  检测网络状态  

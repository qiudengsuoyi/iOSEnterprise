//
//                       _oo0oo_
//                      o8888888o
//                      88" . "88
//                      (| -_- |)
//                      0\  =  /0
//                    ___/`---'\___
//                  .' \\|     |// '.
//                 / \\|||  :  |||// \
//                / _||||| -:- |||||- \
//               |   | \\\  -  /// |   |
//               | \_|  ''\---/''  |_/ |
//               \  .-\__  '-'  ___/-. /
//             ___'. .'  /--.--\  `. .'___
//          ."" '<  `.___\_<|>_/___.' >' "".
//         | | :  `- \`.;`\ _ /`;.`/ - ` : | |
//         \  \ `_.   \_ __\ /__ _/   .-` /  /
//     =====`-.____`.___ \_____/___.-`___.-'=====
//                       `=---='
//
//
//     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//
//               佛祖保佑         永无BUG
//
//
//


#import "EnterpriseBaseController.h"
#import "KeyValueEntity.h"
#import "OrderListEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface WaitTaskListController : EnterpriseBaseController
@property NSInteger pageType;
@property NSMutableArray<OrderListEntity*>*muKeyValueList;
@property NSString * currentYear;
@property NSString * currentMonth;
@property NSString * Brand;
@property NSString * InstallState;
@end

NS_ASSUME_NONNULL_END
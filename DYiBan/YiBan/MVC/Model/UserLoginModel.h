//
//  UserLoginModel.h
//  Yiban
//
//  Created by NewM on 12-12-10.
//
//

#import <Foundation/Foundation.h>

//当前登录的用户的信息
@interface UserLoginModel : DragonJSONReflection
@property (nonatomic, retain)NSString *userId,*sessID,*autoLogin,*userName;
@property (nonatomic, retain)NSString *lastTime;

- (id)initDict:(NSMutableDictionary *)dict;
- (NSMutableDictionary *)retunDict;
@end

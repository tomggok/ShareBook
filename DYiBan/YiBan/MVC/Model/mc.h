//
//  mc.h
//  magic
//
//  Created by 周 哲 on 12-11-3.
//
//

#import <Foundation/Foundation.h>
#import "user.h"
//#import "Jastor.h"
#import "target.h"

//mc 评论提醒 接口

@interface mc : MagicJSONReflection
@property(retain,nonatomic) NSString *id; //消息id
@property(retain,nonatomic) NSString * title;//消息标题
@property(retain, nonatomic) NSString * content;//at内容
@property (retain,nonatomic) NSString *pic;//内容图片
@property(retain,nonatomic) NSString * status_id;//动态id
@property(retain,nonatomic)NSString * status_type;//动态类型
@property(assign,nonatomic)int time;//消息产生时间
@property(assign,nonatomic)int  view;//是否已读 1 已读 0未读
@property(retain,nonatomic)user * user_info;//当前登陆用户
@property (retain,nonatomic) NSArray *target;
//+(Class)target_class;
@end

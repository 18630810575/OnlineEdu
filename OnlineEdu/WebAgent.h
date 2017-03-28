//
//  WebAgent.h
//  OnlineEdu
//
//  Created by 孙锐 on 2017/3/27.
//  Copyright © 2017年 孙锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebAgent : NSObject


+(void)getUserInfoDemo:(NSString *)param
                              success:(void (^)(id responseObject))success
                              failure:(void (^)(NSError *error))failure;



@end

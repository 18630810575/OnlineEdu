//
//  WebAgent.m
//  OnlineEdu
//
//  Created by 孙锐 on 2017/3/27.
//  Copyright © 2017年 孙锐. All rights reserved.
//

#import "WebAgent.h"
#import "APIClient.h"
@implementation WebAgent


+(void)getUserInfoDemo:(NSString *)param
               success:(void (^)(id responseObject))success
               failure:(void (^)(NSError *error))failure{

    NSDictionary *dict = @{@"param":param};
    [[APIClient sharedClient] POST:@"user/getInfoDemo/" parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}


@end

//
//  APIClient.h
//  OnlineEdu
//
//  Created by 孙锐 on 2017/3/27.
//  Copyright © 2017年 孙锐. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface APIClient : AFHTTPSessionManager


+(instancetype)sharedClient;

@end

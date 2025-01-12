//
//  WeatherSessionService.m
//  WeatherApp_V01
//
//  Created by Mac on 12/01/2025.
//

#import "WeatherSessionService.h"
#import "WeatherAPI.h"
#import "WeatherClass.h"

@implementation WeatherSessionService

+ (instancetype)sharedManager {
    static WeatherSessionService *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype) init {
    self = [super init];
    
    _weatherAPI = [[WeatherAPI alloc] init];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    _session = [NSURLSession sessionWithConfiguration:config
                                             delegate:nil
                                        delegateQueue:nil];
    
    //    [self fetchWeather];
    
    return self;
}

- (void) fetchWeather: (WeatherCompletionHandler)completion{
    NSURL *url = [NSURL URLWithString:[_weatherAPI weatherApiURL:_weatherAPI.defaultUrlParams]];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:req
                                                     completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //        NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //        NSLog(@"%@", json);
        if(error)
        {
            completion(nil, error);
            return;
        }
        NSError *jsonError;
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            completion(nil, jsonError);
            return;
        }
        
        WeatherClass *weather = [[WeatherClass alloc] initWithDictionary:jsonObject];
        completion(weather, nil);
        
//        NSLog(@"%@", jsonObject);
    }];
    
    [dataTask resume];
}

@end

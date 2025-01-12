//
//  WeatherSessionService.h
//  WeatherApp_V01
//
//  Created by Mac on 12/01/2025.
//

#import <Foundation/Foundation.h>
@class WeatherAPI;
@class WeatherClass;

//NS_ASSUME_NONNULL_BEGIN

typedef void (^WeatherCompletionHandler)(WeatherClass *weather, NSError *error);

@interface WeatherSessionService : NSObject

@property (nonatomic) WeatherAPI *weatherAPI;
@property (nonatomic) NSURLSession *session;

+ (instancetype)sharedManager;
- (void) fetchWeather: (WeatherCompletionHandler)completion;

//- (void) fetchWeather: (NSString*) cityName completion:(WeatherCompletionHandler)completion;

@end

//NS_ASSUME_NONNULL_END

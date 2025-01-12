//
//  WeatherAPI.h
//  WeatherApp_V01
//
//  Created by Mac on 12/01/2025.
//

#import <Foundation/Foundation.h>



@interface WeatherAPI : NSObject

@property (nonatomic, readonly) NSMutableString *openWeatherBaseURL;
@property (nonatomic, copy, readonly) NSString *apiKey;
@property (nonatomic) NSDictionary *defaultUrlParams;

- (NSString*) weatherApiURL: (NSDictionary *) urlParams;

@end



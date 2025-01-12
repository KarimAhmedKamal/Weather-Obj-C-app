//
//  WeatherAPI.m
//  WeatherApp_V01
//
//  Managing openWeather API
//

#import "WeatherAPI.h"

@implementation WeatherAPI

- (instancetype) init {
    
    self = [super init];
    if (self) {
        _openWeatherBaseURL = [[NSMutableString alloc] init];
        [_openWeatherBaseURL appendString:@"https://api.openweathermap.org/data/2.5/weather?"];
        
        _apiKey = @"474afc73c0411b235ae97d59e7394b7a";
        
        // Cairo (Celisuis)
        _defaultUrlParams = @{ @"lat"   : @"30.0626",
                               @"lon"   : @"31.2497",
                               @"units" : @"metric"
        };
    }
    return self;
}

- (NSString*) weatherApiURL: (NSDictionary *) urlParams {
    
    if (!urlParams || [urlParams count] == 0) {
        // Handle case where no parameters are provided
        return _openWeatherBaseURL; // Return base URL if no parameters
    }
    
    NSMutableString *completeURL = [[NSMutableString alloc] init];
    if(completeURL) {
        [completeURL appendString:_openWeatherBaseURL];
        
        for(id key in urlParams) {
            NSString *tempString = [NSString stringWithFormat:@"%@=%@&" , key , urlParams[key]];
            [completeURL appendString:tempString];
        }
        
        // remove redundant '&' cahr from the URL
        //    NSRange range = NSMakeRange([_openWeatherBaseURL length] - 1, 1); // Last character range
        //    [_openWeatherBaseURL deleteCharactersInRange:range];
        
        // append api key
        NSString *tempString = [NSString stringWithFormat:@"appid=%@" ,_apiKey];
        [completeURL appendString:tempString];
        
        return  completeURL;
    }
    return _openWeatherBaseURL;
}

@end

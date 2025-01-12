//
//  WeatherClass.m
//  WeatherApp_V01
//
//  Created by Mac on 12/01/2025.
//

#import "WeatherClass.h"


@implementation WeatherClass

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    if (self) {
        _cityLbl = dict[@"name"];
        NSDictionary *main = dict[@"main"];
        _currentLbl = [NSString stringWithFormat:@"%.0f°C", [main[@"temp"] floatValue]];
        _highLbl = [NSString stringWithFormat:@"H: %.0f°C", [main[@"temp_max"] floatValue]];
        _lowLbl = [NSString stringWithFormat:@"L: %.0f°C", [main[@"temp_min"] floatValue]];
        
        NSArray *weatherArray = dict[@"weather"];
        if (weatherArray.count > 0) {
            _weatherImg = weatherArray[0][@"icon"];
        }
    }
    
    return self;
}

@end



/*
 {
   "name": "San Francisco",
   "main": {
     "temp": 72.5,
     "temp_min": 68.0,
     "temp_max": 75.0
   },
   "weather": [
     {
       "id": 800,
       "main": "Clear",
       "description": "clear sky",
       "icon": "01d"
     }
   ]
 }
 */

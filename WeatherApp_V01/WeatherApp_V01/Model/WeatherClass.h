//
//  WeatherClass.h
//  WeatherApp_V01
//
//  Created by Mac on 12/01/2025.
//

#import <Foundation/Foundation.h>



@interface WeatherClass : NSObject

@property (nonatomic, copy)  NSString *cityLbl;
@property (nonatomic, copy)  NSString *weatherImg;
@property (nonatomic, copy)  NSString *currentLbl;
@property (nonatomic, copy)  NSString *lowLbl;
@property (nonatomic, copy)  NSString *highLbl;

- (instancetype)initWithDictionary:(NSDictionary *)dict; // To save JSON response to the instance of the class

@end



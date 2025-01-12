//
//  ViewController.h
//  WeatherApp_V01
//
//  Created by Mac on 11/01/2025.
//

// requirements
// 1- Create a simple StoryBoard UI --> (DONE)
// 2- Create a Model class for current day Corresponding to what should the user see (for my first implementation)
// 3- Create a class for the URL and methods can be sent to the server
// 4- Create a class for the needed data requesting using URLSession

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *cityLbl;
@property (nonatomic, weak) IBOutlet UIImageView *weatherImg;
@property (nonatomic, weak) IBOutlet UILabel *currentLbl;
@property (nonatomic, weak) IBOutlet UILabel *lowLbl;
@property (nonatomic, weak) IBOutlet UILabel *highLbl;


@end


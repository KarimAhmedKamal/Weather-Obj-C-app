//
//  ViewController.m
//  WeatherApp_V01
//
//  Created by Mac on 11/01/2025.
//

#import "ViewController.h"
#import "Model/WeatherClass.h"
#import "Model/WeatherSessionService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchWeather];

    // Do any additional setup after loading the view.
//    WeatherAPI *test = [[WeatherAPI alloc] init];
//    NSLog(@"hellooooooo:\n%@", [test weatherApiURL:test.defaultUrlParams]);
    
//    WeatherSessionService *sessionTEST = [[WeatherSessionService alloc] init];
//    [sessionTEST fetchWeather];
}

- (void)updateUIWithWeather:(WeatherClass *)weather {
    self.cityLbl.text = weather.cityLbl;
    self.currentLbl.text = weather.currentLbl;
    self.highLbl.text = weather.highLbl;
    self.lowLbl.text = weather.lowLbl;

    // Update the image view (assuming the icon images are named like "01d.png")
    self.weatherImg.image = [UIImage imageNamed:weather.weatherImg];
}

- (void)fetchWeather {

    [[WeatherSessionService sharedManager] fetchWeather: ^(WeatherClass *weather, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                self.cityLbl.text = @"Error fetching data";
                NSLog(@"Error: %@", error.localizedDescription);
                return;
            }

            [self updateUIWithWeather:weather];
        });
    }];
}

/*
 @property (nonatomic, weak) IBOutlet UILabel *cityLbl;
 @property (nonatomic, weak) IBOutlet UIImageView *weatherImg;
 @property (nonatomic, weak) IBOutlet UILabel *currentLbl;
 @property (nonatomic, weak) IBOutlet UILabel *lowLbl;
 @property (nonatomic, weak) IBOutlet UILabel *highLbl;
 */


@end

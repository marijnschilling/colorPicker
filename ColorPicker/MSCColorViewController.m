//
//  MSCColorViewController.m
//  ColorPicker
//
//  Created by Marijn Schilling on 26/02/14.
//  Copyright (c) 2014 Marijn Schilling. All rights reserved.
//

#import "MSCColorViewController.h"
#import "MSCColorView.h"
#import <LEColorPicker.h>

@interface MSCColorViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *showsScrollView;

@property (weak, nonatomic) IBOutlet UIPageControl *showPageControl;

@property (strong, nonatomic, readonly) MSCColorView *colorView;

@end

@implementation MSCColorViewController

- (MSCColorView *)colorView
{
    return (MSCColorView *) self.view;
}

- (void)loadView
{
    self.view = [[MSCColorView alloc] initWithFrame:[UIScreen mainScreen].bounds];


    UIImage *catPhoto = [UIImage imageNamed:@"5.jpg"];

    NSParameterAssert(catPhoto);

    LEColorPicker *colorPicker = [[LEColorPicker alloc] init];
    LEColorScheme *colorScheme = [colorPicker colorSchemeFromImage:catPhoto];
    self.view.backgroundColor = [UIColor whiteColor];


    UIColor *color1 = [colorScheme backgroundColor];
    UIColor *color2 = [colorScheme primaryTextColor];
    UIColor *color3 = [colorScheme secondaryTextColor];

    [self.colorView setColor1:color1 color2:color2 color3:color3];
    [self.colorView setImage:catPhoto];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pageChanged:(id)sender {
}


@end

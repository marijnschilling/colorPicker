#import "UIColor+MSCMaximizeColor.h"

@implementation UIColor (MSCMaximizeColor)

- (UIColor *)compareColorWith:(UIColor *)color
{
    NSInteger difference1 = [self getDIfferenceOfRGBValuesOfColor];
    NSInteger difference2 = [color getDIfferenceOfRGBValuesOfColor];

    UIColor * color2;

    if (difference1 > difference2)
    {
        if (difference1 < 50)
        {
            color2 = [self maximizeColor];
        }
        return color2;
    }
    else
    {
        if (difference2 < 50)
        {
            color = [color maximizeColor];
        }
        return color;
    }
}

- (UIColor *)maximizeColor
{
    NSMutableArray *rgbArray = [self getRGBValues];

    NSInteger red = [[rgbArray objectAtIndex:0] integerValue];
    NSInteger green = [[rgbArray objectAtIndex:1] integerValue];
    NSInteger blue = [[rgbArray objectAtIndex:2] integerValue];

    if (red < 100 && green < 100 && blue < 100)
    {
        red += 50;
        green += 50;
        blue += 50;
    }

    if (red >= green && red >= blue)
    {
        red += 10;
    }
    else if (green >= red && green >=blue)
    {
        green += 10;
    }
    else if (blue >= red && blue >= green)
    {
        blue += 10;
    }

    UIColor *maximizedColor;
    maximizedColor = [UIColor colorWithRed:(CGFloat) red / 255.0 green:(CGFloat) green / 255.0 blue:(CGFloat) blue / 255.0 alpha:1];

    return maximizedColor;
}

- (NSInteger)getDIfferenceOfRGBValuesOfColor
{
    NSInteger difference = 0;

    NSMutableArray *rgbArray = [[NSMutableArray alloc] init];
    rgbArray = [self getRGBValues];

    NSInteger red = [[rgbArray objectAtIndex:0] integerValue];
    NSInteger green = [[rgbArray objectAtIndex:1] integerValue];
    NSInteger blue = [[rgbArray objectAtIndex:2] integerValue];

    NSInteger difRG = 0;
    difRG = red - green;
    NSInteger difGB = 0;
    difGB = blue - green;
    difference = ABS(difRG) + ABS(difGB);

    return difference;
}

- (NSMutableArray *)getRGBValues
{
    NSMutableArray *array = [[NSMutableArray alloc] init];

    CGFloat red = 0;
    CGFloat green = 0;
    CGFloat blue = 0;
    CGFloat alpha = 0;

    [self getRed:&red green:&green blue:&blue alpha:&alpha];

    NSUInteger r = (NSUInteger) (red * 0xff);
    NSUInteger g = (NSUInteger) (green * 0xff);
    NSUInteger b = (NSUInteger) (blue * 0xff);

    NSNumber *rWrapped = [NSNumber numberWithInt:r];
    NSNumber *gWrapped = [NSNumber numberWithInt:g];
    NSNumber *bWrapped = [NSNumber numberWithInt:b];

    [array addObject:rWrapped];
    [array addObject:gWrapped];
    [array addObject:bWrapped];

    return array;
}

@end
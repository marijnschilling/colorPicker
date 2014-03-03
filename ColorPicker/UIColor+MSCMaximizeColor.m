#import "UIColor+MSCMaximizeColor.h"

@implementation UIColor (MSCMaximizeColor)

- (UIColor *)msc_compareColorWith:(UIColor *)color
{
    NSInteger difference1 = [self msc_differenceOfRGBValues];
    NSInteger difference2 = [color msc_differenceOfRGBValues];

    if (difference1 > difference2)
    {
        if (difference1 < 0)
        {
            [self msc_maximizeColor];
        }
        return self;
    }
    else
    {
        if (difference2 < 0)
        {
            color = [color msc_maximizeColor];
        }
        return color;
    }
}

- (UIColor *)msc_maximizeColor
{
    NSMutableArray *rgbArray = [self msc_arrayOfRGBValues];

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

- (NSInteger)msc_differenceOfRGBValues
{
    NSInteger difference = 0;

    NSMutableArray *rgbArray = [[NSMutableArray alloc] init];
    rgbArray = [self msc_arrayOfRGBValues];

    NSInteger red = [[rgbArray objectAtIndex:0] integerValue];
    NSInteger green = [[rgbArray objectAtIndex:1] integerValue];
    NSInteger blue = [[rgbArray objectAtIndex:2] integerValue];

    NSInteger difRG = 0;
    difRG = red - green;
    NSInteger difGB = 0;
    difGB = green - blue;
    NSInteger difBR = 0;
    difBR = blue - red;
    difference = ABS(difRG) + ABS(difGB) + ABS(difBR);

    return difference;
}

- (NSArray *)msc_arrayOfRGBValues
{
    NSMutableArray *array = [[NSMutableArray alloc] init];

    CGFloat red = 0;
    CGFloat green = 0;
    CGFloat blue = 0;
    CGFloat alpha = 0;

    [self getRed:&red green:&green blue:&blue alpha:&alpha];

    NSNumber *rWrapped = @(red * 0xff);
    NSNumber *gWrapped = @(green * 0xff);
    NSNumber *bWrapped = @(blue * 0xff);

    [array addObject:rWrapped];
    [array addObject:gWrapped];
    [array addObject:bWrapped];

    return array;
}

@end
#import "MSCColorView.h"

@interface MSCColorView ()
@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) NSMutableArray *colorArray;
@end

@implementation MSCColorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self)
    {
        CGRect imageFrame = CGRectInset(self.bounds, 50, 50);
        self.imageView = [[UIImageView alloc] initWithFrame:imageFrame];
        self.imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self addSubview:self.imageView];
        self.colorArray = [[NSMutableArray alloc] init];
    }

    return self;
}

- (void)setColor1:(UIColor *)color1 color2:(UIColor *)color2 color3:(UIColor *)color3
{
    [self.colorArray addObject:color1];
    [self.colorArray addObject:color2];
    [self.colorArray addObject:color3];

    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGRect rect1 = CGRectMake(40, 0, 50, 50);
    CGRect rect2 = CGRectMake(100, 0, 50, 50);
    CGRect rect3 = CGRectMake(160, 0, 50, 50);
    CGRect rect4 = CGRectMake(220, 0, 50, 50);

    [self drawRect:rect1 withColor:[self.colorArray objectAtIndex:0] context:context];
    [self drawRect:rect2 withColor:[self.colorArray objectAtIndex:1] context:context];
    [self drawRect:rect3 withColor:[self.colorArray objectAtIndex:2] context:context];

    UIColor *luminousColor = [self mostLuminousColor:self.colorArray];

    [self drawRect:rect4 withColor:luminousColor context:context];
}

- (UIColor *)mostLuminousColor:(NSMutableArray *)array
{
    UIColor *result;

    UIColor *mostLuminous = [UIColor whiteColor];
    for (int j = 0; j < array.count; j++)
    {
        mostLuminous = [self compareColor:mostLuminous withOtherColor:[array objectAtIndex:j]];
    }

    return result;
}

- (UIColor *)compareColor:(UIColor *)color1 withOtherColor:(UIColor *)color2
{
    UIColor *luminous;

    NSMutableArray *rgbColor1;
    rgbColor1 = [[NSMutableArray alloc] init];
    NSMutableArray *rgbColor2;
    rgbColor2 = [[NSMutableArray alloc] init];

    rgbColor1 = [self getRGBValuesOfColor:color1];
    rgbColor2 = [self getRGBValuesOfColor:color2];

    return luminous;
}

- (NSMutableArray *)getRGBValuesOfColor:(UIColor *)color
{
    NSMutableArray *rgbArray;
    rgbArray = [[NSMutableArray alloc] init];

    CGFloat red = 0;
    CGFloat green = 0;
    CGFloat blue = 0;
    CGFloat alpha = 0;

    NSUInteger r;
    NSUInteger g;
    NSUInteger b;

    if ([color getRed:&red green:&green blue:&blue alpha:&alpha])
    {
        r = (NSUInteger) (red * 0xff);
        g = (NSUInteger) (green * 0xff);
        b = (NSUInteger) (blue * 0xff);

        [rgbArray addObject:[NSNumber numberWithUnsignedInteger:r]];
        [rgbArray addObject:[NSNumber numberWithUnsignedInteger:g]];
        [rgbArray addObject:[NSNumber numberWithUnsignedInteger:b]];
    }

    return rgbArray;
}

- (void)drawRect:(CGRect)rect withColor:(UIColor *)color context:(CGContextRef)context
{
    // Make sure the UIView's background is set to clear either in code or in a storyboard/nib


    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextAddArc(context, CGRectGetMidX(rect), CGRectGetMidY(rect), CGRectGetWidth(rect) / 2, 0, 2 * M_PI, YES);

    CGContextDrawPath(context, kCGPathFillStroke);
}

- (void)setImage:(UIImage *)image
{
    [self.imageView setImage:image];
}

@end
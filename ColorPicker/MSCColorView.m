#import "MSCColorView.h"

@interface MSCColorView ()
@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) NSMutableArray * colorArray;
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

    [self drawRect:rect1 withColor:[self.colorArray objectAtIndex:0] context:context];
    [self drawRect:rect2 withColor:[self.colorArray objectAtIndex:1] context:context];
    [self drawRect:rect3 withColor:[self.colorArray objectAtIndex:2] context:context];

    //UIColor *luminousColor =
}

- (void)drawRect:(CGRect)rect withColor:(UIColor *)color context:(CGContextRef)context
{
    // Make sure the UIView's background is set to clear either in code or in a storyboard/nib


    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextAddArc(context, CGRectGetMidX(rect), CGRectGetMidY(rect), CGRectGetWidth(rect)/2, 0, 2*M_PI, YES);

    CGContextDrawPath(context, kCGPathFillStroke);
}

- (void)setImage:(UIImage *)image
{
    [self.imageView setImage:image];
}


//- (UIColor *)isMoreLuminantThan:(UIColor *)otherColor
//{
//    CGColorRef colorRef = [otherColor CGColor];
//
//    int numComponents = CGColorGetNumberOfComponents(colorRef);
//
//    CGFloat red;
//    CGFloat green;
//    CGFloat blue;
//    CGFloat alpha;
//
//    if (numComponents == 4)
//    {
//        const CGFloat *components = CGColorGetComponents(colorRef);
//        red = components[0];
//        green = components[1];
//        blue = components[2];
//        alpha = components[3];
//    }
//
//}

@end
#import "SVColorView.h"

@interface SVColorView ()
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic, strong) NSArray<UIColor *> *colorArray;
@end

@implementation SVColorView

- (instancetype)initWithColor:(UIColor *)color {
    self = [super init];
    if (self) {
        self.backgroundColor = color;
        [self setupColors];
        [self setupGesture];
        self.userInteractionEnabled = YES;  // 默认启用点击
    }
    return self;
}

- (void)setupColors {
    // 预定义一组好看的颜色
    self.colorArray = @[
        [UIColor systemRedColor],
        [UIColor systemBlueColor],
        [UIColor systemGreenColor],
        [UIColor systemOrangeColor],
        [UIColor systemPurpleColor],
        [UIColor systemPinkColor],
        [UIColor systemTealColor],
        [UIColor systemYellowColor],
        [UIColor systemIndigoColor]
    ];
}

- (void)setupGesture {
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
    [self addGestureRecognizer:self.tapGesture];
}

- (void)handleTap {
    // 随机选择一个颜色
    NSInteger randomIndex = arc4random_uniform((uint32_t)self.colorArray.count);
    UIColor *newColor = self.colorArray[randomIndex];
    
    // 确保不会选到相同的颜色
    while ([newColor isEqual:self.backgroundColor] && self.colorArray.count > 1) {
        randomIndex = arc4random_uniform((uint32_t)self.colorArray.count);
        newColor = self.colorArray[randomIndex];
    }
    
    // 使用动画改变颜色
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor = newColor;
    }];
}

@end 
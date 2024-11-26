//
//  CardView.m
//  kit
//
//  Created by 林文益 on 2024/11/26.
//

#import "CardView.h"
#import <Masonry/Masonry.h>

@interface CardView ()

@property (nonatomic, strong) UIView *cardView;           // 卡片背景
@property (nonatomic, strong) UILabel *title;              // 标题容器
@property (nonatomic, strong) UILabel *contentContainer;   // 内容容器
@property (nonatomic, strong) id obj;                    // 传入的对象

@end



@implementation CardView

// 根据传入的对象初始化
- (instancetype)initWithObj:(id)obj {
    self = [super init];
    NSLog(@"obj: %@", obj);
    if (self) {
        self.obj = obj;
    }
    
    [self setupUI];

    [self setupConstraints];

    return self;
};

- (void)setupUI {
    // 卡片背景
    self.cardView = [[UIView alloc] init];
    self.cardView.backgroundColor = [UIColor whiteColor];
    self.cardView.layer.cornerRadius = 12;
    self.cardView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.cardView.layer.shadowOffset = CGSizeMake(0, 2);
    self.cardView.layer.shadowOpacity = 0.1;
    self.cardView.layer.shadowRadius = 4;
    [self addSubview:self.cardView];

    // 标题
    self.title = [[UILabel alloc] init];
    self.title.text = [self.obj valueForKey:@"title"];
    self.title.font = [UIFont boldSystemFontOfSize:16];

    [self.cardView addSubview:self.title];

    // 内容
    self.contentContainer = [[UILabel alloc] init];
    self.contentContainer.text = [self.obj valueForKey:@"content"];
    self.contentContainer.numberOfLines = 2;
    self.contentContainer.lineBreakMode = NSLineBreakByTruncatingTail;
    self.contentContainer.font = [UIFont systemFontOfSize:14];

    [self.cardView addSubview:self.contentContainer];
    
}

- (void)setupConstraints {
    // 卡片背景
    [self.cardView mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.equalTo(self);
    }];

    // 标题
    [self.title mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.left.equalTo(self.cardView).offset(16);
    }];

    // 内容
    [self.contentContainer mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.title.mas_bottom).offset(16);
        make.left.equalTo(self.cardView).offset(16);
        make.right.equalTo(self.cardView).offset(-16);
        make.bottom.equalTo(self.cardView).offset(-16);
    }];
}
@end

#import "CustomViewController.h"
#import "CardView.h"
#import <Masonry/Masonry.h>

@interface CustomViewController ()

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIView *contentView;



@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor  =[UIColor whiteColor];
    [self containerInit];

    CardView *cardView = [[CardView alloc] initWithObj:@{@"title": @"标题", @"content": @"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容"}];
    [self.contentView addSubview:cardView];

    [cardView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.contentView);
        make.left.right.equalTo(self.contentView);
    }];
    
}

- (void)containerInit {

    // 创建滚动容器
    self.scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:self.scrollView];

    // 创建内容容器
    self.contentView = [[UIView alloc] init];
    [self.scrollView addSubview:self.contentView];
    

    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.equalTo(self.view);
    }];

    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.right.equalTo(self.scrollView).offset(16);
        make.width.equalTo(self.scrollView).offset(-32);
    }];

}


@end

#import "ComponentsViewController.h"
#import <Masonry/Masonry.h>


@interface ComponentsViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *contentView;

// 基础控件
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UISwitch *switchControl;
@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) UIImageView *imageView;
// 引用三方组件


@end

@implementation ComponentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 创建滚动视图
    [self setupScrollView];
    
    // 添加各种控件
    [self setupBasicControls];
    
    // 设置约束
    [self setupConstraints];
}

- (void)setupScrollView {
    // 创建滚动视图
    self.scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:self.scrollView];
    
    // 创建内容视图
    self.contentView = [[UIView alloc] init];
    [self.scrollView addSubview:self.contentView];
}

- (void)setupBasicControls {
    // 标题标签
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"常用控件展示";
    self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.titleLabel];
    
    // 文本输入框
    self.textField = [[UITextField alloc] init];
    self.textField.placeholder = @"请输入文字";
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.delegate = self;
    [self.contentView addSubview:self.textField];
    
    // 文本视图
    self.textView = [[UITextView alloc] init];
    self.textView.text = @"这是一个可以输入多行文字的文本视图";
    self.textView.layer.borderWidth = 1;
    self.textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.textView.layer.cornerRadius = 5;
    [self.contentView addSubview:self.textView];
    
    // 按钮
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.button setTitle:@"点击我" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.button];
    
    // 开关
    self.switchControl = [[UISwitch alloc] init];
    [self.switchControl addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    [self.contentView addSubview:self.switchControl];
    
    // 滑块
    self.slider = [[UISlider alloc] init];
    [self.slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.contentView addSubview:self.slider];
    
    // 分段控制器
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"选项1", @"选项2", @"选项3"]];
    [self.segmentedControl addTarget:self action:@selector(segmentChanged:) forControlEvents:UIControlEventValueChanged];
    [self.contentView addSubview:self.segmentedControl];
    
    // 图片视图
    self.imageView = [[UIImageView alloc] init];
    self.imageView.image = [UIImage systemImageNamed:@"photo"];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.imageView];
    
}

- (void)setupConstraints {
    // 滚动视图约束
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.view);
    }];
    
    // 控件约束
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(20);
        make.left.right.equalTo(self.contentView).inset(20);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(20);
        make.left.right.equalTo(self.contentView).inset(20);
        make.height.mas_equalTo(44);
    }];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textField.mas_bottom).offset(20);
        make.left.right.equalTo(self.contentView).inset(20);
        make.height.mas_equalTo(100);
    }];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textView.mas_bottom).offset(20);
        make.centerX.equalTo(self.contentView);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(44);
    }];
    
    [self.switchControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.button.mas_bottom).offset(20);
        make.centerX.equalTo(self.contentView);
    }];
    
    [self.slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.switchControl.mas_bottom).offset(20);
        make.left.right.equalTo(self.contentView).inset(20);
    }];
    
    [self.segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.slider.mas_bottom).offset(20);
        make.left.right.equalTo(self.contentView).inset(20);
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.segmentedControl.mas_bottom).offset(20);
        make.left.right.equalTo(self.contentView).inset(20);
        make.height.mas_equalTo(200);
        make.bottom.equalTo(self.contentView).offset(-20);
    }];
}

#pragma mark - Actions

- (void)buttonClicked {
    NSLog(@"按钮被点击");
}

- (void)switchChanged:(UISwitch *)sender {
    NSLog(@"开关状态: %@", sender.isOn ? @"开" : @"关");
}

- (void)sliderValueChanged:(UISlider *)sender {
    NSLog(@"滑块值: %.2f", sender.value);
}

- (void)segmentChanged:(UISegmentedControl *)sender {
    NSLog(@"选中段: %ld", (long)sender.selectedSegmentIndex);
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end

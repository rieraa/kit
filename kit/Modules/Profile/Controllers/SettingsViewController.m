#import "SettingsViewController.h"
#import "ThemeConstants.h"
#import <Masonry/Masonry.h>


@interface SettingsViewController ()

@property (nonatomic, strong) UISegmentedControl *themeSegment;
@property (nonatomic, assign) ThemeStyle currentTheme;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    

    
    // 从 UserDefaults 获取当前主题
    self.currentTheme = [NSUserDefaults.standardUserDefaults integerForKey:@"ThemeStyle"];
    
    [self setupUI];
    [self setupConstraints];
    [self applyTheme:self.currentTheme];
}

- (void)setupUI {
    // 创建主题切换控件
    self.themeSegment = [[UISegmentedControl alloc] initWithItems:@[@"浅色", @"深色"]];
    self.themeSegment.selectedSegmentIndex = self.currentTheme;
    [self.themeSegment addTarget:self
                          action:@selector(themeChanged:)
                forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.themeSegment];
}

- (void)setupConstraints {
    [self.themeSegment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.right.equalTo(self.view).inset(20);
        make.height.mas_equalTo(44);
    }];
}

- (void)themeChanged:(UISegmentedControl *)sender {
    ThemeStyle newTheme = (ThemeStyle)sender.selectedSegmentIndex;
    self.currentTheme = newTheme;
    // 保存主题设置
    [NSUserDefaults.standardUserDefaults setInteger:newTheme forKey:@"ThemeStyle"];
    
    [NSUserDefaults.standardUserDefaults synchronize];
    
    // 发送主题变更通知
    [NSNotificationCenter.defaultCenter postNotificationName:ThemeDidChangeNotification
                                                      object:nil
                                                    userInfo:@{@"theme": @(newTheme)}];
    // 应用主题到当前页面
    [self applyTheme:newTheme];
}

- (void)applyTheme:(ThemeStyle)theme {
    self.view.backgroundColor = [ThemeConstants backgroundColor:theme];
    self.themeSegment.tintColor = [ThemeConstants tintColor:theme];
}

@end

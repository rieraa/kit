//
//  EditProfileViewController.m
//  kit
//
//  Created by 林文益 on 2024/11/16.
//

#import "EditProfileViewController.h"
#import <Masonry/Masonry.h>



@interface EditProfileViewController ()

@property (nonatomic,strong) UITextField *nameField;
@property (nonatomic,strong) UITextField *bioField;
@property (nonatomic,strong) UIButton *saveButton;


@end

@implementation EditProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"编辑资料";
    
    self.nameField = [[UITextField alloc] init];
    self.nameField.placeholder = @"请输入姓名";
    self.nameField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.nameField];
    
    self.bioField = [[UITextField alloc] init];
    self.bioField.placeholder = @"请输入简介";
    self.bioField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.bioField];
    
    self.saveButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.saveButton setTitle:@"保存" forState:UIControlStateNormal];
    [self.saveButton addTarget:self action:@selector(saveButtonClicked) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.saveButton];
    [self setupConstraints];
    
    
}

- (void)setupConstraints {
    [self.nameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.right.equalTo(self.view).inset(20);
        make.height.mas_equalTo(44);
    }];
    
    [self.bioField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameField.mas_bottom).offset(20);
        make.left.right.equalTo(self.view).inset(20);
        make.height.mas_equalTo(44);
    }];
    
    [self.saveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bioField.mas_bottom).offset(30);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(44);
    }];
}




- (void)saveButtonClicked {
    // 这里后面可以添加保存逻辑
    
    if ([self.delegate respondsToSelector:@selector(didUpdateProfile:bio:)]) {
        [self.delegate didUpdateProfile:self.nameField.text bio:self.bioField.text];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"updateUserinfo"
                                                        object:nil
                                                      userInfo:@{
        @"name": self.nameField.text,
        @"bio": self.bioField.text
    }];
    NSLog(@"通知已发送");
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end

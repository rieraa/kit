//
//  EditProfileViewController.h
//  kit
//
//  Created by 林文益 on 2024/11/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol EditProfileViewControllerDelegate <NSObject>
- (void)didUpdateProfile:(NSString *)name bio:(NSString *)bio;
@end

@interface EditProfileViewController : UIViewController

@property (nonatomic, weak) id<EditProfileViewControllerDelegate> delegate;
@property (nonatomic, copy) NSString *currentName;   // 添加当前名字属性
@property (nonatomic, copy) NSString *currentBio;    // 添加当前简介属性

@end

NS_ASSUME_NONNULL_END

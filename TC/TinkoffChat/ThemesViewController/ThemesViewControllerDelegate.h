//
//  ThemesViewControllerDelegate.h
//  TinkoffChat
//
//  Created by Алексей ]Чанов
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ThemesViewController;

NS_ASSUME_NONNULL_BEGIN

@protocol ThemesViewControllerDelegate <NSObject>
-(void)themesViewController: (ThemesViewController *)controller didSelect:(UIColor *)selectedTheme;
@end

NS_ASSUME_NONNULL_END
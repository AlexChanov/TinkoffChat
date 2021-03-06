//
//  ThemesViewControllerDelegate.h
//  TinkoffChat
//
//  Created by Чанов Алексей on 17/12/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ThemesViewController;

NS_ASSUME_NONNULL_BEGIN

@protocol ThemesViewControllerDelegate <NSObject>
-(void)themesViewController: (ThemesViewController *)controller didSelect:(UIColor *)selectedTheme;
@end

NS_ASSUME_NONNULL_END

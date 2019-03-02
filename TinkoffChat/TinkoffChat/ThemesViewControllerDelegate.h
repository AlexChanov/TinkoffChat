//
//  ThemesViewControllerDelegate.h
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 02/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//



@import UIKit;
@class ThemesViewController;

NS_ASSUME_NONNULL_BEGIN

@protocol ThemesViewControllerDelegate <NSObject>

 - (void)themesViewController: (ThemesViewController *)controller
               didSelectTheme:(UIColor *)selectedTheme;

@end

NS_ASSUME_NONNULL_END

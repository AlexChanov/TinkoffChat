//
//  ThemesViewController.h
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 02/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThemesViewControllerDelegate.h"
#import "Themes.h"

NS_ASSUME_NONNULL_BEGIN

@interface ThemesViewController : UIViewController

@property (strong, nonatomic) Themes* model;
@property (weak, nonatomic) id <ThemesViewControllerDelegate> delegate;


@end

NS_ASSUME_NONNULL_END

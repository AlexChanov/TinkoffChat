//
//  ThemesViewController.h
//  TinkoffChat
//
//  Created by Чанов Алексей on 17/12/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Themes;
@protocol ThemesViewControllerDelegate;
@protocol IPresentationAssembly;
NS_ASSUME_NONNULL_BEGIN

@interface ThemesViewController : UIViewController
{
    id<ThemesViewControllerDelegate> _delegate;
    Themes* _model;
    id<IPresentationAssembly> _assembly;
    IBOutletCollection(UIButton) NSArray *themesButtons;
}
@property (weak, nonatomic) id<ThemesViewControllerDelegate> delegate;
@property (retain, nonatomic) id<IPresentationAssembly> assembly;
- (IBAction)themeButtonTapped:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END

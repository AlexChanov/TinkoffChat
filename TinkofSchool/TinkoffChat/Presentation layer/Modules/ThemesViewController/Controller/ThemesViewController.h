//
//  ThemesViewController.h
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 24/03/2019.
//  Copyright © 22019 Алексей Чанов. All rights reserved.
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

//
//  ThemesViewController.m
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 02/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

#import "ThemesViewController.h"

@interface ThemesViewController () {
    id<ThemesViewControllerDelegate> _delegate;
    Themes *_model;
}

@end

@implementation ThemesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.model = [Themes new];
}

- (IBAction)closeTap:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES
                                                      completion:nil];
}

- (void)applyColor:(UIColor *)color {
    if ([self.delegate
         respondsToSelector:@selector(themesViewController:didSelectTheme:)])
    {
        [self.delegate themesViewController:self didSelectTheme:color];
    }
    self.view.backgroundColor = color;
}

- (IBAction)theme1Tap:(id)sender {
    [self applyColor:self.model.theme1];
}

- (IBAction)theme2Tap:(id)sender {
    [self applyColor:self.model.theme2];
}

- (IBAction)theme3Tap:(id)sender {
    [self applyColor:self.model.theme3];
}

- (id<ThemesViewControllerDelegate>)delegate {
    return _delegate;
}

- (void)setDelegate:(id<ThemesViewControllerDelegate>)delegate {
    _delegate = delegate;
}

- (Themes *)model {
    return _model;
}

- (void)setModel:(Themes *)model {
    Themes *tmpModel = _model;
    _model = [model retain];
    [tmpModel release];
}
@end

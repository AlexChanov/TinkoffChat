//
//  ThemesViewController.m
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 02/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

#import "ThemesViewController.h"

@interface ThemesViewController (){
    
    id<ThemesViewControllerDelegate> _delegate;
    Themes *_model ;
    
    
}
@end

@implementation ThemesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.model = [Themes new];
}


-(IBAction)closeButtonAction:(id)sender{
    [self.presentingViewController dismissViewControllerAnimated:YES
completion:nil];
}

-(void)checkAndCallDelegateWithColor:(UIColor *)color{
    if ([self.delegate
         respondsToSelector: @selector(themesViewController:didSelectTheme:)])
    {
        [self.delegate themesViewController:self didSelectTheme:color];
    }
    self.view.backgroundColor = color;
}

- (IBAction)button1Tap:(id)sender{
    [self checkAndCallDelegateWithColor:self.model.theme1];
}

- (IBAction)button2Tap:(id)sender{
    [self checkAndCallDelegateWithColor:self.model.theme2];
}

- (IBAction)button3Tap:(id)sender{
    [self checkAndCallDelegateWithColor:self.model.theme3];
}

- (id<ThemesViewControllerDelegate>)delegate{
    return _delegate;
}

- (void)setDelegate:(id<ThemesViewControllerDelegate>)delegate{
    _delegate = delegate;
}


-(void)setModel:(Themes *)model {
    
    Themes *tmpMpdel = _model;
    _model = [model retain];
    [tmpMpdel release];
}
@end

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
}

- (IBAction)button1Tap:(id)sender{
    if ([self.delegate
         respondsToSelector: @selector(themesViewController:didSelectTheme:)])
    {
        [self.delegate themesViewController:self didSelectTheme:self.model.theme1];
    }
        }
- (IBAction)button2Tap:(id)sender{
    
}
- (IBAction)button3Tap:(id)sender{
    
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

//
//  ThemesViewController.m
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 20/03/2019.
//  Copyright © 2019 Чанов Алексей. All rights reserved.
//

#import "ThemesViewController.h"
#import "Themes.h"
#import "ThemesViewControllerDelegate.h"
@implementation ThemesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _model = [[Themes alloc] init];
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view setBackgroundColor:[[self.navigationController navigationBar] barTintColor]];
}

- (void) setDelegate:(id<ThemesViewControllerDelegate>)delegate {
    _delegate = delegate;
}

- (id<ThemesViewControllerDelegate>) delegate {
    return _delegate;
}

-(void) setAssembly:(id<IPresentationAssembly>)assembly {
    _assembly = assembly;
}

-(id<IPresentationAssembly>) assembly{
    return _assembly;
}

- (void)dealloc {
    [themesButtons release];
    [_model release];
    printf("DEALLOC\n");
    [super dealloc];
}

- (IBAction)themeButtonTapped:(UIButton *)sender {
    if (sender == [themesButtons objectAtIndex:0]) {
        [_delegate themesViewController:self didSelect:[_model theme1]];
        [[self.navigationController navigationBar] setBarTintColor:[_model theme1]];
    } else if (sender == [themesButtons objectAtIndex:1]) {
        [_delegate themesViewController:self didSelect:[_model theme2]];
        [[self.navigationController navigationBar] setBarTintColor:[_model theme2]];
    } else {
        [_delegate themesViewController:self didSelect:[_model theme3]];
        [[self.navigationController navigationBar] setBarTintColor:[_model theme3]];
    }
}

@end

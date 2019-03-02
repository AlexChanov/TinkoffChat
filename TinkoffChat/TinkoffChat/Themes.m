//
//  Themes.m
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 02/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//
@ import UIKit;
#import "Themes.h"


@interface Themes() {
    
    UIColor *_theme1;
    UIColor *_theme2;
    UIColor *_theme3;
}

@end


@implementation Themes


- (UIColor *)theme1{
    return _theme1;
}

- (UIColor *)theme2{
    return _theme2;
}
- (UIColor *)theme3{
    return _theme3;
}

-(void) setTheme1:(UIColor *)theme1{
    [theme1 retain];
    UIColor *tmpTheme = _theme1;
    _theme1 = theme1;
    [tmpTheme release];
}
-(void) setTheme2:(UIColor *)theme2{
    [theme2 retain];
    UIColor *tmpTheme = _theme2;
    _theme1 = theme2;
    [tmpTheme release];
}

-(void) setTheme3:(UIColor *)theme3{
    [theme3 retain];
    UIColor *tmpTheme = _theme3;
    _theme1 = theme3;
    [tmpTheme release];
}

- (instancetype)init{
    if (self = [super init]){
        self.theme1 = UIColor.redColor;
        self.theme2 = UIColor.greenColor;
        self.theme2 = UIColor.blueColor;
    }
    
    return self;
}


@end

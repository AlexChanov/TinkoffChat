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

- (UIColor *)theme1 {
    return _theme1;
}

- (UIColor *)theme2 {
    return _theme2;
}

- (UIColor *)theme3 {
    return _theme3;
}

- (void)setTheme1:(UIColor *)theme1 {
    [theme1 retain];
    UIColor *tmpTheme1 = _theme1;
    _theme1 = theme1;
    [tmpTheme1 release];
}

- (void)setTheme2:(UIColor *)theme2 {
    [theme2 retain];
    UIColor *tmpTheme2 = _theme2;
    _theme2 = theme2;
    [tmpTheme2 release];
}


- (void)setTheme3:(UIColor *)theme3 {
    [theme3 retain];
    UIColor *tmpTheme3 = _theme3;
    _theme3 = theme3;
    [tmpTheme3 release];
}



- (instancetype)init {
    if (self = [super init]) {
        UIColor *lightGrayHeader = [UIColor colorWithRed:255/255.f green:226/255.f blue:176/255.f alpha:1.0];
        self.theme1 = UIColor.whiteColor;
        self.theme2 = UIColor.darkGrayColor;
        self.theme3 = lightGrayHeader;
    }
    
    return self;
}


@end

//
//  Themes.m
//  TinkoffChat
//
//  Created by Чанов] Алексей
//  Copyright © 2019 Чанов Алексей . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Themes.h"

@implementation Themes
- (Themes*) init {
    [super init];
    _theme1 = UIColor.greenColor;
    _theme2 = UIColor.yellowColor;
    _theme3 = UIColor.redColor;
    return self;
}

- (UIColor*) theme1 {
    return _theme1;
}

- (UIColor*) theme2 {
    return _theme2;
}

-(UIColor*) theme3 {
    return _theme3;
}

- (void)dealloc {
    [_theme1 release];
    [_theme2 release];
    [_theme3 release];
    [super dealloc];
}
@end

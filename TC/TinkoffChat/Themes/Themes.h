//
//  Themes.h
//  TinkoffChat
//
//  Created by Чанов] Алексей
//  Copyright © 2019 Чанов Алексей . All rights reserved.
//

#import <UIKit/UIKit.h>
#ifndef Themes_h
#define Themes_h

@interface Themes: NSObject
{
    UIColor* _theme1;
    UIColor* _theme2;
    UIColor* _theme3;
}
- (Themes*) init;
@property (readonly) UIColor* theme1;
@property (readonly) UIColor* theme2;
@property (readonly) UIColor* theme3;
@end

#endif /* Themes_h */

//
//  GlobalConstants.h
//  JITShowHD
//
//  Created by Adam on 13-3-25.
//  Copyright (c) 2013年 Adam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreDataUtils.h"

#define SCREEN_WIDTH                1024
#define SCREEN_HEIGHT               768

#define SAVE_MOC(_MOC)              [CoreDataUtils saveMOCChange:_MOC]

#define ClearColor                  [UIColor clearColor]
#define COLOR(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

#define BOLD_FONT(aSize)            [UIFont fontWithName:@"Arial-BoldMT" size:aSize]
#define FONT(aSize)                 [UIFont fontWithName:@"ArialMT" size:aSize]
#define FONT_KaiShu(aSize)          [UIFont fontWithName:@"GBZenKai-Medium" size:aSize]
#define FONT_MSYH(aSize)            [UIFont fontWithName:@"MSYH" size:aSize]

#pragma mark - UIAlertView
#define ShowAlert(Delegate,TITLE,MSG,But) [[[[UIAlertView alloc] initWithTitle:(TITLE) \
message:(MSG) \
delegate:Delegate \
cancelButtonTitle:But \
otherButtonTitles:nil] autorelease] show]

@interface GlobalConstants : NSObject {
}

@end
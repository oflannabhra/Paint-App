//
//  Paint_AppAppDelegate.h
//  Paint App
//
//  Created by albert renshaw on 4/12/10.
//  Copyright providence 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Paint_AppViewController;

@interface Paint_AppAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Paint_AppViewController *viewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) Paint_AppViewController *viewController;

@end


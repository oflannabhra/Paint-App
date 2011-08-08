//
//  Paint_AppAppDelegate.m
//  Paint App
//
//  Created by albert renshaw on 4/12/10.
//  Copyright providence 2010. All rights reserved.
//

#import "Paint_AppAppDelegate.h"
#import "Paint_AppViewController.h"

@implementation Paint_AppAppDelegate

@synthesize window, viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch   

    // set background image
    UIImage *bg = [UIImage imageNamed:@"blood.png"];
    UIImageView *background = [[UIImageView alloc] initWithImage:bg];
   
    [window addSubview:background];
    [background release];
    
    // set view controller
    
    viewController = [[Paint_AppViewController alloc] initWithNibName:@"Paint_AppViewController" bundle:nil];
    [window addSubview:viewController.view];
//    [viewController release];

    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {

    [window release];
    [super dealloc];
}


@end

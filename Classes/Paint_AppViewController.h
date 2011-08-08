//
//  Paint_AppViewController.h
//  Paint App
//
//  Created by albert renshaw on 4/12/10.
//  Copyright providence 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanvasView.h"


@interface Paint_AppViewController : UIViewController {
    
}
@property (nonatomic, retain) IBOutlet UINavigationBar *bar;
@property (nonatomic, retain) IBOutlet UISegmentedControl *segControl;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *button;
@property (nonatomic, retain) IBOutlet CanvasView *canvas;

-(IBAction)setTool: (UISegmentedControl*)sender;

-(IBAction)popLine: (UIBarButtonItem *)sender;


@end


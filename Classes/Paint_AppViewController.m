//
//  Paint_AppViewController.m
//  Paint App
//
//  Created by albert renshaw on 4/12/10.
//  Copyright providence 2010. All rights reserved.
//

#import "Paint_AppViewController.h"

@implementation Paint_AppViewController

@synthesize canvas, bar, button, segControl;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    CanvasView *newCanvas = [[CanvasView alloc] initWithFrame:CGRectMake(0.0, 64.0, self.view.frame.size.width, self.view.frame.size.height)];
    self.canvas = newCanvas;
    [newCanvas release];
    
    
    [self.view addSubview:canvas];
}


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {

    }
    return self;
}



- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
    self.canvas = nil;
    self.bar = nil;
    self.button = nil;
    self.segControl = nil;
}


- (void)dealloc {
    [super dealloc];
    [canvas release];
}


-(IBAction)setTool: (UISegmentedControl*)sender{
    
    NSInteger selectedSegment = sender.selectedSegmentIndex;
    NSLog(@"INDEX: %i", selectedSegment);

    
    if ((int)selectedSegment == 0) {
        self.canvas.currentLine.lineColor = [UIColor blackColor];
        self.canvas.currentLine.lineWidth = 2.0;
        self.canvas.currentLine.opacity = 1.0;
    }else if ((int)selectedSegment == 1){         
        self.canvas.currentLine.lineColor = [UIColor yellowColor];
        self.canvas.currentLine.lineWidth = 10.0;
        self.canvas.currentLine.opacity = 0.5;
    }
 }

-(IBAction)popLine:(UIBarButtonItem *)sender{
    if ([self.canvas.lines count] > 0) {
        
        NSLog(@"last line: %i", [self.canvas.lines count]);

        [self.canvas.lines removeLastObject];
        [self.canvas setNeedsDisplay];
    }
}

@end


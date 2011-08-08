//
//  CanvasView.m
//  Paint App
//
//  Created by Ben Flannery on 7/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CanvasView.h"


@implementation CanvasView
@synthesize lines, currentLine;

-(id)initWithFrame:(CGRect)frame{
    if ((self = [super initWithFrame:frame])) {
        self.backgroundColor = [UIColor clearColor];
        self.currentLine = [[Line alloc] init];
        self.lines = [NSMutableArray arrayWithCapacity:10];
    }
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIGraphicsBeginImageContext(self.frame.size);
    
    // draw accumulated lines
    if ([self.lines count] > 0) {
        for (Line *tempLine in self.lines){
            CGContextSetAlpha(context, tempLine.opacity);
            CGContextSetStrokeColorWithColor(context, tempLine.lineColor.CGColor);
            CGContextSetLineWidth(context, tempLine.lineWidth);
            CGContextSetLineCap(context, kCGLineCapRound);
            CGContextSetLineJoin(context, kCGLineJoinRound);
            CGContextAddPath(context, tempLine.linePath);
            CGContextStrokePath(context);
            
            }
    }

    //draw current line
    CGContextSetAlpha(context, self.currentLine.opacity);

    
    CGContextSetStrokeColorWithColor(context, self.currentLine.lineColor.CGColor);
    CGContextSetLineWidth(context, self.currentLine.lineWidth);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextBeginPath(context);
    CGContextAddPath(context, self.currentLine.linePath);
    CGContextStrokePath(context);


	UIGraphicsEndImageContext();
    

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint cPoint = [touch locationInView:self];
    
	CGPathMoveToPoint(self.currentLine.linePath, NULL, cPoint.x, cPoint.y);
    
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];	
	CGPoint currentPoint = [touch locationInView:self];
    
    CGPathAddLineToPoint(self.currentLine.linePath, NULL, currentPoint.x, currentPoint.y);
	
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {	
	UITouch *touch = [touches anyObject];
    CGPoint cPoint = [touch locationInView:self];
    CGPathAddLineToPoint(self.currentLine.linePath, NULL, cPoint.x, cPoint.y);
    
    [self setNeedsDisplay];
    [self.lines addObject:self.currentLine];
    Line *nextLine = [[Line alloc] initWithOptions:self.currentLine.lineWidth color:self.currentLine.lineColor opacity:self.currentLine.opacity];
    self.currentLine = nextLine;
    [nextLine release];
    NSLog(@"touch #: %u", [self.lines count]);
}




- (void)dealloc
{    
    // release all paths accumulated in self.lines
    for (Line *temp in self.lines) {
        CGPathRelease([temp linePath]);
    }
    [self.lines release];
    [self.currentLine release];
    [super dealloc];


}

@end

//
//  Line.m
//  Paint App
//
//  Created by Ben Flannery on 7/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Line.h"


@implementation Line

@synthesize linePath, lineColor, lineWidth, opacity;

-(id)init {
    // assumes settings uninitialized
    // change assigned values if appropriate
    if ((self = [super init])) {
        self.lineWidth = 2.0;
        self.lineColor = [UIColor blackColor];
        self.opacity = 1.0;
        self.linePath = CGPathCreateMutable();
    }
    return self;
} 

-(id)initWithOptions:(float)lineWidth_ color:(UIColor *)lineColor_ opacity:(float)opacity_{
    if ((self = [super init])) {
        self.lineWidth = lineWidth_;
        self.lineColor = lineColor_;
        self.opacity = opacity_;
        self.linePath = CGPathCreateMutable();
    }
    return self;
}

-(void)dealloc{
    CGPathRelease([self linePath]);
    [self.lineColor release];
    [super dealloc];
}

@end

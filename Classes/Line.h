//
//  Line.h
//  Paint App
//
//  Created by Ben Flannery on 7/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Line : NSObject {
    
}
@property (nonatomic) float lineWidth;
@property (nonatomic, retain) UIColor *lineColor;
@property (nonatomic) float opacity;
@property (nonatomic) CGMutablePathRef linePath;

-(id)initWithOptions:(float)lineWidth_ color:(UIColor *)lineColor_ opacity:(float)opacity_;


@end

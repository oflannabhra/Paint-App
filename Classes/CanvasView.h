//
//  CanvasView.h
//  Paint App
//
//  Created by Ben Flannery on 7/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Line.h"


@interface CanvasView : UIView {

    
}
@property (nonatomic, retain) NSMutableArray *lines;
@property (nonatomic, retain) Line *currentLine;


@end

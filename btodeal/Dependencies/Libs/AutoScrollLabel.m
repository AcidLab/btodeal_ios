//
//  AutoScrollLabel.m
//  mesureFlex
//
//  Created by Mohamed Mokrani on 10/04/2017.
//  Copyright © 2017 Mohamed Mokrani. All rights reserved.
//

#import "AutoScrollLabel.h"

@implementation AutoScrollLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.clipsToBounds = YES;
        self.autoresizesSubviews = YES;
        
        textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width,   frame.size.height)];
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.textColor = [UIColor blackColor];
        //textLabel.textAlignment = UITexAlign;
        [self addSubview:textLabel];
    }
    return self;
}

-(void) setLabelText:(NSString*) text {
    
    textLabel.text  = text;
    CGSize textSize = [text sizeWithAttributes:
                       @{NSFontAttributeName: [UIFont systemFontOfSize:17.0f]}];
    
    
    if(textSize.width > self.frame.size.width) {
        textLabel.frame = CGRectMake(0, 0, textSize.width, self.frame.size.height);
    }
    else {
        textLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    }
    
    if(textLabel.frame.size.width > self.frame.size.width) {
        
        [timer invalidate];
        timer = nil;
        CGRect frame = textLabel.frame;
        frame.origin.x = self.frame.size.width-50;
        textLabel.frame = frame;
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveText) userInfo:nil repeats:YES];
    }
    else {
        [timer invalidate];
        timer = nil;
    }
}

-(void) moveText {
    
    if(textLabel.frame.origin.x < textLabel.frame.size.width-2*textLabel.frame.size.width) {
        CGRect frame = textLabel.frame;
        frame.origin.x = self.frame.size.width;
        textLabel.frame = frame;
    }
    [UIView beginAnimations:nil context:nil];
    CGRect frame = textLabel.frame;
    frame.origin.x -= 5;
    textLabel.frame = frame;
    [UIView commitAnimations];
    
}

- (void) setLabelFont:(UIFont*)font {
    textLabel.font = font;
}

- (void) setLabelTextColor:(UIColor*)color {
    textLabel.textColor = color;
}

- (void) setLabelTextAlignment:(UITextAlignment)alignment {
    textLabel.textAlignment = alignment;
}

@end

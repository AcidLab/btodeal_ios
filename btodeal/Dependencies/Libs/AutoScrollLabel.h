//
//  AutoScrollLabel.h
//  mesureFlex
//
//  Created by Mohamed Mokrani on 10/04/2017.
//  Copyright © 2017 Mohamed Mokrani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoScrollLabel : UIView
{
    UILabel *textLabel;
    NSTimer *timer;
}

- (void) setLabelText:(NSString*) text;
- (void) setLabelFont:(UIFont*)font;
- (void) setLabelTextColor:(UIColor*)color;
- (void) setLabelTextAlignment:(UITextAlignment)alignment;

@end

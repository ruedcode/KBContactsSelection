//
//  KBRadioButton.m
//  KBContactsSelectionExample
//
//  Created by Kamil Burczyk on 13.12.2014.
//  Copyright (c) 2014 Sigmapoint. All rights reserved.
//

#import "KBRadioButton.h"
#import "KBContactsSelectionViewController.h"

@implementation KBRadioButton

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        self.dx = 2;
        self.dy = 2;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.clipsToBounds = YES;
    [self addTarget:self action:@selector(redraw) forControlEvents:UIControlEventAllEvents];
    self.layer.cornerRadius = self.frame.size.width / 2;
    self.layer.borderColor = self.selected ? [UIColor clearColor].CGColor : [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 0.5;
}

- (void)redraw {
    [self setNeedsDisplay];
}

//- (void)setSelected:(BOOL)selected {
//    [super setSelected:selected];
//    self.backgroundColor = self.selected ? _innerCircleFillColor : [UIColor clearColor];
//    
//}

- (void)drawRect:(CGRect)rect {
//
    self.layer.borderColor = self.selected ? [UIColor clearColor].CGColor : [UIColor lightGrayColor].CGColor;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(ctx, [UIColor lightGrayColor].CGColor);
    
    if (self.highlighted) {
        CGContextSetFillColorWithColor(ctx, [UIColor lightGrayColor].CGColor);
    } else if (self.selected) {
        CGContextSetFillColorWithColor(ctx, _innerCircleFillColor.CGColor);
    } else {
        CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
    }
    
    CGContextStrokeEllipseInRect(ctx, CGRectInset(self.bounds, self.dx, self.dx));
    CGContextFillEllipseInRect(ctx, CGRectInset(self.bounds, self.dx, self.dx));
//
}


@end

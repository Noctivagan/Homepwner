//
//  BNRItemCell.m
//  Homepwner
//
//  Created by Tom Anderson on 10/13/14.
//  Copyright (c) 2014 Maritom LLC. All rights reserved.
//

#import "BNRItemCell.h"

@implementation BNRItemCell

- (IBAction)showImage:(id)sender
{
    if (self.actionBlock) {
        self.actionBlock();
    }
}

@end

//
//  BNRDetailViewController.h
//  Homepwner
//
//  Created by Tom Anderson on 9/22/14.
//  Copyright (c) 2014 Maritom LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNRItem;

@interface BNRDetailViewController : UIViewController
<UIViewControllerRestoration>

- (instancetype)initForNewItem:(BOOL)isNew;
@property (nonatomic, strong) BNRItem *item;
@property (nonatomic, copy) void (^dismissBlock)(void);

@end

//
//  BNRItem.h
//  RandomItems
//
//  Created by Tom Anderson on 9/9/14.
//  Copyright (c) 2014 Maritom LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BNRItem : NSObject <NSCoding>

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;
@property (nonatomic, copy) NSString *itemKey;
@property (nonatomic, strong) UIImage *thumbnail;

+ (instancetype)randomItem;

// Designated initializer for BNRItem

- (instancetype) initWithItemName: (NSString *)name
                   valueInDollars: (int)value
                     serialNumber: (NSString *)sNumber;

- (instancetype) initWithItemName: (NSString *)name;

- (void) setThumbnailFromImage: (UIImage *)image;
@end

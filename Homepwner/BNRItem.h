//
//  BNRItem.h
//  RandomItems
//
//  Created by Tom Anderson on 9/9/14.
//  Copyright (c) 2014 Maritom LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;
@property (nonatomic, copy) NSString *itemKey;

+ (instancetype)randomItem;

// Designated initializer for BNRItem

- (instancetype) initWithItemName: (NSString *)name
                   valueInDollars: (int)value
                     serialNumber: (NSString *)sNumber;

- (instancetype) initWithItemName: (NSString *)name;

@end

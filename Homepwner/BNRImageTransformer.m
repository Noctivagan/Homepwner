//
//  BNRImageTransformer.m
//  Homepwner
//
//  Created by Tom Anderson on 10/20/14.
//  Copyright (c) 2014 Maritom LLC. All rights reserved.
//

#import "BNRImageTransformer.h"

@implementation BNRImageTransformer
+ (Class)transformedValueClass
{
    return [NSData class];
}

- (id)transformedValue:(id)value
{
    if (!value) {
        return nil;
    }
    
    if ([value isKindOfClass:[NSData class]]) {
        return value;
    }
    
    return UIImagePNGRepresentation(value);
    
}

- (id)reverseTransformedValue:(id)value
{
    return [UIImage imageWithData:value];
}

@end

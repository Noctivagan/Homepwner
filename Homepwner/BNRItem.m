//
//  BNRItem.m
//  RandomItems
//
//  Created by Tom Anderson on 9/9/14.
//  Copyright (c) 2014 Maritom LLC. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+ (instancetype)randomItem {
    // Create an immutable array of three adjectives
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    
    // Create an immutable array of three nouns
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Keeshond"];
    
    // Get the index of a random adjective/noun from the lists
    // Note: the % operator, called the modulo operator, gives
    // you the remainder. So adjectiveIndex is a random number from 0-2 inclusive
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % randomNounList.count;
    
    // Note that NSInteger is not an object, but a type definition for "long"
//    NSString *randomName = [NSString stringWithFormat:@"%@ %@", [randomAdjectiveList objectAtIndex:adjectiveIndex], [randomNounList objectAtIndex: nounIndex]];
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", randomAdjectiveList[adjectiveIndex],randomNounList[nounIndex]];
    int randomValue = arc4random() % 100;
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c", '0' + arc4random() %10, 'A' + arc4random() % 26, '0' + arc4random() % 10, 'A' + arc4random() % 26, '0' + arc4random() % 10];
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
    return newItem;
    
}
- (instancetype) initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber {
    // Call the superclass's designated initializer
    self = [super init];
    
    // Did the superclass's designated initializer succeed?
    if(self) {
        // give the instance variables initial values
        _itemName = name;
        _valueInDollars = value;
        _serialNumber = sNumber;
        
        // Set the _dateCreated to the current date and time
        _dateCreated = [[NSDate alloc] init];
        
        // Create an NSUUID object - and get its string representations
        NSUUID *uuid = [[NSUUID alloc] init];
        NSString *key = [uuid UUIDString];
        _itemKey = key;
    }
    
    // Return the address of the newly initialized object
    return self;
    
}

- (instancetype) initWithItemName:(NSString *)name {
    return [self initWithItemName:name valueInDollars:0 serialNumber:@""];
}

- (instancetype) init {
    return [self initWithItemName:@"Unnamed Item"];
}

- (NSString *)description {
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@", self.itemName, self.serialNumber, self.valueInDollars, self.dateCreated];
    return descriptionString;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.itemName forKey:@"itemName"];
    [aCoder encodeObject:self.serialNumber forKey:@"serialNumber"];
    [aCoder encodeObject:self.dateCreated forKey:@"dateCreated"];
    [aCoder encodeObject:self.itemKey forKey:@"itemKey"];
    [aCoder encodeInt:self.valueInDollars forKey:@"valueInDollars"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self)
    {
        _itemName = [aDecoder decodeObjectForKey:@"itemName"];
        _serialNumber = [aDecoder decodeObjectForKey:@"serialNumber"];
        _dateCreated = [aDecoder decodeObjectForKey:@"dateCreated"];
        _itemKey = [aDecoder decodeObjectForKey:@"itemKey"];
        _valueInDollars = [aDecoder decodeIntForKey:@"valueInDollars"];
    }
    return self;
}
- (void) dealloc
{
    NSLog(@"Destroyed: %@", self);
}
@end

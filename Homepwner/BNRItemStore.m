//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Tom Anderson on 9/21/14.
//  Copyright (c) 2014 Maritom LLC. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"
#import "BNRImageStore.h"

@interface BNRItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation BNRItemStore

+ (instancetype) sharedStore
{
    static BNRItemStore *sharedStore;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStore = [[self alloc] initPrivate];
    });
    return sharedStore;
}

// if a programmer calls [[BNRItemStore alloc] init], let him know
// the error of his ways

- (instancetype) init
{
    [NSException raise:@"Singleton" format:@"Use +[BNRItemStore sharedStore]"];
    return nil;
}

// Here is the real initializer
- (instancetype) initPrivate
{
    self = [super init];
    if(self)
    {
        NSString *path = [self itemArchivePath];
        _privateItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        // IF the array hadn't been saved previously, create a new empty one
        if (!_privateItems) {
            _privateItems = [[NSMutableArray alloc] init];
        }
    }
    return self;
}

- (NSArray *)allItems
{
    return [self.privateItems copy];
}

- (BNRItem *)createItem
{
    BNRItem *item = [[BNRItem alloc] init];
    [self.privateItems addObject:item];
    return item;
}

- (void)removeItem:(BNRItem *)item
{
    NSString *key = item.itemKey;
    [[BNRImageStore sharedStore] deleteImageForKey:key];
    
    [self.privateItems removeObjectIdenticalTo:item];
}


- (void)moveItemAtIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex
{
    if (fromIndex == toIndex)
    {
        return;
    }
    
    // Get pointer to object being moved so you can reinsert it
    BNRItem *item = self.privateItems[fromIndex];
    
    // Remove item from array
    [self.privateItems removeObjectAtIndex:fromIndex];
    
    // Insert itme in array at new location
    [self.privateItems insertObject:item atIndex:toIndex];
}

-(NSString *)itemArchivePath
{
    // Make sure that the first argument is NSDocumentDirectory and not NSDocumentationDirectory
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    // Get the one document directory from teh list
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent:@"items.archive"];
}

- (BOOL)saveChanges
{
    NSString *path = [self itemArchivePath];
    // Returns YES on success
    return [NSKeyedArchiver archiveRootObject:self.privateItems toFile:path];
}
@end

//
//  BNRItemCell.h
//  Homepwner
//
//  Created by Tom Anderson on 10/13/14.
//  Copyright (c) 2014 Maritom LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BNRItemCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *serialNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (copy, nonatomic) void (^actionBlock)(void);
@end

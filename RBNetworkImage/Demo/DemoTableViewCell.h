//
//  DemoTableViewCell.h
//  RBNetworkImage
//
//  Created by Rheese Burgess on 08/02/2014.
//  Copyright (c) 2014 Rheese Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RBNetworkImageView.h"

@interface DemoTableViewCell : UITableViewCell

@property (nonatomic, retain) UILabel *label;
@property (nonatomic, retain) RBNetworkImageView *networkImageView;

+ (id)cellForTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath;

@end

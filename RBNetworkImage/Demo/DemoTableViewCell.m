//
//  DemoTableViewCell.m
//  RBNetworkImage
//
//  Created by Rheese Burgess on 08/02/2014.
//  Copyright (c) 2014 Rheese Burgess. All rights reserved.
//

#import "DemoTableViewCell.h"

NSString * const kBaseURL = @"http://www.rheese.com/assets/images/RBNetworkImage/";
NSString * const kDemoCellReuse = @"DemoTableViewCell";

@implementation DemoTableViewCell

+ (id)cellForTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath {
    DemoTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:kDemoCellReuse];
    
    if (cell == nil) {
        cell = [[DemoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kDemoCellReuse];
    }
    
    NSInteger imageNum = (indexPath.row % 8) + 1;
    NSURL *imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@network_image_%d.jpg", kBaseURL, imageNum]];
    NSURL *placeholderURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@network_image_%d_thumb.jpg", kBaseURL, imageNum]];
    
    [cell.networkImageView clear];
    [cell.networkImageView setImageWithURL:imageURL placeholderURL:placeholderURL];
    
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.networkImageView = [[RBNetworkImageView alloc] init];
        [self.contentView addSubview:self.networkImageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect bounds   = self.contentView.bounds;
    CGFloat width   = 300.0f;
    CGFloat height  = 225.0f;
    CGFloat xOffset = floorf((bounds.size.width - width) / 2.0f);
    CGFloat yOffset = floorf((bounds.size.height - height) / 2.0f);
    
    self.networkImageView.frame = CGRectMake(xOffset, yOffset, width, height);
}

@end

//
//  DemoViewController.m
//  RBNetworkImage
//
//  Created by Rheese Burgess on 07/02/2014.
//  Copyright (c) 2014 Rheese Burgess. All rights reserved.
//

#import "DemoViewController.h"
#import "RBNetworkImageView.h"

@interface DemoViewController () {
    RBNetworkImageView *_imageView;
}

@end

@implementation DemoViewController

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _imageView = [[RBNetworkImageView alloc] init];
        
        [self.view addSubview:_imageView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    CGRect bounds = self.view.bounds;
    CGFloat width = 300.0f;
    CGFloat height = 225.0f;
    CGFloat xOffset = floorf((bounds.size.width - width) / 2.0f);
    CGFloat yOffset = floorf((bounds.size.height - height) / 2.0f);

    _imageView.frame = CGRectMake(xOffset, yOffset, width, height);
    
    NSURL *imageURL = [NSURL URLWithString:@"http://www.rheese.com/assets/images/RBNetworkImage/network_image_1.jpg"];
    NSURL *placeholderURL = [NSURL URLWithString:@"http://www.rheese.com/assets/images/RBNetworkImage/network_image_1_thumb.jpg"];
    
    [_imageView setImageWithURL:imageURL placeholderURL:placeholderURL];
}

@end

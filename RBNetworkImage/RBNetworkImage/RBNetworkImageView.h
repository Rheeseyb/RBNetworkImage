//
//  RBNetworkImageView.h
//  RBNetworkImage
//
//  Created by Rheese Burgess on 07/02/2014.
//  Copyright (c) 2014 Rheese Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RBNetworkImageView : UIView

- (void)clear;
- (void)setImageWithURL:(NSURL *)url;
- (void)setImageWithURL:(NSURL *)url placeholder:(UIImage *)image;
- (void)setImageWithURL:(NSURL *)imageUrl placeholderURL:(NSURL *)placeHolderUrl;

@end
//
//  RBNetworkImageView.m
//  RBNetworkImage
//
//  Created by Rheese Burgess on 07/02/2014.
//  Copyright (c) 2014 Rheese Burgess. All rights reserved.
//

#import "RBNetworkImageView.h"
#import "UIImageView+WebCache.h"
#import "DACircularProgressView.h"

@interface RBNetworkImageView () {
    UIImageView *_placeholderImage;
    UIImageView *_imageView;
	DACircularProgressView *_loadingIndicator;
}

@end

@implementation RBNetworkImageView

- (id)init {
    return [self initWithFrame:CGRectZero];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        
        _placeholderImage = [[UIImageView alloc] initWithFrame:frame];
        _placeholderImage.contentMode = UIViewContentModeScaleAspectFill;
        _placeholderImage.clipsToBounds = YES;
        
        _imageView = [[UIImageView alloc] initWithFrame:frame];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        
		_loadingIndicator = [[DACircularProgressView alloc] init];
        _loadingIndicator.userInteractionEnabled = NO;
        _loadingIndicator.thicknessRatio = 0.1;
        _loadingIndicator.roundedCorners = NO;
        
        [self addSubview:_placeholderImage];
		[self addSubview:_loadingIndicator];
        [self addSubview:_imageView];
    }
    
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    _placeholderImage.frame = frame;
    _imageView.frame = frame;
    
    [self setNeedsLayout];
}

- (void)clear {
    [_placeholderImage cancelCurrentImageLoad];
    [_imageView cancelCurrentImageLoad];
    
    _placeholderImage.image = nil;
    _imageView.image = nil;
}

- (void)setImageWithURL:(NSURL *)url placeholder:(UIImage *)image {
    [_placeholderImage cancelCurrentImageLoad];
    _placeholderImage.image = image;
    [self setImageWithURL:url];
}

- (void)setImageWithURL:(NSURL *)imageUrl placeholderURL:(NSURL *)placeHolderUrl {
    [_placeholderImage setImageWithURL:placeHolderUrl];
    [self setImageWithURL:imageUrl];
}

- (void)setImageWithURL:(NSURL *)url {
    _loadingIndicator.progress = 0;
    _loadingIndicator.hidden = NO;
    
    __weak DACircularProgressView *weakLoadingIndicator = _loadingIndicator;
    [_imageView setImageWithURL:url
               placeholderImage:nil
                        options:(SDWebImageRetryFailed | SDWebImageContinueInBackground)
                       progress:^(NSUInteger receivedSize, long long expectedSize) {
                           if (expectedSize > 0) {
                               float progress = receivedSize / (float) expectedSize;
                               weakLoadingIndicator.progress = MAX(MIN(1, progress), 0);
                           }
                       }
                      completed:^(UIImage *image __unused, NSError *error __unused, SDImageCacheType cacheType __unused) {
                          weakLoadingIndicator.hidden = YES;
                      }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat spinnerWidth   = 40.0f;
    CGFloat spinnerHeight  = 40.0f;
    CGFloat spinnerXOffset = floorf((self.bounds.size.width  - spinnerWidth)  / 2.0);
    CGFloat spinnerYOffset = floorf((self.bounds.size.height - spinnerHeight) / 2.0);
    
    _loadingIndicator.frame = CGRectMake(spinnerXOffset, spinnerYOffset, spinnerWidth, spinnerHeight);
    
    _placeholderImage.frame = self.bounds;
    _imageView.frame        = self.bounds;
}

@end

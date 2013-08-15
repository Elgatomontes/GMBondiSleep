//
//  UIView+LoadingView.m
//  GMBondiSleep
//
//  Created by Gastón Montes on 13/08/13.
//  Copyright (c) 2013 Gastón Montes. All rights reserved.
//

#import "UIView+LoadingView.h"

#import "GMLoadingView.h"

@implementation UIView (LoadingView)

#pragma mark - Public Methods
- (void)showAsLoadingView {
    
    if (![self isShownAsLoading]) {
        // The view is not shown as loading. Add the loading view
        GMLoadingView *loadingView = [GMLoadingView loadingInstance];
        
        loadingView.frame = self.bounds;
        loadingView.userInteractionEnabled = NO;
        
        [self addSubview:loadingView];
    }
}

- (void)stopShowingAsLoading {
    // If there is a loadingSubview, remove it
    [[self loadingSubview] removeFromSuperview];
}

#pragma mark - Private methods
// Determines if there is a loading view added to this view
- (BOOL)isShownAsLoading {
    return ([self loadingSubview] != nil);
}

// Searches for a subview of class "DMLoadingView", and returns it (if found)
- (GMLoadingView *)loadingSubview {
    GMLoadingView * __block loadingSubview = nil;
    
    // Check if any subview is an instance of DMLoadingView
    [self.subviews enumerateObjectsUsingBlock:^(UIView *subview, NSUInteger idx, BOOL *stop) {
        if ([subview isKindOfClass:[GMLoadingView class]]) {
            loadingSubview = (GMLoadingView *)subview;
            *stop = YES;
        }
    }];
    
    return loadingSubview;
}
@end

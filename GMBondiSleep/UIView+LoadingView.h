//
//  UIView+LoadingView.h
//  GMBondiSleep
//
//  Created by Gastón Montes on 13/08/13.
//  Copyright (c) 2013 Gastón Montes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LoadingView)

// Show a loading view.
- (void)showAsLoadingView;

// Use this method to remove the "loading view" that has been added.
- (void)stopShowingAsLoading;

@end

//
//  GMLoadingView.m
//  GMBondiSleep
//
//  Created by Gastón Montes on 13/08/13.
//  Copyright (c) 2013 Gastón Montes. All rights reserved.
//

#import "GMLoadingView.h"

@interface GMLoadingView ()

@property (weak, nonatomic) IBOutlet UILabel *loadingLabel;

@end

@implementation GMLoadingView

+ (GMLoadingView *)loadingInstance {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] objectAtIndex:0];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.loadingLabel.text = NSLocalizedString(@"LoadingView.Message", nil);
}

@end

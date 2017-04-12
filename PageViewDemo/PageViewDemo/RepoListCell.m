//
//  RepoListCell.m
//  PageViewDemo
//
//  Created by Abdul Haziq on 04/04/2017.
//  Copyright © 2017 Abdul Haziq. All rights reserved.
//

#import "RepoListCell.h"

@implementation RepoListCell
@synthesize RepoNameLabel;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  CommitCell.m
//  PageViewDemo
//
//  Created by Abdul Haziq on 05/04/2017.
//  Copyright © 2017 Abdul Haziq. All rights reserved.
//

#import "CommitCell.h"

@implementation CommitCell
@synthesize CommitMessageTextView;
@synthesize NameLabel;
@synthesize EmailLabel;
@synthesize DateLabel;
@synthesize CommitNoLabel;
@synthesize TotalCommitLabel;
@synthesize ErrorMsglabel;


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

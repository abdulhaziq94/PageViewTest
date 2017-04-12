//
//  CommitCell.h
//  PageViewDemo
//
//  Created by Abdul Haziq on 05/04/2017.
//  Copyright © 2017 Abdul Haziq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommitCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *CommitMessageTextView;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *EmailLabel;
@property (weak, nonatomic) IBOutlet UILabel *DateLabel;
@property (weak, nonatomic) IBOutlet UILabel *CommitNoLabel;
@property (weak, nonatomic) IBOutlet UILabel *TotalCommitLabel;
@property (weak, nonatomic) IBOutlet UILabel *ErrorMsglabel;

@end

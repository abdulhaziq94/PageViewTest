//
//  CommitTableViewController.h
//  PageViewDemo
//
//  Created by Abdul Haziq on 05/04/2017.
//  Copyright © 2017 Abdul Haziq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommitCell.h"
#import "CommitObject.h"
#import "RepoObject.h"
#import "PageContentViewController.h"


@interface CommitTableViewController : UITableViewController

@property (nonatomic,strong) NSMutableArray *CommitDetailArray;
@property (nonatomic,strong) NSString *CommitRepoURL;
@property (nonatomic,strong) id NextRepoObject;

@end

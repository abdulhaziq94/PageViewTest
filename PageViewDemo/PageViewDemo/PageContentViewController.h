//
//  PageContentViewController.h
//  PageViewDemo
//
//  Created by Abdul Haziq on 04/04/2017.
//  Copyright © 2017 Abdul Haziq. All rights reserved.
//

#define RepoJSON_URL @"https://api.github.com/orgs/spring-projects/repos"
#import <UIKit/UIKit.h>
#import "RepoObject.h"
#import "RepoListCell.h"
#import "CommitTableViewController.h"
#import "CommitObject.h"
#import "CommitCell.h"
#import "AlertViewController.h"

@interface PageContentViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property NSUInteger pageIndex;
@property NSString *titleText;
@property (weak, nonatomic) IBOutlet UITableView *RepotableView;
@property NSMutableArray *RepoListArray;
@property NSArray *JsonURL;

@end

//
//  TableViewController.h
//  PageViewDemo
//
//  Created by Abdul Haziq on 05/04/2017.
//  Copyright © 2017 Abdul Haziq. All rights reserved.
//

#define RepoJSON_URL @"https://api.github.com/orgs/spring-projects/repos"
#import <UIKit/UIKit.h>
#import "RepoListCell.h"
#import "RepoObject.h"


@interface TableViewController : UITableViewController
@property NSMutableArray *RepoListArray;
@property NSUInteger pageIndex;
@end

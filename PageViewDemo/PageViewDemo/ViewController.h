//
//  ViewController.h
//  PageViewDemo
//
//  Created by Abdul Haziq on 04/04/2017.
//  Copyright © 2017 Abdul Haziq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"
#import "RepoObject.h"
#import "RepoListCell.h"

@interface ViewController : UIViewController <UIPageViewControllerDataSource>
//implement data source protocol to tell page view controller what to display for each page.
- (IBAction)BackToFirstPage:(id)sender;
@property (strong,nonatomic) UIPageViewController *pageViewController;
@property (strong,nonatomic) NSArray *pageTitle; //provide data for the page content.
@property (strong,nonatomic) NSArray *pageJsonURL;


@end


//
//  ViewController.m
//  PageViewDemo
//
//  Created by Abdul Haziq on 04/04/2017.
//  Copyright © 2017 Abdul Haziq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize pageViewController;
@synthesize pageTitle;
@synthesize pageJsonURL;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.pageTitle = @[@"Page 1", @"Page 2", @"Page 3", @"Page 4"];
    self.pageJsonURL = @[@"https://api.github.com/orgs/spring-projects/repos",@"https://api.github.com/orgs/spring-projects/repos?page=2", @"https://api.github.com/orgs/spring-projects/repos?page=3", @"https://api.github.com/orgs/spring-projects/repos?page=4"];
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 25);
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)BackToFirstPage:(id)sender {
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
    
}

#pragma mark - Page View Controller Data Source

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    
    if (([self.pageTitle count] == 0) || (index >= [self.pageTitle count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.titleText = self.pageTitle[index];
    pageContentViewController.pageIndex = index;
    pageContentViewController.JsonURL   = self.pageJsonURL;
    
    return pageContentViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    // Return nil when reach boundary.
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    // Return nil when reach boundary.
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitle count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    // Bullet count.
    return [self.pageTitle count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    //Position of the controller based on index.
    return 0;
}

@end

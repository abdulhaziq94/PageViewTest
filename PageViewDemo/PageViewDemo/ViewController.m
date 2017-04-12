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
    self.pageTitle = @[@"Page 1", @"Page 2", @"Page 3", @"Page 4", @"Page 5", @"Page 6", @"Page 7"];
    self.pageJsonURL = @[@"https://api.github.com/orgs/spring-projects/repos",@"https://api.github.com/orgs/spring-projects/repos?page=2", @"https://api.github.com/orgs/spring-projects/repos?page=3", @"https://api.github.com/orgs/spring-projects/repos?page=4", @"https://api.github.com/orgs/spring-projects/repos?page=5", @"https://api.github.com/orgs/spring-projects/repos?page=6", @"https://api.github.com/orgs/spring-projects/repos?page=7"];
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self; //the object that provide view controller
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 25);
    
    //add the page controller view to the current view
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
//helper method to create the page content view controller on demand.It takes in the index parameter and creates the corresponding page content controller.
{
    
    if (([self.pageTitle count] == 0) || (index >= [self.pageTitle count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];//to instantiate a view controller in storyboard.
    pageContentViewController.titleText = self.pageTitle[index];
    pageContentViewController.pageIndex = index;
    pageContentViewController.JsonURL   = self.pageJsonURL;
   
    return pageContentViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
//Tell the app what to display when user switches back to the previous screen.
{
    
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;//get the current page index.
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;// Return nil when reach boundary.
    }
    
    index--;//decrease the index number
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
//Tell the app what to display for the next screen.
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;// Return nil when reach boundary.
    }
    
    index++; //increase the index number
    if (index == [self.pageTitle count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    //How many page n Bullet count.
    return [self.pageTitle count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    //Position of the controller based on index.
    return 0;
}

@end

//
//  PageContentViewController.m
//  PageViewDemo
//
//  Created by Abdul Haziq on 04/04/2017.
//  Copyright © 2017 Abdul Haziq. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController
@synthesize RepoListArray;
@synthesize RepotableView;
@synthesize JsonURL;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titleLabel.text = self.titleText;
    
    long i = self.pageIndex;
    
    NSURL *RepoListURL = [NSURL URLWithString:JsonURL[i]];
  
    NSData *RepoListData = [NSData dataWithContentsOfURL:RepoListURL];
    NSError *error = nil;
    id RepoListJson = [NSJSONSerialization JSONObjectWithData:RepoListData options:kNilOptions error:&error];
    
    self.RepoListArray = [[NSMutableArray alloc]init];
    
    for (NSDictionary *RepoListDict in RepoListJson) {
        RepoObject *repoObj = [[RepoObject alloc] init];
        repoObj.Repo_url = [RepoListDict objectForKey:@"name"];

        [self.RepoListArray addObject:repoObj];
//        NSLog(@"ddsadafdsfdsfdsfsdsdfsdfsdfs: %@",repoObj.Repo_url);
    }
    
    self.RepotableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.RepoListArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *repoIdentifier = @"RepoCell";
    RepoListCell *cell = [tableView dequeueReusableCellWithIdentifier:repoIdentifier forIndexPath:indexPath];
    RepoObject *repoObj = [self.RepoListArray objectAtIndex:indexPath.row];
    cell.RepoNameLabel.text = repoObj.Repo_url;
    //    cell.textLabel.text = [self.RepoListArray objectAtIndex:indexPath.row];
  
    return cell;
    
   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

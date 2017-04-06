//
//  CommitTableViewController.m
//  PageViewDemo
//
//  Created by Abdul Haziq on 05/04/2017.
//  Copyright © 2017 Abdul Haziq. All rights reserved.
//

#import "CommitTableViewController.h"

@interface CommitTableViewController ()

@end

@implementation CommitTableViewController
@synthesize CommitRepoURL;
@synthesize NextRepoObject;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RepoObject *repoObj = NextRepoObject;
    self.title = repoObj.Repo_url;
    NSString *NewCommit_url = [repoObj.Commit_url stringByReplacingOccurrencesOfString:@"{/sha}" withString:@""];
    NSURL *commitURL = [NSURL URLWithString:NewCommit_url];
    NSData *jsonData = [NSData dataWithContentsOfURL:commitURL];
    NSError *error = nil;
    self.CommitDetailArray = [[NSMutableArray alloc]init];

    if (jsonData != nil) {
  
    id SpringBootJson = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    
    
    
        for (NSDictionary *CommitDictionary in SpringBootJson) {
            CommitObject *committer = [[CommitObject alloc] init];
            committer.commitMessage = [CommitDictionary valueForKeyPath:@"commit.message"];
            committer.name =[CommitDictionary valueForKeyPath:@"commit.committer.name"];
            committer.email = [CommitDictionary valueForKeyPath:@"commit.committer.email"];
            committer.date = [CommitDictionary valueForKeyPath:@"commit.committer.date"];
            committer.errorMessage = [CommitDictionary valueForKey:@"message"];
            [self.CommitDetailArray addObject:committer];
        }
    
    } else if (jsonData == nil){
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error!" message:@"This Git repository is empty" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.CommitDetailArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *commitIdentifier = @"CommitCell";
    CommitCell *cell = [tableView dequeueReusableCellWithIdentifier:commitIdentifier forIndexPath:indexPath];
    
    long i = indexPath.row;
    CommitObject *committer  = [self.CommitDetailArray objectAtIndex:i];
    cell.CommitMessageTextView.text = committer.commitMessage;
    cell.NameLabel.text = committer.name;
    cell.EmailLabel.text = committer.email;
    cell.DateLabel.text = committer.date;
    
    NSString *totalCommitNo = [NSString stringWithFormat:@"Total Commit: %lu", (unsigned long)[self.CommitDetailArray count]];
    committer.totalCommit = totalCommitNo;
    cell.TotalCommitLabel.text = committer.totalCommit;
    
    NSString *commitNo = [NSString stringWithFormat:@"Commit No: %lu", i+1];
    committer.commitNo = commitNo;
    cell.CommitNoLabel.text = committer.commitNo;
    
    return cell;
    
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

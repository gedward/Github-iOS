//
//  ViewController.m
//  GithubClient
//
//  Created by Gerard Gonzalez on 7/11/15.
//  Copyright (c) 2015 Gerard Gonzalez. All rights reserved.
//

#import "GithubRepositoryTableViewController.h"
#import "GithubRepositoryTableViewCell.h"
#import "WebViewController.h"

@interface GithubRepositoryTableViewController ()
@property (nonatomic, strong) NSArray *githubRepositories;
@end

@implementation GithubRepositoryTableViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"GitHub-Mark"]];
    
    self.title = @"Objective-C Repositories";
    [self fetchGithubRepositories];
    [self.tableView registerClass:[GithubRepositoryTableViewCell class] forCellReuseIdentifier:@"GithubCell"];
    self.tableView.rowHeight = 55;
}

#pragma mark -  API

- (void)fetchGithubRepositories {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableURLRequest *request =
        [NSMutableURLRequest requestWithURL:[NSURL
                                             URLWithString:@"https://api.github.com/search/repositories?q=language:objc&sort=stars&order=desc&per_page=100"]
                                cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                            timeoutInterval:30
         ];
        
        [request setHTTPMethod: @"GET"];
        
        NSError *requestError;
        NSURLResponse *urlResponse = nil;
        
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
        NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:response options:kNilOptions error:nil];
        
        NSLog(@"%@", responseDict);
        
        self.githubRepositories = [responseDict objectForKey:@"items"];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.githubRepositories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GithubRepositoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GithubCell" forIndexPath:indexPath];
    [self configureCell:cell forRowAtIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(GithubRepositoryTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *repositoryDictionary = [self.githubRepositories objectAtIndex:indexPath.row];
    cell.textLabel.text = repositoryDictionary[@"name"];
    cell.detailTextLabel.text = repositoryDictionary[@"description"];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *repositoryDictionary = [self.githubRepositories objectAtIndex:indexPath.row];
    WebViewController *webVC = [[WebViewController alloc] initWithURL:repositoryDictionary[@"clone_url"]];
    webVC.title = repositoryDictionary[@"name"];
    [self.navigationController pushViewController:webVC animated:YES];
}

@end

//
//  SearchQuestionViewController.m
//  StackOverFlowClient
//
//  Created by Annemarie Ketola on 2/17/15.
//  Copyright (c) 2015 Up Early, LLC. All rights reserved.
//

#import "SearchQuestionViewController.h"
#import "StackOverFlowService.h"
#import "Question.h"
#import "QuestionCell.h"
#import "UserViewController.h"

@interface SearchQuestionViewController () <UISearchBarDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSArray *questions;

@end

@implementation SearchQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.searchBar.delegate = self;
  self.tableView.dataSource = self;
  self.tableView.rowHeight = UITableViewAutomaticDimension;
  self.tableView.pagingEnabled = true;
  
    // Do any additional setup after loading the view.
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
  
  [[StackOverFlowService sharedService] fetchQuestionWithSearchTerm:searchBar.text completionHandler:^(NSArray *results, NSString *error) {
    self.questions = results;
    if (error) {
      
    }
    [self.tableView reloadData];
  }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.questions.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  QuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QUESTION_CELL" forIndexPath:indexPath];
  cell.avatarImage.image = nil;
  Question *question = self.questions[indexPath.row];
  cell.questionResultsText.text = question.title;
  if (!question.image) {
    [[StackOverFlowService sharedService] fetchUserImage:question.avatarURL completionHandler:^(UIImage *image) {
      question.image = image;
      cell.avatarImage.image = image;
    }];
  } else {
    cell.avatarImage.image = question.image;
  }
  return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"SHOW_USER_PROFILE"]) {
    UserViewController *destinationVC = segue.destinationViewController;
    NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
    Question *question = self.questions[indexPath.row];
    self.selectedUser = question.userID;
//    destinationVC.selectedUser = self.selectedUser; // <- no idea why this doesn't work
  }
}

@end

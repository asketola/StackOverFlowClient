//
//  ProfileViewController.m
//  StackOverFlowClient
//
//  Created by Annemarie Ketola on 2/18/15.
//  Copyright (c) 2015 Up Early, LLC. All rights reserved.
//

#import "ProfileViewController.h"
#import "StackOverFlowService.h"
#import "Profile.h"

@interface ProfileViewController () <UIScrollViewDelegate>
@property (retain, nonatomic) UIScrollView *scrollView;
@property (retain, nonatomic) IBOutlet UILabel *userNameLabel;
@property (retain, nonatomic) IBOutlet UIImageView *userAvatarImage;
@property (retain, nonatomic) IBOutlet UITextView *userDescriptionTextView;
@property (retain, nonatomic) IBOutlet UILabel *websiteLabel;
@property (retain, nonatomic) IBOutlet UILabel *locationLabel;
@property (retain, nonatomic) IBOutlet UILabel *memberForLabel;
@property (retain, nonatomic) IBOutlet UILabel *visitedLabel;
@property (retain, nonatomic) IBOutlet UILabel *seenLabel;
@property (retain, nonatomic) IBOutlet UILabel *profileLabel;
@property (retain, nonatomic) IBOutlet UILabel *emailLabel;
@property (retain, nonatomic) IBOutlet UILabel *realNameLabel;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
  
  
//  _userNameLabel.text = Profile.userName;
  _userDescriptionTextView.text = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.";
  _websiteLabel.text = @"www.yahoo.com";
  _locationLabel.text = @"Seattle";
  _memberForLabel.text = @"Feb 2014";
  _visitedLabel.text = @"12 hours";
  _seenLabel.text = @"20 hours ago";
  _profileLabel.text = @"20";
  _emailLabel.text = @"myemail@gmail.com";
  _realNameLabel.text = @"Anne Ketola";
  
  // _userAvatarImage.image =
//  _userNameLabel.text = @"asketola";
//  _userDescriptionTextView.text = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.";
//  _websiteLabel.text = @"www.yahoo.com";
//  _locationLabel.text = @"Seattle";
//  _memberForLabel.text = @"Feb 2014";
//  _visitedLabel.text = @"12 hours";
//  _seenLabel.text = @"20 hours ago";
//  _profileLabel.text = @"20";
//  _emailLabel.text = @"myemail@gmail.com";
//  _realNameLabel.text = @"Anne Ketola";
//  
//  // _userAvatarImage.image =
  
  
  
    [super viewDidLoad];
  self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
  self.scrollView.contentSize = CGSizeMake(2000, 2000);
  [self.view addSubview:self.scrollView];
  
  UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 1000, 100, 50)];
  textField.backgroundColor = [UIColor blueColor];
  [self.scrollView addSubview:textField];
  [textField release];
  self.scrollView.delegate = self;
    // Do any additional setup after loading the view.
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
  NSLog(@"x:%f y%f", scrollView.contentOffset.x, scrollView.contentOffset.y);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc {
  [self.scrollView release];
  [super dealloc];
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

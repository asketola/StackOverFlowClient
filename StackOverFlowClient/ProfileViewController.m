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
@property (assign, nonatomic) IBOutlet UILabel *userNameLabel;
@property (assign, nonatomic) IBOutlet UIImageView *userAvatarImage;
@property (assign, nonatomic) IBOutlet UILabel *websiteLabel;
@property (assign, nonatomic) IBOutlet UILabel *locationLabel;
@property (assign, nonatomic) IBOutlet UILabel *ageLabel;
@property (assign, nonatomic) IBOutlet UILabel *bronzeLabel;
@property (assign, nonatomic) IBOutlet UILabel *silverLabel;
@property (assign, nonatomic) IBOutlet UILabel *goldLabel;
@property (assign, nonatomic) IBOutlet UILabel *reputationLabel;

@property (retain, nonatomic) NSArray *userProfile;
@property (retain, nonatomic) Profile *myProfile;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
  self.scrollView.contentSize = CGSizeMake(2000, 2000);
  [self.view addSubview:self.scrollView];
  
  UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 1000, 100, 50)];
  textField.backgroundColor = [UIColor blueColor];
  [self.scrollView addSubview:textField];
  [textField release];
  self.scrollView.delegate = self;
  
  [[StackOverFlowService sharedService] fetchProfile:^(NSArray *fetchedUserProfileResults, NSString *error) {
    self.userProfile = fetchedUserProfileResults;
    self.myProfile = self.userProfile.lastObject;

    self.userNameLabel.text = self.myProfile.userName;
    self.websiteLabel.text = self.myProfile.website;
    self.locationLabel.text = self.myProfile.location;
    if (self.myProfile.age != nil) {
    NSString *ageNtoS = [NSString stringWithFormat: @"%@", [self.myProfile.age stringValue]];
          self.ageLabel.text = ageNtoS;
    } else {
      self.ageLabel.text = @"";
    }
    
    NSString *reputationNtoS = [NSString stringWithFormat: @"%@", [self.myProfile.reputation stringValue]];
    NSString *bronzeNtoS = [NSString stringWithFormat: @"%@", [self.myProfile.bronze stringValue]];
    NSString *silverNtoS = [NSString stringWithFormat: @"%@", [self.myProfile.silver stringValue]];
    NSString *goldNtoS = [NSString stringWithFormat: @"%@", [self.myProfile.gold stringValue]];
    
    
    self.reputationLabel.text = reputationNtoS;
    self.bronzeLabel.text = bronzeNtoS;
    self.silverLabel.text = silverNtoS;
    self.goldLabel.text = goldNtoS;
    
    [[StackOverFlowService sharedService] fetchUserImage:self.myProfile.avatarURL completionHandler:^(UIImage *image) {
      self.userAvatarImage.image = image;
    }];
  }];

} // <- close ViewDidLoad


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

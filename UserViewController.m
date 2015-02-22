//
//  UserViewController.m
//  StackOverFlowClient
//
//  Created by Annemarie Ketola on 2/21/15.
//  Copyright (c) 2015 Up Early, LLC. All rights reserved.
//

#import "UserViewController.h"
#import "Profile.h"
#import "StackOverFlowService.h"

@interface UserViewController ()
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
@property (retain, nonatomic) Profile *theirProfile;
@property (retain, nonatomic) NSNumber *selectedUser;

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  NSLog(@"ViewDidLoad");
    // Do any additional setup after loading the view.
  self.selectedUser = [NSNumber numberWithInt:6161];
  NSString *userIDNtoS = [NSString stringWithFormat: @"%@", [self.selectedUser stringValue]];
  NSLog(@"userIDNtoS %@", userIDNtoS);
  
  [[StackOverFlowService sharedService] fetchSelectedUserProfile:userIDNtoS completionHandler:^(NSArray *fetchedUserProfileResults, NSString * error) {
    NSLog(@"started the fetchSelectedUserProfile");
    self.userProfile = fetchedUserProfileResults;
    self.theirProfile = self.userProfile.lastObject;
    
    self.userNameLabel.text = self.theirProfile.userName;
    self.websiteLabel.text = self.theirProfile.website;
    self.locationLabel.text = self.theirProfile.location;
    if (self.theirProfile.age != nil) {
      NSString *ageNtoS = [NSString stringWithFormat: @"%@", [self.theirProfile.age stringValue]];
      self.ageLabel.text = ageNtoS;
    } else {
      self.ageLabel.text = @"";
    }
    
    NSString *reputationNtoS = [NSString stringWithFormat: @"%@", [self.theirProfile.reputation stringValue]];
    NSString *bronzeNtoS = [NSString stringWithFormat: @"%@", [self.theirProfile.bronze stringValue]];
    NSString *silverNtoS = [NSString stringWithFormat: @"%@", [self.theirProfile.silver stringValue]];
    NSString *goldNtoS = [NSString stringWithFormat: @"%@", [self.theirProfile.gold stringValue]];
    
    self.reputationLabel.text = reputationNtoS;
    self.bronzeLabel.text = bronzeNtoS;
    self.silverLabel.text = silverNtoS;
    self.goldLabel.text = goldNtoS;
    
    [[StackOverFlowService sharedService] fetchUserImage:self.theirProfile.avatarURL completionHandler:^(UIImage *image) {
      self.userAvatarImage.image = image;
    }];
  }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

//
//  Profile.m
//  StackOverFlowClient
//
//  Created by Annemarie Ketola on 2/21/15.
//  Copyright (c) 2015 Up Early, LLC. All rights reserved.
//

#import "Profile.h"

@implementation Profile

+(NSArray *)profileFromJson:(NSData *)jsconProfileData {
  
  NSError *error;
  NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsconProfileData options:0 error:&error];
  if (error) {
    NSLog(@"%@", error.localizedDescription);
    return nil;
  }
  
  NSArray *items = [jsonDictionary objectForKey:@"items"];
  
  NSMutableArray *temp = [[NSMutableArray alloc] init];
  
  for (NSDictionary *item in items) {
    Profile *profile = [[Profile alloc] init];
    profile.userName = item[@"display_name"];
    NSDictionary *userInfo = item[@"user"];
    profile.website = userInfo[@"website_url"];
    profile.location = userInfo[@"location"];
    profile.age = userInfo[@"age"];
    profile.profileViews = userInfo[@"view_count"];
    profile.questionCount = userInfo[@"question_count"];
    profile.answerCount = userInfo[@"answer_count"];
    profile.reputation = userInfo[@"reputation"];
    profile.avatarURL = userInfo[@"profile_image"];
    profile.userDescription = userInfo[@"about_me"];

    [temp addObject:profile];
  }
  NSArray *final = [[NSArray alloc] initWithArray:temp];
  return final;
}

@end

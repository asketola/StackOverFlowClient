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
  
  NSLog(@"json parsing array is fired");
  
  NSError *error;
  NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsconProfileData options:0 error:&error];
  if (error) {
    NSLog(@"Error is %@", error.localizedDescription);
    return nil;
  }
  
  NSArray *items = [jsonDictionary objectForKey:@"items"];
  
  NSMutableArray *temp = [[NSMutableArray alloc] init];
  
  for (NSDictionary *item in items) {
    Profile *profile = [[Profile alloc] init];
    profile.userName = item[@"display_name"];
    profile.website = item[@"website_url"];
    profile.location = item[@"location"];
    profile.age = item[@"age"];
    profile.reputation = item[@"reputation"];
    profile.avatarURL = item[@"profile_image"];
    NSDictionary *badges = item[@"badge_counts"];
    profile.bronze = badges[@"bronze"];
    profile.silver = badges[@"silver"];
    profile.gold = badges[@"gold"];
    
    NSLog(@"userName: %@", profile.userName);
    NSLog(@"website: %@", profile.website);
    NSLog(@"location: %@", profile.location);
    NSLog(@"age: %@", profile.age);
    NSLog(@"reputation: %@", profile.reputation);
    NSLog(@"avatarURL: %@", profile.avatarURL);
    NSLog(@"bronze: %@", profile.bronze);
    NSLog(@"silver: %@", profile.silver);
    NSLog(@"gold: %@", profile.gold);
 
    [temp addObject:profile];
  }
  NSArray *final = [[NSArray alloc] initWithArray:temp];
  NSLog(@"final array: %@", final);
  return final;
}

@end

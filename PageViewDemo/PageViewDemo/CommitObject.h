//
//  CommitObject.h
//  PageViewDemo
//
//  Created by Abdul Haziq on 05/04/2017.
//  Copyright © 2017 Abdul Haziq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommitObject : NSObject

@property (nonatomic,strong) NSString *commitMessage;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *email;
@property (nonatomic,strong) NSString *date;
@property (nonatomic,strong) NSString *commitNo;
@property (nonatomic,strong) NSString *totalCommit;
@property (nonatomic,strong) NSString *errorMessage;
@end

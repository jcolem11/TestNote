//
//  TNNote.h
//  TestNote
//
//  Created by Owner on 7/16/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TNNote : NSString <NSCoding>

@property (strong,nonatomic) NSString *noteText;
@property (strong,nonatomic) NSDate *noteDate;

-(id)initWithText:(NSString*)text withDate:(NSDate*)date;


@end

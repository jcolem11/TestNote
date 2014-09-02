//
//  TNNote.m
//  TestNote
//
//  Created by Owner on 7/16/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import "TNNote.h"


@implementation TNNote

-(id) initWithText:(NSString *)text withDate:(NSDate*)date
{
    self.noteText=text;
    self.noteDate=date;
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject: self.noteText forKey: @"NoteText"];
    [coder encodeObject: self.noteDate forKey: @"NoteDate"];
}

-(id)initWithCoder:(NSCoder *)decoder
{
    self=[super init];
    if (self != nil)
    {
        self.noteText=[decoder decodeObjectForKey:@"NoteText"];
        self.noteDate=[decoder decodeObjectForKey:@"NoteDate"];
    }
    return self;
}
@end

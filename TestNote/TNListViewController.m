
//
//  TNListViewController.m
//  TestNote
//
//  Created by Owner on 7/14/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import "TNListViewController.h"
#import "TNCreateViewController.h"
#import "TNNote.h"
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface TNListViewController ()

@property (strong,nonatomic) NSMutableArray *noteList;

@end

@implementation TNListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.noteList=[[NSMutableArray alloc] init];
    NSLog(@"%@ has been allocated",self.noteList);
    
    NSData *dataToUnarchive=[[NSUserDefaults standardUserDefaults] objectForKey:@"notes"];
    self.noteList=[NSKeyedUnarchiver unarchiveObjectWithData:dataToUnarchive];
    NSLog(@"unarchived data%@",dataToUnarchive);
    
    // UI stuff
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.58 green:0.77 blue:0.49 alpha:1.0];
   
    /*
    UIButton *newNoteButton=[[UIButton alloc] initWithFrame:CGRectMake(135, 10, 50, 50)];
    //newNoteButton.layer.cornerRadius=25;
    [newNoteButton setTitle:@"+" forState:UIControlStateNormal];
    newNoteButton.backgroundColor=[UIColor colorWithRed:0.58 green:0.77 blue:0.49 alpha:1.0];;
    //[newNoteButton addTarget:self action:@selector() forControlEvents:UIControlEventTouchUpInside];
   
    [self.tableView addSubview:newNoteButton];
     */
    
    self.tableView.separatorStyle= UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor=[UIColor lightGrayColor];
    self.tableView.backgroundColor=[UIColor whiteColor];
    
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    //Get Note from source
    TNCreateViewController *sourceController = [segue sourceViewController];    
    TNNote *note = sourceController.addNote;
    
    if(note != nil)
    {
        [self.noteList addObject:note];
        [self.tableView reloadData];
        self.clearsSelectionOnViewWillAppear=YES;
       NSData *listData=[NSKeyedArchiver archivedDataWithRootObject:self.noteList];
       [[NSUserDefaults standardUserDefaults]  setObject:listData forKey:@"notes"];
        NSLog(@"Current List Data %@",listData);
    }    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.noteList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier=@"NoteCell";
 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    //Display note text
    TNNote *noteToDisplay=[self.noteList objectAtIndex:indexPath.row];
    cell.textLabel.text=noteToDisplay.noteText;
    
    //Display note date
    NSDate *date=noteToDisplay.noteDate;
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    [formatter setDateFormat:@"MMMM dd | h:mm a"];
    NSLog(@"Date to display: %@",[formatter stringFromDate:date]);
    
    UILabel *dateLabel=[[UILabel alloc]initWithFrame:CGRectMake(200, -15, 100, 70)];
    dateLabel.adjustsFontSizeToFitWidth=YES;
    dateLabel.text=[formatter stringFromDate:date];
    
    [cell.contentView addSubview:dateLabel];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //Must delete note from array first!
    [self.noteList removeObjectAtIndex:indexPath.row];
    
    if(editingStyle==UITableViewCellEditingStyleDelete)
    {
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else
        return;

}


-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}


#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end

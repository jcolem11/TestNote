//
//  TNCreateViewController.m
//  TestNote
//
//  Created by Owner on 7/14/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import "TNCreateViewController.h"
#import "TNNote.h"


@interface TNCreateViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;


@end

@implementation TNCreateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // UI stuff
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.58 green:0.77 blue:0.49 alpha:1.0];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
     if( sender==self.doneButton)
     {
         if (self.textField.text.length>0)
         {
             self.addNote=[[TNNote alloc] init];
             self.addNote.noteText=self.textField.text;
             self.addNote.noteDate=[NSDate date];
            
         }
         else
             return;
    }
   else
       return;
 
}


@end

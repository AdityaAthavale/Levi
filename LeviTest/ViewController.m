//
//  ViewController.m
//  LeviTest
//
//  Created by Aditya Athavale on 4/27/15.
//  Copyright (c) 2015 Aditya Athavale. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"

@interface ViewController () <UITableViewDataSource>
{
    NSMutableArray *arrData;
    NSMutableDictionary *dictResults;
}
@property (weak, nonatomic) IBOutlet UITableView *table;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_table setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5]];
    
    arrData = [NSMutableArray array];
    [arrData addObject:@"Black Tie"];
    [arrData addObject:@"Active Ware"];
    [arrData addObject:@"Dress to Drinks"];
    [arrData addObject:@"Professional Chick"];
    [arrData addObject:@"Editors Picks"];
    
    dictResults = [NSMutableDictionary dictionary];
    [dictResults setObject:@0.0 forKey:@"Black Tie"];
    [dictResults setObject:@0.0 forKey:@"Active Ware"];
    [dictResults setObject:@0.0 forKey:@"Dress to Drinks"];
    [dictResults setObject:@0.0 forKey:@"Professional Chick"];
    [dictResults setObject:@0.0 forKey:@"Editors Picks"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)savePressed:(id)sender
{
    NSLog(@"Current Status : %@", dictResults);
}

#pragma mark- Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    cell.lblTitle.text = [arrData objectAtIndex:indexPath.row];
    
    cell.btnFollow.tag = indexPath.row;
    
    if([[dictResults objectForKey:[arrData objectAtIndex:indexPath.row]] intValue] == 1)
    {
        [cell.btnFollow setTitle:@"Following" forState:UIControlStateNormal];
    }
    else
    {
        [cell.btnFollow setTitle:@"Follow" forState:UIControlStateNormal];
    }
    [cell.btnFollow addTarget:self action:@selector(clickedFollowButton:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

-(void)clickedFollowButton:(UIButton *)sender
{
    NSArray *arrKeys = [dictResults allKeys];
    if([arrKeys containsObject:[arrData objectAtIndex:sender.tag]])
    {
        if([[dictResults objectForKey:[arrData objectAtIndex:sender.tag]] intValue] == 1)
        {
            [dictResults setObject:(id)@0.0 forKey:[arrData objectAtIndex:sender.tag]]
            ;
        }
        else
        {
            [dictResults setObject:(id)@1.0 forKey:[arrData objectAtIndex:sender.tag]]
            ;
        }
    }
    [_table reloadData];
}


@end

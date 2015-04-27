//
//  CustomTableViewCell.h
//  LeviTest
//
//  Created by Aditya Athavale on 4/27/15.
//  Copyright (c) 2015 Aditya Athavale. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnFollow;

@end

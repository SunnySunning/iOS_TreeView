//
//  TreeViewCell.h
//  TreeView
//
//  Created by bfec on 16/12/24.
//  Copyright © 2016年 com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TreeNode.h"

#define ExamReviewBtClick @"ExamReviewBtClick"

@interface TreeViewCell : UITableViewCell

+ (id)cellWithTableView:(UITableView *)tableView;
- (void)updateCellWithData:(TreeNode *)node;

@end

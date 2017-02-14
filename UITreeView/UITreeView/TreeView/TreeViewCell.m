//
//  TreeViewCell.m
//  TreeView
//
//  Created by bfec on 16/12/24.
//  Copyright © 2016年 com. All rights reserved.
//

#import "TreeViewCell.h"
#import "TreeViewPresenter.h"
#define IndentationWidth 15

@interface TreeViewCell ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *partLineX0_superX0;

@end

@implementation TreeViewCell

+ (id)cellWithTableView:(UITableView *)tableView
{
    NSString *clssName = NSStringFromClass([self class]);
    [tableView registerNib:[UINib nibWithNibName:clssName bundle:[NSBundle mainBundle]] forCellReuseIdentifier:clssName];
    TreeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:clssName];
    cell.indentationWidth = IndentationWidth;
    return cell;
}


- (void)updateCellWithData:(TreeNode *)node
{
    self.indentationLevel = node.depth;
    self.textLabel.text = node.name;
    self.partLineX0_superX0.constant = 8 + node.depth * IndentationWidth;
}




@end

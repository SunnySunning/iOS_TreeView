//
//  TreeViewPresenter.m
//  XPT
//
//  Created by bfec on 16/12/26.
//  Copyright © 2016年 sff. All rights reserved.
//

#import "TreeViewPresenter.h"

@implementation TreeViewPresenter

- (TreeNode *)rootNodeWithModel:(id)model
{
    /*
     *  实际项目中需要根据传进来的model进行递归组装tree结构,下边只是例子
     */
    TreeNode *treeNode111 = [[TreeNode alloc] initWithNodeId:111 parentId:11 name:@"商河县" depth:3 isExpand:NO children:nil andExtraData:nil];
    TreeNode *treeNode11 = [[TreeNode alloc] initWithNodeId:11 parentId:1 name:@"济南市" depth:2 isExpand:YES children:    [NSMutableArray arrayWithObject:treeNode111] andExtraData:nil];
    TreeNode *treeNode1 = [[TreeNode alloc] initWithNodeId:1 parentId:0 name:@"山东省" depth:1 isExpand:YES children:    [NSMutableArray arrayWithObject:treeNode11] andExtraData:nil];
    TreeNode *rootNode = [[TreeNode alloc] initWithNodeId:0 parentId:-1 name:@"中国" depth:0 isExpand:YES children:    [NSMutableArray arrayWithObject:treeNode1] andExtraData:nil];
    
    return rootNode;
}

@end

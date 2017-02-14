//
//  TreeNode.m
//  TreeView
//
//  Created by bfec on 16/12/24.
//  Copyright © 2016年 com. All rights reserved.
//

#import "TreeNode.h"

@implementation TreeNode

- (id)initWithNodeId:(NSInteger)nodeId parentId:(NSInteger)parentId name:(NSString *)name depth:(NSInteger)depth isExpand:(BOOL)expand children:(NSMutableArray<TreeNode *> *)children andExtraData:(id)extraData
{
    if (self = [super init])
    {
        self.nodeId = nodeId;
        self.parentId = parentId;
        self.name = [name copy];
        self.depth = depth;
        self.expand = expand;
        self.children = (children == nil ? [NSMutableArray array] : children);
        self.extraData = extraData;
    }
    return self;
}

- (void)setExpand:(BOOL)expand
{
    _expand = expand;
    if (expand == NO)
    {
        for (TreeNode *childNode in self.children)
        {
            childNode.expand = expand;
            [childNode setExpand:expand];
        }
    }
}

- (void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    if (isSelected == YES)
    {
        [self setOtherNode:self.rootNode];
        _isSelected = YES;
    }
}

- (void)setOtherNode:(TreeNode *)rootNode
{
    for (TreeNode *childNode in rootNode.children)
    {
        childNode.isSelected = NO;
        [self setOtherNode:childNode];
    }
}






















@end

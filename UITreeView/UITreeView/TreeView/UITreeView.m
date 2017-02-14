//
//  UITreeView.m
//  TreeView
//
//  Created by bfec on 16/12/24.
//  Copyright © 2016年 com. All rights reserved.
//

#import "UITreeView.h"
#import "TreeViewCell.h"

@interface UITreeView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) TreeNode *rootNode;
@property (nonatomic,strong) NSMutableArray *treeArr;

@end

@implementation UITreeView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style])
    {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

- (void)reloadWithData:(TreeNode *)rootNode
{
    if (rootNode == nil)
        return;
    
    _rootNode = rootNode;
    [self.treeArr removeAllObjects];
    [self _dataAdapterWithData:rootNode];
    [self reloadData];
}

- (NSMutableArray *)treeArr
{
    if (!_treeArr)
    {
        _treeArr = [NSMutableArray array];
    }
    return _treeArr;
}

- (void)_dataAdapterWithData:(TreeNode *)rootNode
{
    //if (self.isRootNodeShow)
    {
        [self.treeArr addObject:rootNode];
    }
    [self _findChildrenWithParentNode:rootNode childrenArr:self.treeArr];
}

- (void)_findChildrenWithParentNode:(TreeNode *)parentNode childrenArr:(NSMutableArray *)childrenArr
{
    if (parentNode.expand)
    {
        for (TreeNode *childNode in parentNode.children)
        {
            [childrenArr addObject:childNode];
            [self _findChildrenWithParentNode:childNode childrenArr:childrenArr];
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.treeArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TreeViewCell *cell = [TreeViewCell cellWithTableView:tableView];
    TreeNode *node = [self.treeArr objectAtIndex:indexPath.row];
    [cell updateCellWithData:node];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{    
    TreeNode *currentNode = [self.treeArr objectAtIndex:indexPath.row];
    
    if ([self.treeViewDelegate respondsToSelector:@selector(treeView:didSelectNode:)])
    {
        [self.treeViewDelegate treeView:self didSelectNode:currentNode];
    }
    
    NSInteger beginIndex = indexPath.row;
    NSInteger len = 0;
    NSMutableArray *childrenArr = [NSMutableArray array];
    
    
    if (currentNode.expand)//现在要关闭
    {
        [self _findChildrenWithParentNode:currentNode childrenArr:childrenArr];
    }
    else
    {
        [childrenArr addObjectsFromArray:currentNode.children];
    }
    len = childrenArr.count;

    
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(beginIndex + 1, len)];
    NSMutableArray *indexPathArr = [NSMutableArray array];
    for (int i = 0; i < [childrenArr count]; i++)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i + beginIndex + 1 inSection:0];
        [indexPathArr addObject:indexPath];
    }
    
    if (currentNode.expand)
    {
        [self.treeArr removeObjectsAtIndexes:indexSet];
        [self deleteRowsAtIndexPaths:indexPathArr withRowAnimation:UITableViewRowAnimationBottom];
    }
    else
    {
        [self.treeArr insertObjects:currentNode.children atIndexes:indexSet];
        [self insertRowsAtIndexPaths:indexPathArr withRowAnimation:UITableViewRowAnimationTop];
    }
    
    
    //自己是否选中,需要进一步判断,假如自己选中,其他所有的节点是不选中的(点击也不会重新刷新tableview,所以也需要发通知)
    currentNode.isSelected = YES;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TreeViewCellSelected" object:currentNode];

    
    currentNode.expand = !currentNode.expand;
    //由于调用insert或者delete不会重新刷新tableview,所以箭头的方向问题不能由改变model属性的方式解决.
    //现在的方案是发送通知,通知带着相应的model对象
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TreeViewCellClicked" object:currentNode];
}


- (NSArray *)getTreeArr
{
    return _treeArr;
}


















@end

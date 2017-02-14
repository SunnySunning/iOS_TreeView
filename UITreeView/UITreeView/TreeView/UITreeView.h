//
//  UITreeView.h
//  TreeView
//
//  Created by bfec on 16/12/24.
//  Copyright © 2016年 com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TreeNode.h"
#import "TreeViewPresenter.h"

@class UITreeView;
@protocol UITreeViewDelegate <NSObject>

- (void)treeView:(UITreeView *)treeView didSelectNode:(TreeNode *)node;

@end

@interface UITreeView : UITableView

@property (nonatomic,weak) id<UITreeViewDelegate> treeViewDelegate;
@property (nonatomic,assign) BOOL isRootNodeShow;

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;
- (void)reloadWithData:(TreeNode *)rootNode;

- (NSArray *)getTreeArr;

@end

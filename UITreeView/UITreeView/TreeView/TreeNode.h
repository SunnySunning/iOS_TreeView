//
//  TreeNode.h
//  TreeView
//
//  Created by bfec on 16/12/24.
//  Copyright © 2016年 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TreeNode : NSObject

@property (nonatomic,assign) NSInteger nodeId;
@property (nonatomic,assign) NSInteger parentId;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSInteger depth;
@property (nonatomic,assign) BOOL expand;//(子节点是否展示)
@property (nonatomic,strong) NSMutableArray *children;
@property (nonatomic,strong) id extraData;
@property (nonatomic,assign) BOOL isSelected;//(节点是否被选中)
@property (nonatomic,weak) TreeNode *parentNode;
@property (nonatomic,weak) TreeNode *rootNode;

- (id)initWithNodeId:(NSInteger)nodeId parentId:(NSInteger)parentId name:(NSString *)name depth:(NSInteger)depth isExpand:(BOOL)expand children:(NSMutableArray <TreeNode *>*)children andExtraData:(id)extraData;
- (void)setExpand:(BOOL)expand;
- (void)setIsSelected:(BOOL)isSelected;

@end

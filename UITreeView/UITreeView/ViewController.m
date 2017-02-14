//
//  ViewController.m
//  UITreeView
//
//  Created by bfec on 17/2/14.
//  Copyright © 2017年 com. All rights reserved.
//

#import "ViewController.h"
#import "UITreeView.h"

@interface ViewController ()

@property (nonatomic,weak) UITreeView *treeView;
@property (nonatomic,strong) TreeViewPresenter *treeViewPresenter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.treeView reloadWithData:[self.treeViewPresenter rootNodeWithModel:nil]];
}


- (UITreeView *)treeView
{
    if (!_treeView)
    {
        UITreeView *treeView = [[UITreeView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
        _treeView = treeView;
        [self.view addSubview:_treeView];
    }
    return _treeView;
}


- (TreeViewPresenter *)treeViewPresenter
{
    if (!_treeViewPresenter)
    {
        _treeViewPresenter = [[TreeViewPresenter alloc] init];
    }
    return _treeViewPresenter;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}









@end

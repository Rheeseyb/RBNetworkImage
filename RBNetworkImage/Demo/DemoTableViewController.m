//
//  DemoTableViewController.m
//  RBNetworkImage
//
//  Created by Rheese Burgess on 07/02/2014.
//  Copyright (c) 2014 Rheese Burgess. All rights reserved.
//

#import "DemoTableViewController.h"
#import "DemoTableViewCell.h"

@implementation DemoTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (section == 0) ? 100 : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [DemoTableViewCell cellForTableView:tableView forIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 300.0f;
}

@end

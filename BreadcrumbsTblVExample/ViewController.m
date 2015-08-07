//
//  ViewController.m
//  BreadcrumbsTblVExample
//
//  Created by Herman Roman on 8/7/15.
//  Copyright (c) 2015 Herman Roman. All rights reserved.
//

#import "ViewController.h"
#import "BreadCrumbTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController () <UITableViewDataSource, UITableViewDelegate> {
    int numberOfSections;
}
@property (weak, nonatomic) IBOutlet UITableView *breadcrumbsTable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    numberOfSections = 3;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            return 0;
            break;
        case 1:
            return 0;
            break;
        case 2:
            return 20;
            break;
            
        default:
            return 0;
            break;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view;
    CGFloat height;
    CGFloat fontSize;
    switch (section) {
        case 0:
            height = 15.0;
            fontSize = 10.0;
            break;
        case 1:
            height = 15.0;
            fontSize = 10.0;
            break;
        case 2:
            height = 30.0;
            fontSize = 20.0;
            break;
        default:
            height = 15.0;
            fontSize = 10.0;
            break;
    }
    
    
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, height)];
    view.backgroundColor = [UIColor whiteColor];
    
    [view addSubview:[self getTopLine]];
    
    if (section == (numberOfSections-1)) {
        UIView *line = [self getTopLine];
        CGRect frame = line.frame;
        frame.origin.y = height - 1;
        line.frame = frame;
        [view addSubview:line];
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:view.frame];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"section %li", (long)section];
    
    [view addSubview:label];
    
    return view;
}

- (UIView *)getTopLine {
    UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.breadcrumbsTable.frame.size.width, 1)];
    topLine.backgroundColor = [UIColor blueColor];
    
    return topLine;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            return 0.0;
            break;
        case 1:
            return 0.0;
            break;
        case 2:
            return 30.0;
            break;
            
        default:
            return 30.0;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 15.0;
            break;
        case 1:
            return 15.0;
            break;
        case 2:
            return 30.0;
            break;
            
        default:
            return 30.0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BreadCrumbTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BreadCrumbTableViewCell"];
    return cell;
}

@end

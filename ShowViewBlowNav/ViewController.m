//
//  ViewController.m
//  ShowViewBlowNav
//
//  Created by Ken on 2017/2/12.
//  Copyright © 2017年 AIA. All rights reserved.
//

#import "ViewController.h"
#import "BlowNavView.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>


@property (strong, nonatomic) IBOutlet UITableView *tableV;
@property (nonatomic, strong) NSArray *dataSourceArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initComponent];
}

- (void)initComponent
{
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.dataSourceArr.count;
}
- (NSArray *)dataSourceArr

{
    if (_dataSourceArr == nil)
    {
        self.dataSourceArr =  [NSArray arrayWithObjects:@"第一个cell", @"第二个cell", @"第三个cell", nil];
    }
    return _dataSourceArr;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    

    
    cell.textLabel.text = self.dataSourceArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self showViewBlowNav];
}

- (void)showViewBlowNav
{
    BlowNavView *blowNavV = [[NSBundle mainBundle] loadNibNamed:@"BlowNavView" owner:nil options:nil][0];
    [self.navigationController.view insertSubview:blowNavV belowSubview:self.navigationController.navigationBar];
//    [self.view addSubview:blowNavV];

    CGFloat duration = 2;
    CGFloat moveH = 264;

    [UIView animateWithDuration:duration animations:^{
        // 往下移动一个label的高度
        blowNavV.transform = CGAffineTransformMakeTranslation(0, moveH);
    } completion:nil];
     
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

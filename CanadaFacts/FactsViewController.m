//
//  ViewController.m
//  Facts
//
//  Created by Amal Rajan on 5/20/18.
//  Copyright © 2018 RanjeetHO. All rights reserved.
//

#import "FactsViewController.h"
#import "FactsViewCell.h"
#import "FactsJsonObject.h"
#import "FactModel.h"

@interface FactsViewController ()

@end

@implementation FactsViewController
@synthesize tableView;
@synthesize canadaFactsList;

- (void)viewDidLoad {
    [super viewDidLoad];
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
    tableView.delegate = self;
    tableView.dataSource = self;
    
    
    [tableView .refreshControl addTarget:self.tableView action:@selector(refreshTableView) forControlEvents:UIControlEventValueChanged];

    // adding tableView to canvas
    [self.view addSubview:tableView];
    
    // web service call made to fetch json data
    [self fetchJsonData];
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self setConstraintsForTableView];
    
    UIRefreshControl *factsRefreshControl = [[UIRefreshControl alloc]init];
    tableView.refreshControl = factsRefreshControl;
    [tableView .refreshControl addTarget:self action:@selector(refreshTableView) forControlEvents:UIControlEventValueChanged];
}

-(void)fetchJsonData{
    FactsJsonObject *jsonObject = [[FactsJsonObject alloc] init];
    jsonObject.delegate = self;
    [jsonObject fetchJsonData];
}

-(void) setConstraintsForTableView{
    NSLayoutConstraint *width =[NSLayoutConstraint
                                constraintWithItem:self.tableView
                                attribute:NSLayoutAttributeWidth
                                relatedBy:0
                                toItem:self.view
                                attribute:NSLayoutAttributeWidth
                                multiplier:1.0
                                constant:0];
    NSLayoutConstraint *height =[NSLayoutConstraint
                                 constraintWithItem:self.tableView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:0
                                 toItem:self.view
                                 attribute:NSLayoutAttributeHeight
                                 multiplier:1.0
                                 constant:0];
    NSLayoutConstraint *top = [NSLayoutConstraint
                               constraintWithItem:self.tableView
                               attribute:NSLayoutAttributeTop
                               relatedBy:NSLayoutRelationEqual
                               toItem:self.view
                               attribute:NSLayoutAttributeTop
                               multiplier:1.0f
                               constant:0.f];
    NSLayoutConstraint *leading = [NSLayoutConstraint
                                   constraintWithItem:self.tableView
                                   attribute:NSLayoutAttributeLeading
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:self.view
                                   attribute:NSLayoutAttributeLeading
                                   multiplier:1.0f
                                   constant:0.f];
    
    [self.view addConstraint:width];
    [self.view  addConstraint:height];
    [self.view  addConstraint:top];
    [self.view  addConstraint:leading];

}

-(void)updateFactDataInUI:(FactModel *)model {
    self.canadaFactsList = model;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

-(void)serviceFailedWithError:(NSError *)error{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error Fecthing Data" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)refreshTableView{
    if(tableView.refreshControl){
        [self fetchJsonData];
        [tableView reloadData];
        [tableView.refreshControl endRefreshing];
    }
}

#pragma mark - UITableViewDataSource

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *tableTitle;
    tableTitle = [self.canadaFactsList valueForKey:@"title"];
    return tableTitle;
}


// number of section(s), now I assume there is only 1 section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return self.canadaFactsList.rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"FactsCell";
    FactsViewCell *cell = (FactsViewCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[FactsViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.tag = indexPath.row;
    
    cell.labelTitle.text = self.canadaFactsList.rows[indexPath.row].title;
    cell.labelDescription.text = self.canadaFactsList.rows[indexPath.row].theDescription;
    
    cell.imageFact.image = nil;
    cell.imageFact.image = [UIImage imageNamed:@"default.png"];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^(void) {
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.canadaFactsList.rows[indexPath.row].imageHref]];
        UIImage* image = [[UIImage alloc] initWithData:imageData];
        if (image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (cell.tag == indexPath.row) {
                    cell.imageFact.image = image;
                    [cell setNeedsLayout];
                }
            });
        }
    });
    
    [cell layoutIfNeeded];
    if (indexPath.row % 2 == 0){
        cell.contentView.backgroundColor = [UIColor grayColor];
    }
    else{
        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

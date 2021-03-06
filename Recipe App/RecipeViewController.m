//
//  RecipeViewController.m
//  Recipe App
//
//  Created by Wagner Pinto on 2/4/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipeViewController.h"
#import "RecipesTableViewDataSource.h"
#import "RecipeDetailViewController.h"
#import "RARecipes.h"

@interface RecipeViewController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView; //Add a UITableView as a property on the viewController class
@property (nonatomic, strong) RecipesTableViewDataSource *datasource;

@end

@implementation RecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [UITableView new]; //Initialize and add the tableView as a subview of the main view
    self.tableView.frame = self.view.bounds; //set the bounds of the tableView to the size of the window
    
    self.datasource = [RecipesTableViewDataSource new];
    self.tableView.dataSource = self.datasource;
    [self.datasource registerTableView:self.tableView];

    [self.view addSubview: self.tableView];
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@"%li", (long)indexPath.row);
    
    RecipeDetailViewController *dvc = [RecipeDetailViewController new];
    dvc.title = [RARecipes titleAtIndex:indexPath.row];
    dvc.indexRecipes = indexPath.row;
        
    [self.navigationController pushViewController:dvc animated:YES];

}
     

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

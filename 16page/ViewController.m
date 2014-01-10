//
//  ViewController.m
//  16page
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "ProductCell.h"
#import "Catalog.h"
#import "Product.h"
#import "CartDelegate.h"
#import "Cart.h"

#import "ProductDetailViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, CartDelegate>

@property NSMutableArray *cartItems;
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) Cart *cart;




@end



@implementation ViewController



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    ProductDetailViewController *detailVC = segue.destinationViewController;
    
    NSIndexPath *indexPath = [self.table indexPathForCell:sender];
    
    Product *selectedProduct = [[Catalog defaultCatalog] productAt:indexPath.row];
    
    detailVC.productCode = selectedProduct.code;
    
    
}


// 카타로그 델리게이트 : 제품을 카트에 추가한다
- (void)addItem:(id)sender
{
    //제품 식별자를 위한 인덱스
    NSIndexPath *indexPath = [_table indexPathForCell:sender];
    Product *product = [[Catalog defaultCatalog] productAt:indexPath.row];
    
    [self.cart addProduct:product];
    
    //[cartItems addObject:product];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [_table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    
    
}

// 섹션0 : 카탈로그, 섹션1 : 카트
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==0) {
        return [[Catalog defaultCatalog] numberOfProducts];
    }
    else
        return [self.cart.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL"];
        cell.delegate = self;
        Product *product = [[Catalog defaultCatalog] productAt:indexPath.row];
        [cell setProductInfo:product];
        return cell;
    }
    else{
        
        CartCell *cell = (CartCell *)[tableView dequeueReusableCellWithIdentifier:@"CART_CELL"];
        cell.delegate = self;
        CartItem *cartItem = self.cart.items[indexPath.row];
        
        [cell setCartItem:cartItem];

        return cell;
        
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Product";
    }
    else
    {
        return @"Items in Cart";
    }
}

- (void)incQuantity:(NSString *)productCode
{
    [self.cart incQuantity:productCode];
    NSIndexSet *indextSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indextSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)decQuantity:(NSString *)productCode
{
    [self.cart decQuantity:productCode];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.cart = [[Cart alloc]init];
    self.cart.items = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

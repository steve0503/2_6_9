//
//  ProductCell.h
//  16page
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "CartDelegate.h"
#import "Cart.h"
#import "CartCell.h"

@interface ProductCell : UITableViewCell

- (void)setProductInfo:(Product *)item;
@property (weak) id <CartDelegate> delegate;

@end
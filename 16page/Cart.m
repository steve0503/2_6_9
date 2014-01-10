//
//  Cart.m
//  16page
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "Cart.h"



@implementation Cart


- (void)addProduct:(Product *)item
{
    
    CartItem *cartItem = [self cartItemWith:item.code];
    if (cartItem == nil) {
        cartItem = [[CartItem alloc] init];
        cartItem.product = item;
        cartItem.quantity =1;
        [self.items addObject:cartItem];
        NSLog(@"aaa");
    }
    else
    {
        [self incQuantity:item.code];
    }
    
    
}

- (void)incQuantity:(NSString *)productCode
{
    CartItem *item =[self cartItemWith:productCode];
    item.quantity++;
}
- (void)decQuantity:(NSString *)productCode
{
    CartItem *item = [self cartItemWith:productCode];
    item.quantity--;
    
    if (item.quantity == 0) {
        [self.items removeObject:item];
    }
}
- (CartItem *)cartItemWith:(NSString *)productCode
{
    for (CartItem *item in self.items) {
        if ([item.product isEqualProduct:productCode]) {
            return item;
        }
    }
    return nil;
}


@end

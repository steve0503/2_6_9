//
//  Cart.h
//  16page
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
#import "CartItem.h"
#import "CartDelegate.h"



@interface Cart : NSObject

@property (weak) id <CartDelegate> delegate;
@property (strong,nonatomic) NSMutableArray *items;

- (void)addProduct:(Product *)item;

- (void)incQuantity:(NSString *)productCode;
- (void)decQuantity:(NSString *)productCode;




@end

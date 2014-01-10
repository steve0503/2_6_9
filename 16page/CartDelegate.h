//
//  CartDelegate.h
//  16page
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CartDelegate <NSObject>

- (void)addItem:(id)sender;

// 카트내 상품 수량 증가/감소
- (void)incQuantity:(NSString *)productCode;
- (void)decQuantity:(NSString *)productCode;

@end

//
//  Catalog.h
//  16page
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@interface Catalog : NSObject

- (id)productAt:(int)index;
- (int)numberOfProducts;

-(Product *)productWithCode:(NSString *)productCode;

// 싱글턴 방식으로 카탈로그 사용
+ (id)defaultCatalog;

@end

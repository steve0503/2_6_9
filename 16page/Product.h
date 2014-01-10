//
//  Product.h
//  16page
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *price;
@property (strong,nonatomic) NSString *imageName;

@property (strong,nonatomic) NSString *code;


//+(id)Product:(NSString *)name price:(NSString *)price imageName:(NSString *)image;
+(id)Product:(NSString *)name code:(NSString *)code price:(NSString *)price image:(NSString *)imageName;

- (BOOL)isEqualProduct:(NSString *)productCode;


@end

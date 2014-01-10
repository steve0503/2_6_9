//
//  ProductCell.m
//  16page
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ProductCell.h"


@interface ProductCell()

@property (weak, nonatomic)IBOutlet UILabel *productName;

@property (weak, nonatomic)IBOutlet UILabel *productPrice;

@property (weak, nonatomic)IBOutlet UIImageView *productImage;





@end

@implementation ProductCell



// 제품정보를 셀로반영

- (void)setProductInfo:(Product *)item

{
    
    self.productName.text = item.name;
    
    self.productPrice.text = item.price;
    
    self.productImage.image = [UIImage imageNamed:item.imageName];
    

    
}



// 카트에 제품추가

- (IBAction)addCart:(id)sender

{
    //셀 객체로 제품식별
    
    [self.delegate addItem:self];

    
}

@end

//
//  CartCell.m
//  16page
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "CartCell.h"
@interface CartCell()




@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


@property (weak, nonatomic) IBOutlet UILabel *quantityLabel;

@end


@implementation CartCell

- (IBAction)plusClick:(id)sender {
    [self.delegate incQuantity:self.productCode];
}

- (IBAction)minusClick:(id)sender {
    [self.delegate decQuantity:self.productCode];
}

- (void)setCartItem:(CartItem *)item
{
    self.productCode = item.product.code;
    
    self.nameLabel.text = item.product.name;
    self.quantityLabel.text = [NSString stringWithFormat:@"%d 개",item.quantity];
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

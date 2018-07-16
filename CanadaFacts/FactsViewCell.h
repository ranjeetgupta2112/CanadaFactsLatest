//
//  FactsViewCell.h
//  CanadaFacts
//
//  Created by Amal Rajan on 21/05/18.
//  Copyright © 2018 RanjeetHO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FactsViewCell : UITableViewCell{
    UILabel *labelTitle;
    UILabel *labelDescription;
    UIImageView *imageFact;
}
@property(nonatomic, strong)UILabel *labelTitle;
@property(nonatomic, strong)UILabel *labelDescription;
@property(nonatomic, strong)UIImageView *imageFact;

@end

//
//  CollectionViewCell.h
//  GifViewer
//
//  Created by Jeff Ripke on 8/5/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Giphy;

@interface CollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSString *urlString;
@property (strong, nonatomic) Giphy *giphy;

@end

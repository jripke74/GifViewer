//
//  CollectionViewController.m
//  GifViewer
//
//  Created by Jeff Ripke on 8/5/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"GifViewerCell"];
    self.collectionView.backgroundColor = [UIColor blueColor];
}

@end

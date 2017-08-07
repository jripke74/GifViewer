//
//  CollectionViewController.m
//  GifViewer
//
//  Created by Jeff Ripke on 8/5/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"

@interface CollectionViewController ()

@property (strong, nonatomic) NSArray *imageURLs;

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"GifViewerCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshImages];
}

- (void) refreshImages {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"https://api.giphy.com/v1/gifs/trending?api_key=9dc2138ab98c4473914f6f479bd035ee&rating=pg"];
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSData *data = [[NSData alloc] initWithContentsOfURL:location];
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"response dictionary: %@", dictionary);
        // data array > images > downsized_still > url
        self.imageURLs = [dictionary valueForKeyPath:@"data.images.downsized_still.url"];
        NSLog(@"%@", self.imageURLs);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
    }];
    [task resume];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.imageURLs count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    // configure cell
    NSString *urlString = self.imageURLs[indexPath.row];
    cell.urlString = urlString;
    return cell;
}
@end

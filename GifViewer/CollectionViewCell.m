//
//  CollectionViewCell.m
//  GifViewer
//
//  Created by Jeff Ripke on 8/5/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import "CollectionViewCell.h"
#import "Giphy.h"

@implementation CollectionViewCell

- (void) setGiphy:(Giphy *)giphy {
    _giphy = giphy;
    [self downloadImageWithURL:giphy.stillImageURL];
}


- (void)downloadImageWithURL:(NSURL*)url {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
        });
                                                        
    }];
    [task resume];
}

@end

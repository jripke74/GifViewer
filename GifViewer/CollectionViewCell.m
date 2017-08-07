//
//  CollectionViewCell.m
//  GifViewer
//
//  Created by Jeff Ripke on 8/5/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (void) setUrlString:(NSString *)urlString {
    _urlString =  urlString;
    [self downloadImageWithURL:urlString];
}

- (void)downloadImageWithURL:(NSString*)urlString {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60];
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request
                                                    completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                        
                                                        NSData *data = [NSData dataWithContentsOfURL:location];
                                                        UIImage *image = [UIImage imageWithData:data];
                                                        
                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                            self.imageView.image = image;
                                                        });
                                                        
                                                    }];
    [task resume];
}

@end

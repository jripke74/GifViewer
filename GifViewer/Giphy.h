//
//  Giphy.h
//  GifViewer
//
//  Created by Jeff Ripke on 8/7/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Giphy : NSObject

@property (strong, nonatomic) NSURL *stillImageURL;
@property (strong, nonatomic) NSURL *animatedGifURL;

+ (instancetype) giphyWithDictionary:(NSDictionary *) dictionary;

@end

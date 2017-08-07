//
//  Giphy.m
//  GifViewer
//
//  Created by Jeff Ripke on 8/7/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import "Giphy.h"

@implementation Giphy

+ (instancetype) giphyWithDictionary:(NSDictionary *) dicionary {
    Giphy *giphy = [[Giphy alloc] init];
    if (giphy) {
        giphy.animatedGifURL = [NSURL URLWithString:[dicionary valueForKeyPath:@"images.original.url"]];
        giphy.stillImageURL = [NSURL URLWithString:[dicionary valueForKeyPath:@"images.downsized_still.url"]];
    }
    return giphy;
}

@end

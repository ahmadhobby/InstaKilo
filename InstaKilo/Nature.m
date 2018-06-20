//
//  Nature.m
//  InstaKilo
//
//  Created by Ahmad Hobby on 2018-06-20.
//  Copyright © 2018 Ahmad Hobby. All rights reserved.
//

#import "Nature.h"

@implementation Nature

- (instancetype)initWithImage:(UIImage *)image name:(NSString *)name
{
    self = [super init];
    if (self) {
        _image = image;
        _name = name;
    }
    return self;
}

@end

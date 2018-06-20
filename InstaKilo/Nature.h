//
//  Nature.h
//  InstaKilo
//
//  Created by Ahmad Hobby on 2018-06-20.
//  Copyright © 2018 Ahmad Hobby. All rights reserved.
//

@import UIKit;

@interface Nature : NSObject

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *name;

- (instancetype)initWithImage:(UIImage *)image name:(NSString *)name;

@end

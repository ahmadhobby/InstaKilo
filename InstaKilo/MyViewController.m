//
//  MyViewController.m
//  InstaKilo
//
//  Created by Ahmad Hobby on 2018-06-20.
//  Copyright © 2018 Ahmad Hobby. All rights reserved.
//

#import "MyViewController.h"
#import "MyCollectionViewCell.h"
#import "Nature.h"

@interface MyViewController () <UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *photos;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.collectionView.dataSource = self;
    
    NSArray *photos = @[
                        [[Nature alloc] initWithImage:[UIImage imageNamed:@"1.jpeg"] name:@"1"],
                        [[Nature alloc] initWithImage:[UIImage imageNamed:@"2.jpeg"] name:@"2"],
                        [[Nature alloc] initWithImage:[UIImage imageNamed:@"3.jpeg"] name:@"3"],
                        [[Nature alloc] initWithImage:[UIImage imageNamed:@"4.jpeg"] name:@"4"],
                        [[Nature alloc] initWithImage:[UIImage imageNamed:@"5.jpeg"] name:@"5"],
                        [[Nature alloc] initWithImage:[UIImage imageNamed:@"6.jpeg"] name:@"6"],
                        [[Nature alloc] initWithImage:[UIImage imageNamed:@"7.jpeg"] name:@"7"],
                        [[Nature alloc] initWithImage:[UIImage imageNamed:@"8.jpeg"] name:@"8"],
                        [[Nature alloc] initWithImage:[UIImage imageNamed:@"9.jpeg"] name:@"9"],
                        [[Nature alloc] initWithImage:[UIImage imageNamed:@"10.jpeg"] name:@"10"],
                        ];
    self.photos = photos;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    // data at the indexPath.row
    // set the cell outlet to the data
    Nature *nature = self.photos[indexPath.row];
    cell.image.image = nature.image;
    
    return cell;
    
    
}
@end

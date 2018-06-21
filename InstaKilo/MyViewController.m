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
#import "MyHeaderView.h"

@interface MyViewController () <UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *photos;
@property (nonatomic, strong) NSArray *subjects;
@property (nonatomic, strong) NSArray<NSArray*>* photosBySubject;
@property (nonatomic, strong) NSArray *locations;
@property (nonatomic, strong) NSArray<NSArray*>* photosByLocation;
@property (nonatomic, strong) NSArray *sectionTitles;
@property (nonatomic, strong) NSArray<NSArray*>* groupedPhotos;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    
    
    // Creating an array of subjects and locations
    
    // Get the titles (headers of the sections) from this array
    
    NSArray* subjects = @[@"Forest", @"Park", @"Mountain"];
    
    // Getting the subjects correspond to the photos
    
    NSArray *photosBySubject = @[@[photos[0], photos[2], photos[7]],
                                 @[photos[1], photos[3], photos[4], photos[6]],
                                 @[photos[5], photos[8], photos[9]],
                                 ];
    
    NSArray *locations = @[@"Brazil", @"Switzerland", @"Canada"];
    NSArray *photosByLocation = @[@[photos[0], photos[3], photos[6]],
                                  @[photos[9], photos[1], photos[4], photos[7]],
                                  @[photos[2], photos[5], photos[9]],
                                  ];
    
    self.photos = photos;
    self.subjects = subjects;
    self.photosBySubject = photosBySubject;
    self.locations = locations;
    self.photosByLocation = photosByLocation;
    
    self.sectionTitles = self.subjects;
    self.groupedPhotos = self.photosBySubject;
    
    
}

//    Setting up the segmented control:


- (IBAction)changeSections:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        self.sectionTitles = self.subjects;
        self.groupedPhotos = self.photosBySubject;
    } else {
        self.sectionTitles = self.locations;
        self.groupedPhotos = self.photosByLocation;
    }
    
    // Resetting the data source
    
    [self.collectionView reloadData];
}


// make properties
// implement number of sections
// self.photosbysubject[iP.section][indexPath.item]

// We applied this method to get the number of our sections


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.groupedPhotos.count;
}

// We appled this method to get the number of items in each section

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.groupedPhotos[section].count;
}

// We applied this method to create the cell

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    Nature *nature = self.groupedPhotos[indexPath.section][indexPath.item];
    cell.image.image = nature.image;
    
    return cell;
    
    
}

// We applied this method to get the section headers

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        MyHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        NSString *sectionTitle = self.sectionTitles[indexPath.section];
        header.header.text = sectionTitle;
        return header;
    }
    return nil;
}

@end

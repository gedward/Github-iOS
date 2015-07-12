//
//  GithubRepositoryTableViewCell.m
//  GithubClient
//
//  Created by Gerard Gonzalez on 7/11/15.
//  Copyright (c) 2015 Gerard Gonzalez. All rights reserved.
//

#import "GithubRepositoryTableViewCell.h"

@implementation GithubRepositoryTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier]) {
        self.detailTextLabel.textColor = [UIColor grayColor];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

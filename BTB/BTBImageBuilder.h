//
//  BTBImageBuilder.h
//  BTB
//
//  Created by salmon on 14-9-11.
//  Copyright (c) 2014年 SALMON. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BTBImageBuilder : NSObject

@property(nonatomic, strong)UIImage *originalImage;
@property(nonatomic, copy)NSString *titleStr;

-(UIImage*)build;

@end

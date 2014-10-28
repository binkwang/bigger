//
//  BTBImageBuilder.m
//  BTB
//
//  Created by salmon on 14-9-11.
//  Copyright (c) 2014年 SALMON. All rights reserved.
//

#import "BTBImageBuilder.h"

@implementation BTBImageBuilder

-(id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark ----public----

-(UIImage*)build
{
    return [self combineImage:_originalImage andTitle:_titleStr];
}

#pragma mark ----private----

-(UIImage *)combineImage:(UIImage*)leftImage andTitle:(NSString*)titleStr
{
    
    CGFloat width = leftImage.size.width + 100;
    CGFloat height = leftImage.size.height + 100;
    
    CGSize offScreenSize = CGSizeMake(width, height);
    
    UIGraphicsBeginImageContext(offScreenSize);
    
    CGRect rect = CGRectMake(0, 0, leftImage.size.width, leftImage.size.height);
    [leftImage drawInRect:rect];
    
    
    rect.origin.y += (leftImage.size.height+20);
    rect.size.width = width;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    CGContextSetRGBFillColor(context, 0.5, 0.5, 0.5, 0.5);
    
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment: NSTextAlignmentLeft];
    NSDictionary *attribs = [NSDictionary dictionaryWithObjectsAndKeys:
                             [UIFont systemFontOfSize:50.f],NSFontAttributeName,
                             paragraphStyle,NSParagraphStyleAttributeName,
                             ImageTitleColor,NSForegroundColorAttributeName,
                             ImageBgColor,NSBackgroundColorAttributeName,
                             nil];
    [titleStr drawInRect:rect withAttributes:attribs];
    
    
    UIImage* imagez = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return imagez;
}


@end

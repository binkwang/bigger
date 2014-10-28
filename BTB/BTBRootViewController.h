//
//  BTBRootViewController.h
//  BTB
//
//  Created by salmon on 14-9-11.
//  Copyright (c) 2014年 SALMON. All rights reserved.
//


/**********************************************************
 屏幕尺寸
 **********************************************************/

#define SCREEN_4_INCH \
(fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)568)<DBL_EPSILON)

#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height

#define STATUS_BAR_HEIGHT   20
#define NAVIGATION_BAR_HEIGHT   44
#define STATUS_AND_NAVIGATION_BAR_HEIGHT 64
#define TAB_BAR_HEIGHT 49
#define TOOL_BAR_HEIGHT 44

#define KEY_BOARD_HEIGHT 216
#define KEY_BOARD_HEIGHT_2 36

/**********************************************************
 自定义尺寸
 **********************************************************/
#define PaddingLeft     5
#define PaddingRight    5
#define WightWidth      SCREEN_WIDTH-PaddingLeft-PaddingRight

#define CornerRadius    3.f


#import <UIKit/UIKit.h>

@interface BTBRootViewController : UIViewController
<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate>


@property(nonatomic, strong)UIImageView *bgImageView;
@property(nonatomic, strong)UIImageView *contentImageView;
@property(nonatomic, strong)UITextField *titleTextField;

@property(nonatomic, strong)UIButton *selectImageButton;
@property(nonatomic, strong)UIButton *switchTitleButton;
@property(nonatomic, strong)UIButton *saveButton;


@end

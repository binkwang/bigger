//
//  BTBRootViewController.m
//  BTB
//
//  Created by salmon on 14-9-11.
//  Copyright (c) 2014年 SALMON. All rights reserved.
//


#import "BTBRootViewController.h"
#import "BTBImageBuilder.h"

#define Title01     @"来自iPhone6 Plus 128G客户端"
#define Title02     @"来自iPhone6 Plus 老乔开光版"
#define Title03     @"来自iPhone6 Plus 圣光荣耀版"
#define Title04     @"来自iPhone6 Plus 钛合金防弹版"
#define Title05     @"来自小灵通9888"
#define Title06     @"来自诺基亚1110"


@interface BTBRootViewController ()
{
    UIImagePickerController *_imagePickerController;
    UIImage *_selectedImage;
    BTBImageBuilder *_imageBuilder;
    NSMutableArray *_titleArr;
}

@end

@implementation BTBRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _titleArr = [NSMutableArray array];
    [_titleArr addObject:Title01];
    [_titleArr addObject:Title02];
    [_titleArr addObject:Title03];
    [_titleArr addObject:Title04];
    [_titleArr addObject:Title05];
    [_titleArr addObject:Title06];
    
    [self.view addSubview:self.bgImageView];
    [self.view addSubview:self.selectImageButton];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
    [super viewWillDisappear:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark ----getter----
-(UIImageView*)bgImageView
{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, self.view.bounds.size.width, self.view.bounds.size.height)];
        _bgImageView.backgroundColor = [UIColor whiteColor];
//        _bgImageView.image = [UIImage imageNamed:@""];
    }
    return _bgImageView;
}


-(UIButton*)selectImageButton
{
    if (!_selectImageButton) {
        _selectImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectImageButton.frame = CGRectMake(PaddingLeft, 180, WightWidth, 40);

        _selectImageButton.layer.masksToBounds = YES;
        _selectImageButton.layer.cornerRadius = CornerRadius;
        _selectImageButton.titleLabel.font = [UIFont systemFontOfSize:14.f];
        
        _selectImageButton.layer.borderWidth = 1.f;
        _selectImageButton.layer.borderColor = ButtonBorderColor.CGColor;
        
        [_selectImageButton setBackgroundImage:[UIImage imageNamed:@"btnBg"] forState:UIControlStateNormal];
        [_selectImageButton setBackgroundImage:[UIImage imageNamed:@"btnBgHL"] forState:UIControlStateHighlighted];
        
        [_selectImageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_selectImageButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        
        [_selectImageButton setTitle:@"选取一张图片" forState:UIControlStateNormal];
        [_selectImageButton addTarget:self action:@selector(selectImageButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectImageButton;
}


-(UIImageView*)contentImageView
{
    if (!_contentImageView) {
        _contentImageView = [[UIImageView alloc] init];
        _contentImageView.layer.masksToBounds = YES;
        _contentImageView.layer.cornerRadius = CornerRadius;
    }
    return _contentImageView;
}

-(UITextField*)titleTextField
{
    if (!_titleTextField) {
        _titleTextField = [[UITextField alloc] init];
        _titleTextField.layer.masksToBounds = YES;
        _titleTextField.layer.cornerRadius = CornerRadius;
        
//        _titleTextField.layer.borderWidth = 1.f;
//        _titleTextField.layer.borderColor = ButtonBorderColor.CGColor;
        _titleTextField.layer.backgroundColor = [UIColor colorWithWhite:0.9f alpha:1.f].CGColor;
        
        _titleTextField.placeholder = @"请编辑装逼机型";
        _titleTextField.text = [_titleArr objectAtIndex:0];
        _titleTextField.textColor = [UIColor colorWithWhite:0.5f alpha:1.f];
        _titleTextField.font = [UIFont fontWithName:@"Arial" size:14.f];//文字大小
        
        _titleTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直居中
        _titleTextField.borderStyle = UITextBorderStyleNone;
        _titleTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _titleTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;//关闭首字母自动大写
        _titleTextField.autocorrectionType = UITextAutocorrectionTypeNo;//关闭自动纠正
        _titleTextField.returnKeyType = UIReturnKeyDone;
        _titleTextField.delegate = self;
    }
    return _titleTextField;
}


-(UIButton*)switchTitleButton
{
    if (!_switchTitleButton) {
        _switchTitleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _switchTitleButton.layer.masksToBounds = YES;
        _switchTitleButton.layer.cornerRadius = CornerRadius;
        _switchTitleButton.titleLabel.font = [UIFont systemFontOfSize:14.f];
        
        _switchTitleButton.layer.borderWidth = 1.f;
        _switchTitleButton.layer.borderColor = ButtonBorderColor.CGColor;
        
        [_switchTitleButton setBackgroundImage:[UIImage imageNamed:@"btnBg"] forState:UIControlStateNormal];
        [_switchTitleButton setBackgroundImage:[UIImage imageNamed:@"btnBgHL"] forState:UIControlStateHighlighted];
        
        
        [_switchTitleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_switchTitleButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        
        
        [_switchTitleButton setTitle:@"换一个" forState:UIControlStateNormal];
        [_switchTitleButton addTarget:self action:@selector(switchTitleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _switchTitleButton;
}

-(UIButton*)saveButton
{
    if (!_saveButton) {
        _saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _saveButton.layer.masksToBounds = YES;
        _saveButton.layer.cornerRadius = CornerRadius;
        _saveButton.titleLabel.font = [UIFont systemFontOfSize:14.f];
        
        _saveButton.layer.borderWidth = 1.f;
        _saveButton.layer.borderColor = ButtonBorderColor.CGColor;
        
        [_saveButton setBackgroundImage:[UIImage imageNamed:@"btnBg"] forState:UIControlStateNormal];
        [_saveButton setBackgroundImage:[UIImage imageNamed:@"btnBgHL"] forState:UIControlStateHighlighted];
        
        [_saveButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_saveButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        
        [_saveButton setTitle:@"生成并保存" forState:UIControlStateNormal];
        [_saveButton addTarget:self action:@selector(saveButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _saveButton;
}


#pragma mark ----按钮点击----
-(void)selectImageButtonClicked:(UIButton*)sender
{
    if (!_imagePickerController) {
        _imagePickerController = [[UIImagePickerController alloc] init];
        _imagePickerController.delegate = self;
    }
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;//照片库
        _imagePickerController.mediaTypes = [NSArray arrayWithObjects:@"public.image", nil];
        _imagePickerController.allowsEditing = YES;
        
    }else{
        NSLog(@"不支持图片库");
        return;
    }
    
    [self presentViewController:_imagePickerController animated:YES completion:nil];
}

-(void)saveButtonClicked:(UIButton*)sender
{
    if (!_titleTextField || [_titleTextField isEqual:@""]) {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"请填写装逼终端名称" message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [av show];
        return;
    }
    
    //生成图像并保存
    if (!_imageBuilder) {
        _imageBuilder = [[BTBImageBuilder alloc] init];
    }
    _imageBuilder.originalImage = _selectedImage;
    _imageBuilder.titleStr = _titleTextField.text;
    
    
    [SVProgressHUD showWithStatus:@"请稍等.."];
    
    UIImage *newImage = [_imageBuilder build];
    if (newImage) {
        NSData *imageData = UIImagePNGRepresentation(newImage);
        ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
        [library writeImageDataToSavedPhotosAlbum:imageData metadata:nil completionBlock:^(NSURL *assetURL, NSError *error) {
            if (error) {
                NSLog(@"Save image fail:%@",error);
                [SVProgressHUD dismissWithError:@"保存失败"];
            } else {
                NSLog(@"Save image succeed.");
                [SVProgressHUD dismissWithSuccess:@"已保存到相册"];
            }
        }];
    }else{
        [SVProgressHUD dismissWithError:@"生成失败"];
    }
}


-(void)switchTitleButtonClicked:(UIButton*)sender
{
    __block NSInteger currentIndex = -1;
    [_titleArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([_titleTextField.text isEqualToString:(NSString*)obj]) { currentIndex = idx; }
    }];
    
    
    if (-1==currentIndex) {
        if (0==_titleArr.count) { _titleTextField.text = @""; }
        else{ _titleTextField.text = [_titleArr objectAtIndex:0]; }
    }
    else{
        if (currentIndex == _titleArr.count-1) {
            _titleTextField.text = [_titleArr objectAtIndex:0];
        }else{
            _titleTextField.text = [_titleArr objectAtIndex:currentIndex+1];
        }
    }
}


#pragma mark - ----UIImagePickerControllerDelegate----

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    NSLog(@"didFinishPickingMediaWithInfo");
    
    
    //_selectedImage = [info valueForKey:UIImagePickerControllerOriginalImage];//使用原图
    _selectedImage = [info valueForKey:UIImagePickerControllerEditedImage]; //使用编辑过的图片
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"dismissViewControllerAnimated completion..");
        
        
        [UIView animateWithDuration:1.f animations:^{
            _selectImageButton.enabled = NO;
            _selectImageButton.frame = CGRectMake(PaddingLeft, 20, WightWidth, 40);
            
        } completion:^(BOOL finished) {
            
            _selectImageButton.enabled = YES;
            [_selectImageButton setTitle:@"重选图片" forState:UIControlStateNormal];
            
            [self.view addSubview:self.contentImageView];
            _contentImageView.frame = CGRectMake(PaddingLeft, CGRectGetMaxY(_selectImageButton.frame)+5, WightWidth, WightWidth);
            _contentImageView.image = _selectedImage;
            
            [self.view addSubview:self.titleTextField];
            _titleTextField.frame = CGRectMake(PaddingLeft, CGRectGetMaxY(_contentImageView.frame)+5, WightWidth-85, 40);
            
            [self.view addSubview:self.switchTitleButton];
            _switchTitleButton.frame = CGRectMake(CGRectGetMaxX(_titleTextField.frame)+PaddingLeft, CGRectGetMaxY(_contentImageView.frame)+5, 80, 40);
            
            [self.view addSubview:self.saveButton];
            _saveButton.frame = CGRectMake(PaddingLeft, CGRectGetMaxY(_titleTextField.frame)+5, WightWidth, 40);
            
            
            _contentImageView.alpha = 0.f;
            _titleTextField.alpha = 0.f;
            _switchTitleButton.alpha = 0.f;
            _saveButton.alpha = 0.f;
            
            [UIView animateWithDuration:0.3f animations:^{
                
                _contentImageView.alpha = 1.f;
                _titleTextField.alpha = 1.f;
                _switchTitleButton.alpha = 1.f;
                _saveButton.alpha = 1.f;
                
            } completion:^(BOOL finished) {
                
            }];
            
        }];
        
    }];
    
    _imagePickerController = nil;
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"imagePickerControllerDidCancel");
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -   ----UITextFieldDelegate----

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField
{
    [self.view endEditing:YES];
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"------ %lu", (unsigned long)range.location);
    
    if (range.location>20){
        [SVProgressHUD showErrorWithStatus:@"字数已受限"];
        return  NO;
    }else{
        return YES;
    }
    
}



#pragma mark - ----UIWindow Keyboard Notifications----

-(void)keyboardWillChangeFrame:(NSNotification*)notification
{
    NSLog(@"keyboardWillChangeFrame");
    
    NSValue *keyboardBeginBounds=[[notification userInfo]objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect beginRect=[keyboardBeginBounds CGRectValue];
    
    NSValue *keyboardEndBounds=[[notification userInfo]objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect endRect=[keyboardEndBounds CGRectValue];
    
    CGFloat deltaY=endRect.origin.y-beginRect.origin.y;
    
    //计算控件底部到view底部的距离
    float h1 = (self.view.frame.size.height - _titleTextField.frame.origin.y - _titleTextField.frame.size.height);
    
    if (h1>(KEY_BOARD_HEIGHT)) { return; }
    
    [UIView animateWithDuration:[[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue]
                     animations:^{
                         if (deltaY == -KEY_BOARD_HEIGHT) {
                             [self.view setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+deltaY+h1, self.view.frame.size.width, self.view.frame.size.height)];
                         }else if(deltaY == -KEY_BOARD_HEIGHT_2 || deltaY == KEY_BOARD_HEIGHT_2){
                             [self.view setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+deltaY, self.view.frame.size.width, self.view.frame.size.height)];
                         }else if (deltaY == KEY_BOARD_HEIGHT){
                             [self.view setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+deltaY-h1, self.view.frame.size.width, self.view.frame.size.height)];
                         }else if (deltaY == KEY_BOARD_HEIGHT+KEY_BOARD_HEIGHT_2){
                             [self.view setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+deltaY-h1, self.view.frame.size.width, self.view.frame.size.height)];
                         }
                         
                     } completion:^(BOOL finished) {
                         
                     }];
    
}


@end

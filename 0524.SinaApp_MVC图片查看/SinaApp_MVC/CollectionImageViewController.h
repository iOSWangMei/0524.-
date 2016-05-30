//
//  CollectionImageViewController.h
//  SinaApp_MVC
//
//  Created by SuperWang on 16/5/24.
//  Copyright © 2016年 SuperWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionImageViewController : UIViewController
{
    //临时动画,对象
    UIImageView *_animationImgView;
    UICollectionView *_collectionView;
}
//数据源
@property(nonatomic,strong)NSArray *picUrls;
//坐标组
@property(nonatomic,strong)NSArray *picFrames;
@property(nonatomic,assign)NSInteger tag;
@end











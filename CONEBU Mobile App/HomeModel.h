//
//  HomeModel.h
//  CONEBU Mobile App
//
//  Created by Alberto Ramos on 29/11/14.
//  Copyright (c) 2014 Oscar Razo. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol HomeModelProtocol <NSObject>
-(void)itemsDownloaded:(NSArray *)items;
@end
@interface HomeModel : NSObject <NSURLConnectionDataDelegate>
@property (nonatomic, weak) id<HomeModelProtocol> delegate;
- (void)downloadItems;
@end

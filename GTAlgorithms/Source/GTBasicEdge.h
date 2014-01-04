//
//  GTPath.h
//  GTAlgorithms
//
//  Created by Robby Cohen on 12/24/13.
//  Copyright (c) 2013 Robby Cohen. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GTBasicNode;
@protocol GTNode;

@protocol GTEdge <NSObject>

-(GTDistance)getLength;
-(id<GTNode>)getFirstVertice;
-(id<GTNode>)getSecondVertice;

@end

@interface GTBasicEdge : NSObject <GTEdge>

-(GTDistance)getLength;
-(id<GTNode>)getFirstVertice;
-(id<GTNode>)getSecondVertice;

+(id)createEdgeWithLength:(GTDistance)_length firstVertice:(id<GTNode>)_firstVertice secondVertice:(id<GTNode>)_secondVertice;

+(id)createUnweightedEdgeWithFirstVertice:(id<GTNode>)_firstVertice secondVertice:(id<GTNode>)_secondVertice;

@end

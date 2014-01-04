//
//  GTAStarSearch.h
//  GTAlgorithms
//
//  Created by Robby Cohen on 12/24/13.
//  Copyright (c) 2013 Robby Cohen. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GTGraph;
@class GTPath;
@protocol GTNode;
@interface GTAStarSearch : NSObject {
    NSUInteger _numberOfNodes;
}

@property (nonatomic, assign) NSUInteger numberOfNodes;

+(void)performAStarSearchOnGraph:(GTGraph*)graph withStartNode:(id<GTNode>)startNode withEndNode:(id<GTNode>)endNode completion:(void (^)(GTPath* shortestPath))completionBlock;

@end

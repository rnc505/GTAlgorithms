//
//  GTAStarGraph.h
//  GTAlgorithms
//
//  Created by Robby Cohen on 12/24/13.
//  Copyright (c) 2013 Robby Cohen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTGraph.h"
@class GTAStarNode;
@interface GTAStarGraph : GTGraph

+(id)createAStarGraphWithBaseGraph:(GTGraph*)graph withStartNode:(id<GTNode>)startNode withEndNode:(id<GTNode>)endNode;

@property (nonatomic, retain) GTAStarNode* startNode;
@property (nonatomic, retain) GTAStarNode* endNode;
@property (nonatomic, retain) GTGraph* graph;
@property (nonatomic, retain) NSMutableSet* upgradedNodes;
@end

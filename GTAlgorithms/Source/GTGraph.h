//
//  GTGraph.h
//  GTAlgorithms
//
//  Created by Robby Cohen on 12/24/13.
//  Copyright (c) 2013 Robby Cohen. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol GTNode, GTEdge;
@interface GTGraph : NSObject {
    NSMutableDictionary* _adjacencyList;
    NSMutableDictionary* _edgeWeights;
}

-(void)addNode:(id<GTNode>)_node;
-(void)addNodes:(NSSet*)_setOfNodes;

-(void)addUndirectedEdgeWithFirstNode:(id<GTNode>)_firstNode secondNode:(id<GTNode>)_secondNode;
-(void)addDirectedEdgeWithBeginningNode:(id<GTNode>)_beginning endNode:(id<GTNode>)_end;

-(void)addUndirectedEdgeWithFirstNode:(id<GTNode>)_firstNode secondNode:(id<GTNode>)_secondNode length:(GTDistance)_length;
-(void)addDirectedEdgeWithBeginningNode:(id<GTNode>)_beginning endNode:(id<GTNode>)_end length:(GTDistance)_length;

-(void)addUndirectedEdge:(id<GTEdge>)_edge;
-(void)addDirectedEdge:(id<GTEdge>)_edge;
-(void)addUndirectedEdges:(NSSet*)_setOfEdges;
-(void)addDirectedEdges:(NSSet*)_setOfEdges;

-(GTDistance)getEdgeLengthFromFirstNode:(id<GTNode>)_firstNode toSecondNode:(id<GTNode>)_secondNode;

+(GTGraph*)createEmptyGraph;

@property (nonatomic, retain) NSMutableDictionary* adjacencyList;
@property (nonatomic, retain) NSMutableDictionary* edgeWeights;
@end
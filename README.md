GTAlgorithms
============

GTAlgorithms is an open-source Graph Travel Algorithm (hence GTAlgorithms) library for iOS. It was mainly implemented to be **plug-and-play and extensible**.

Installation
-----------
1. Drag and drop the **GTAlgorithms.xcodeproj** into your project.
2. Make sure in `Project > Build Phases > Link Binary With Libraries`that is a listing for `libGTAlgorithms.a`.
3. In `Project > Build Settings > Linking > Other Linker Flags` add the two flags: `-Objc` and `-all_load`.
4. Make sure in your **______________-Prefix.pch** file, add the following: 
```
#ifdef __OBJC__
    #import <GTAlgorithms/GTAlgorithms.h>
#endif
```
5. You are good to go!

Implemented Algorithms
----------------------
 - A*  ([Information on A*][1]) 

Plug-and-Play
-------------
One of the major design features of **GTAlgorithms** is to provide developers with a library that is extremely simple to implement in their code.

#### Creating a Graph ####
To get started, first you have to create a graph:

    GTGraph* graph = [GTGraph createEmptyGraph];

#### Creating Nodes ####

Next, you have to add nodes to your graph. If you don't have your own Node class, there is a basic node class that you can use. Creating a basic node is fairly simple -- all you need to supply is either a GTCoordinate2D or an X and Y coordinate value:

    +(GTBasicNode*)createBasicNodeWithLocation:(GTCoordinate2D)location;
    
    +(GTBasicNode*)createBasicNodeWithXCoordinate:(GTDistance)x withYCoordinate:(GTDistance)y;
    
Or if you have your own Node class, you can just have it adhere to the **GTNode** protocol and implement the following three required methods:

    /* getIdentifier must return a completely UNIQUE identifier. See GTBasicNode's       implementation for an example */
    -(NSString*)getIdentifier;
    
    /* getLocation must return some representation of a 2D coordinate value */
    -(GTCoordinate2D)getLocation;
    
    /* calculateDistanceFromNode must return some sort of "fly-over" distance between two nodes that don't necessarily need to have an edge between them. A good choice is the Manhattan distance between nodes. */
    -(GTDistance)calculateDistanceFromNode:(id<GTNode>)node;

#### Creating Edges ####

Next, you have to have edges between nodes. There is a **GTEdge** protocol that you can adhere to if you have your own Edge class, but more likely than not, GTBasicEdge will suffice for your application. Additionally, explicitly creating edges isn't entirely necessary, which we shall see later, but creating them explicitly lets you add all of them at once instead of one at a time. To create an edge, you can use these these methods:

    +(id)createEdgeWithLength:(GTDistance)_length firstVertice:(id<GTNode>)_firstVertice secondVertice:(id<GTNode>)_secondVertice;
    
    +(id)createUnweightedEdgeWithFirstVertice:(id<GTNode>)_firstVertice secondVertice:(id<GTNode>)_secondVertice;

#### Populating your Graph ####

Finally, you have to add your nodes and edges. There are a number of convenience methods to add nodes and edges to your graph. **NOTE: In order to add an edge, both nodes that make up the edge MUST have already been added to the graph!** Methods to add nodes and edges to graph are:

    /* Adding an individual or set of nodes */
    -(void)addNode:(id<GTNode>)_node;
    -(void)addNodes:(NSSet*)_setOfNodes;

    /* Adding an unweighted undirected or directed edge */
    -(void)addUndirectedEdgeWithFirstNode:(id<GTNode>)_firstNode secondNode:(id<GTNode>)_secondNode;
    -(void)addDirectedEdgeWithBeginningNode:(id<GTNode>)_beginning endNode:(id<GTNode>)_end;

    /* Adding a weighted undirected or directed edge */
    -(void)addUndirectedEdgeWithFirstNode:(id<GTNode>)_firstNode secondNode:(id<GTNode>)_secondNode length:(GTDistance)_length;
    -(void)addDirectedEdgeWithBeginningNode:(id<GTNode>)_beginning endNode:(id<GTNode>)_end length:(GTDistance)_length;

    /* Adding an individual or set of edge objects */
    -(void)addUndirectedEdge:(id<GTEdge>)_edge;
    -(void)addDirectedEdge:(id<GTEdge>)_edge;
    -(void)addUndirectedEdges:(NSSet*)_setOfEdges;
    -(void)addDirectedEdges:(NSSet*)_setOfEdges;

## Running A* Search ##

In order to run A* Star search, all you have to do is pass your graph, a start node and end node to a method and it will return a **GTPath** object which contains a length and path property containing the shortest path, or a length of 0 and a empty path if the shortest path doesn't exist. There are two convenience methods to perform A* Search:

    /* Returns the GTPath object within a block for concise processing. */
    +(void)performAStarSearchOnGraph:(GTGraph*)graph withStartNode:(id<GTNode>)startNode withEndNode:(id<GTNode>)endNode completion:(void (^)(GTPath* shortestPath))completionBlock;

    /* Returns the GTPath object to the current scope for more expansive processing. */
    +(GTPath*)performAStarSearchOnGraph:(GTGraph*)graph withStartNode:(id<GTNode>)startNode withEndNode:(id<GTNode>)endNode;

## That's It! ##
  [1]: http://en.wikipedia.org/wiki/A*
Class {
	#name : #CTOrderedSetTest,
	#superclass : #TestCase,
	#category : #'Containers-OrderedSet-Tests'
}

{ #category : #'collection tests' }
CTOrderedSetTest >> testAddAllDistinctToEmpty [
	| set |
	set := CTOrderedSet new.
	set addAll: #(lorem ipsum dolor sit amet).
	self assert: set asArray equals: #(lorem ipsum dolor sit amet).
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testAddAllDistinctToNonEmpty [
	| set |
	set := CTOrderedSet with: 42.
	set addAll: #(lorem ipsum dolor sit amet).
	self assert: set asArray equals: #(42 lorem ipsum dolor sit amet).
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testAddDistinctToNonEmpty [
	| set |
	set := CTOrderedSet with: 10.
	set add: 42.
	self assert: set asArray equals: #(10 42).
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testAddToEmpty [
	| set |
	set := CTOrderedSet new.
	set add: 42.
	self assert: set asArray equals: #(42).
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testEmptyCollectionIncludes [
	| set |
	set := CTOrderedSet new.
	self deny: (set includes: 42).
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testEmptyCollectionIsEmpty [
	| set |
	set := CTOrderedSet new.
	self assert: set isEmpty.
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testEmptyCollectionIsNotEmpty [
	| set |
	set := CTOrderedSet new.
	self deny: set isNotEmpty.
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testEmptyCollectionSizeIsZero [
	| set |
	set := CTOrderedSet new.
	self assert: set size equals: 0.
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testIncludesFalse [
	| set |
	set := CTOrderedSet with: 42.
	self deny: (set includes: 10).
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testIncludesTrue [
	| set |
	set := CTOrderedSet with: 42.
	self assert: (set includes: 42).
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testInstanceCreationWith [
	| set |
	set := CTOrderedSet with: #lorem.
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem).
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testInstanceCreationWithAllDistinct [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem ipsum dolor sit amet).
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testInstanceCreationWithWithDistinct [
	| set |
	set := CTOrderedSet with: #lorem with: #ipsum.
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem ipsum).
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testInstanceCreationWithWithWithDistinct [
	| set |
	set := CTOrderedSet with: #lorem with: #ipsum with: #dolor.
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem ipsum dolor).
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testInstanceCreationWithWithWithWithDistinct [
	| set |
	set := CTOrderedSet with: #lorem with: #ipsum with: #dolor with: #sit.
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem ipsum dolor sit).
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testInstanceCreationWithWithWithWithWithDistinct [
	| set |
	set := CTOrderedSet with: #lorem with: #ipsum with: #dolor with: #sit with: #amet.
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem ipsum dolor sit amet).
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testIsEmpty [
	| set |
	set := CTOrderedSet with: 42.
	self deny: set isEmpty.
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testIsNotEmpty [
	| set |
	set := CTOrderedSet with: 42.
	self assert: set isNotEmpty.
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testRemoveAbsentError [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	self should: [ set remove: #hello ] raise: NotFound.
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testRemoveAllAbsentError [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	self should: [ set removeAll: #(hello world) ] raise: NotFound.
	self assert: set asArray equals: #(lorem ipsum dolor sit amet).
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testRemoveAllExisting [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	self assert: (set removeAll: #(ipsum sit)) equals: #(ipsum sit).
	self assert: set asArray equals: #(lorem dolor amet).
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testRemoveAllFromEmpty [
	| set |
	set := CTOrderedSet new.
	self should: [ set removeAll: #(lorem ipsum) ] raise: NotFound.
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testRemoveAllOneAbsentError [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	self should: [ set removeAll: #(ipsum hello sit) ] raise: NotFound.
	self assert: set asArray equals: #(lorem dolor sit amet).
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testRemoveExisting [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	self assert: (set remove: #ipsum) equals: #ipsum.
	self assert: set asArray equals: #(lorem dolor sit amet).
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testRemoveFromEmptyError [
	| set |
	set := CTOrderedSet new.
	self should: [ set remove: #hello ] raise: NotFound.
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testRemoveIfAbsentAbsent [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	self assert: (set remove: #hello ifAbsent: [ 'oops' ]) equals: #oops.
	self assert: set asArray equals: #(lorem ipsum dolor sit amet).
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testRemoveIfAbsentExisting [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	self assert: (set remove: #ipsum ifAbsent: [ 'oops' ]) equals: #ipsum.
	self assert: set asArray equals: #(lorem dolor sit amet).
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testRemoveIfAbsentFromEmpty [
	| set |
	set := CTOrderedSet new.
	self assert: (set remove: #hello ifAbsent: [ 'oops' ]) equals: #oops.
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testSizeIsOne [
	| set |
	set := CTOrderedSet with: 42.
	self assert: set size equals: 1.
]

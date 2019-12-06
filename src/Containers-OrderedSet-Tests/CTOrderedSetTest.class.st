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

{ #category : #'set tests' }
CTOrderedSetTest >> testAddAllDuplicateToEmpty [
	| set |
	set := CTOrderedSet new.
	set addAll: #(lorem ipsum dolor ipsum ipsum amet).
	self assert: set asArray equals: #(lorem ipsum dolor amet).
]

{ #category : #'set tests' }
CTOrderedSetTest >> testAddAllDuplicateToNonEmpty [
	| set |
	set := CTOrderedSet with: 42.
	set addAll: #(lorem 42 ipsum dolor ipsum ipsum amet).
	self assert: set asArray equals: #(42 lorem ipsum dolor amet).
]

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testAddAllFirst [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	set addAllFirst: #(hello world).
	expected := CTOrderedSet withAll: #(hello world lorem ipsum dolor sit amet).
	
	self assert: set equals: expected.
]

{ #category : #'set tests' }
CTOrderedSetTest >> testAddAllFirstDuplicate [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	set addAllFirst: #(hello ipsum).
	expected := CTOrderedSet withAll: #(hello lorem ipsum dolor sit amet).
	
	self assert: set equals: expected.
]

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testAddAllLast [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	set addAllLast: #(hello world).
	expected := CTOrderedSet withAll: #(lorem ipsum dolor sit amet hello world).
	
	self assert: set equals: expected.
]

{ #category : #'set tests' }
CTOrderedSetTest >> testAddAllLastDuplicate [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	set addAllLast: #(hello ipsum).
	expected := CTOrderedSet withAll: #(lorem ipsum dolor sit amet hello).
	
	self assert: set equals: expected.
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testAddDistinctToNonEmpty [
	| set |
	set := CTOrderedSet with: 10.
	set add: 42.
	self assert: set asArray equals: #(10 42).
]

{ #category : #'set tests' }
CTOrderedSetTest >> testAddDuplicate [
	| set |
	set := CTOrderedSet with: 42.
	
	self assert: (set add: 42) equals: 42.
	self assert: set asArray equals: #(42).
]

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testAddFirst [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	set addFirst: #hello.
	expected := CTOrderedSet withAll: #(hello lorem ipsum dolor sit amet).
	
	self assert: set equals: expected.
]

{ #category : #'set tests' }
CTOrderedSetTest >> testAddFirstDuplicate [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	set addFirst: #ipsum.
	expected := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	self assert: set equals: expected.
]

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testAddLast [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	set addLast: #hello.
	expected := CTOrderedSet withAll: #(lorem ipsum dolor sit amet hello).
	
	self assert: set equals: expected.
]

{ #category : #'set tests' }
CTOrderedSetTest >> testAddLastDuplicate [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	set addLast: #ipsum.
	expected := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	self assert: set equals: expected.
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testAddToEmpty [
	| set |
	set := CTOrderedSet new.
	set add: 42.
	self assert: set asArray equals: #(42).
]

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testAt [
	| set expected actual |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	actual := set at: 3.
	expected := #dolor.
	
	self assert: actual equals: expected.
]

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testAtPut [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	self assert: (set at: 3 put: #hello) equals: #hello.
	
	expected := CTOrderedSet withAll: #(lorem ipsum hello sit amet).
	self assert: set equals: expected.
]

{ #category : #'set tests' }
CTOrderedSetTest >> testAtPutDuplicate [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	self should: [ set at: 3 put: #ipsum ] raise: CTDuplicateException.
]

{ #category : #'set tests' }
CTOrderedSetTest >> testAtPutDuplicateSamePosition [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	set at: 3 put: #dolor.
	
	expected := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	self assert: set equals: expected
]

{ #category : #'set tests' }
CTOrderedSetTest >> testDifference [
	| setA setB expected actual |
	
	setA := CTOrderedSet withAll: #(a c d b f).
	setB := CTOrderedSet withAll: #(b c e a).
	
	expected := CTOrderedSet withAll: #(d f).
	actual := setA difference: setB.
	
	self assert: actual equals: expected.
]

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testEighth [
	| set expected actual |
	set := CTOrderedSet withAll: #(one two three four five six seven eight nine ten eleven).
	
	actual := set eighth.
	expected := #eight.
	
	self assert: actual equals: expected.
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
CTOrderedSetTest >> testEnumerateCollectDistinct [
	| set actual expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	actual := set collect: [ :each | each first ].
	expected := CTOrderedSet withAll: #($l $i $d $s $a).
	
	self assert: actual equals: expected.
]

{ #category : #'set tests' }
CTOrderedSetTest >> testEnumerateCollectDuplicate [
	| set actual expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	actual := set collect: [ :each | each size ].
	expected := CTOrderedSet withAll: #(5 3 4).
	
	self assert: actual equals: expected.
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testEnumerateDetect [
	| set actual expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	actual := set detect: [ :each | each size < 5 ].
	expected := #sit.
	
	self assert: actual equals: expected.
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testEnumerateDo [
	| set actual expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	actual := OrderedCollection new.
	set do: [ :each | actual add: each size ].
	
	expected := OrderedCollection withAll: #(5 5 5 3 4).
	self assert: actual equals: expected.
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testEnumerateInjectInto [
	| set actual expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	actual := set inject: 0 into: [ :sum :each | sum + each size ].
	expected := 22.
	
	self assert: actual equals: expected.
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testEnumerateReject [
	| set actual expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	actual := set reject: [ :each | each size = 5 ].
	expected := CTOrderedSet withAll: #(sit amet).
	
	self assert: actual equals: expected.
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testEnumerateSelect [
	| set actual expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	actual := set select: [ :each | each size = 5 ].
	expected := CTOrderedSet withAll: #(lorem ipsum dolor).
	
	self assert: actual equals: expected.
]

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testFifth [
	| set expected actual |
	set := CTOrderedSet withAll: #(one two three four five six seven eight nine ten eleven).
	
	actual := set fifth.
	expected := #five.
	
	self assert: actual equals: expected.
]

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testFirst [
	| set expected actual |
	set := CTOrderedSet withAll: #(one two three four five six seven eight nine ten eleven).
	
	actual := set first.
	expected := #one.
	
	self assert: actual equals: expected.
]

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testFourth [
	| set expected actual |
	set := CTOrderedSet withAll: #(one two three four five six seven eight nine ten eleven).
	
	actual := set fourth.
	expected := #four.
	
	self assert: actual equals: expected.
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testIncludesAllFalse [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	self deny: (set includesAll: #(lorem hello)).
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testIncludesAllTrue [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	self assert: (set includesAll: #(lorem sit)).
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

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testIndexOf [
	| set expected actual |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	actual := set indexOf: #dolor.
	expected := 3.
	
	self assert: actual equals: expected.
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

{ #category : #'set tests' }
CTOrderedSetTest >> testInstanceCreationWithAllDuplicate [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor ipsum ipsum amet).
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem ipsum dolor amet).
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testInstanceCreationWithWithDistinct [
	| set |
	set := CTOrderedSet with: #lorem with: #ipsum.
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem ipsum).
]

{ #category : #'set tests' }
CTOrderedSetTest >> testInstanceCreationWithWithDuplicate [
	| set |
	set := CTOrderedSet with: #lorem with: #lorem.
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem).
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testInstanceCreationWithWithWithDistinct [
	| set |
	set := CTOrderedSet with: #lorem with: #ipsum with: #dolor.
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem ipsum dolor).
]

{ #category : #'set tests' }
CTOrderedSetTest >> testInstanceCreationWithWithWithDuplicate [
	| set |
	set := CTOrderedSet with: #lorem with: #ipsum with: #lorem.
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem ipsum).
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testInstanceCreationWithWithWithWithDistinct [
	| set |
	set := CTOrderedSet with: #lorem with: #ipsum with: #dolor with: #sit.
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem ipsum dolor sit).
]

{ #category : #'set tests' }
CTOrderedSetTest >> testInstanceCreationWithWithWithWithDuplicate [
	| set |
	set := CTOrderedSet with: #lorem with: #ipsum with: #lorem with: #dolor.
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem ipsum dolor).
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testInstanceCreationWithWithWithWithWithDistinct [
	| set |
	set := CTOrderedSet with: #lorem with: #ipsum with: #dolor with: #sit with: #amet.
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem ipsum dolor sit amet).
]

{ #category : #'set tests' }
CTOrderedSetTest >> testInstanceCreationWithWithWithWithWithDuplicate [
	| set |
	set := CTOrderedSet with: #lorem with: #ipsum with: #lorem with: #dolor with: #ipsum.
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem ipsum dolor).
]

{ #category : #'set tests' }
CTOrderedSetTest >> testIntersection [
	| setA setB expected actual |
	
	setA := CTOrderedSet withAll: #(a c d b f).
	setB := CTOrderedSet withAll: #(b c e a).
	
	expected := CTOrderedSet withAll: #(a c b).
	actual := setA intersection: setB.
	
	self assert: actual equals: expected.
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

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testIsSortedFalse [
	| set |
	set := CTOrderedSet withAll: #(2 3 6 4 1 5 9 7 8 0).
	self deny: set isSorted.
]

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testIsSortedTrue [
	| set |
	set := CTOrderedSet withAll: #(0 1 2 3 4 5 6 7 8 9).
	self assert: set isSorted.
]

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testLast [
	| set expected actual |
	set := CTOrderedSet withAll: #(one two three four five six seven eight nine ten eleven).
	
	actual := set last.
	expected := #eleven.
	
	self assert: actual equals: expected.
]

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testNinth [
	| set expected actual |
	set := CTOrderedSet withAll: #(one two three four five six seven eight nine ten eleven).
	
	actual := set ninth.
	expected := #nine.
	
	self assert: actual equals: expected.
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

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testRemoveAt [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	self assert: (set removeAt: 3) equals: #dolor.
	
	expected := CTOrderedSet withAll: #(lorem ipsum sit amet).
	self assert: set equals: expected.
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testRemoveExisting [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	self assert: (set remove: #ipsum) equals: #ipsum.
	self assert: set asArray equals: #(lorem dolor sit amet).
]

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testRemoveFirst [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	self assert: set removeFirst equals: #lorem.
	
	expected := CTOrderedSet withAll: #(ipsum dolor sit amet).
	self assert: set equals: expected.
]

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testRemoveFirstN [
	| set expected actual |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	actual := set removeFirst: 3.
	"expected := CTOrderedSet withAll: #(lorem ipsum dolor)."
	expected := #(lorem ipsum dolor).
	
	self assert: actual equals: expected.
	
	expected := CTOrderedSet withAll: #(sit amet).
	self assert: set equals: expected.
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

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testRemoveLast [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	self assert: set removeLast equals: #amet.
	
	expected := CTOrderedSet withAll: #(lorem ipsum dolor sit).
	self assert: set equals: expected.
]

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testRemoveLastN [
	| set expected actual |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	actual := set removeLast: 3.
	"expected := CTOrderedSet withAll: #(dolor sit amet)."
	expected := #(dolor sit amet).
	
	self assert: actual equals: expected.
	
	expected := CTOrderedSet withAll: #(lorem ipsum).
	self assert: set equals: expected.
]

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testSecond [
	| set expected actual |
	set := CTOrderedSet withAll: #(one two three four five six seven eight nine ten eleven).
	
	actual := set second.
	expected := #two.
	
	self assert: actual equals: expected.
]

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testSeventh [
	| set expected actual |
	set := CTOrderedSet withAll: #(one two three four five six seven eight nine ten eleven).
	
	actual := set seventh.
	expected := #seven.
	
	self assert: actual equals: expected.
]

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testSixth [
	| set expected actual |
	set := CTOrderedSet withAll: #(one two three four five six seven eight nine ten eleven).
	
	actual := set sixth.
	expected := #six.
	
	self assert: actual equals: expected.
]

{ #category : #'collection tests' }
CTOrderedSetTest >> testSizeIsOne [
	| set |
	set := CTOrderedSet with: 42.
	self assert: set size equals: 1.
]

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testSort [
	| set expected |
	set := CTOrderedSet withAll: #(2 3 6 4 1 5 9 7 8 0).
	
	set sort.
	expected := CTOrderedSet withAll: #(0 1 2 3 4 5 6 7 8 9).
	
	self assert: set equals: expected.
]

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testSorted [
	| set expected actual |
	set := CTOrderedSet withAll: #(2 3 6 4 1 5 9 7 8 0).
	
	actual := set sorted.
	expected := CTOrderedSet withAll: #(0 1 2 3 4 5 6 7 8 9).
	
	self assert: actual equals: expected.
	
	expected := CTOrderedSet withAll: #(2 3 6 4 1 5 9 7 8 0).
	self assert: set equals: expected.
]

{ #category : #'ordered collection tests' }
CTOrderedSetTest >> testThird [
	| set expected actual |
	set := CTOrderedSet withAll: #(one two three four five six seven eight nine ten eleven).
	
	actual := set third.
	expected := #three.
	
	self assert: actual equals: expected.
]

{ #category : #'set tests' }
CTOrderedSetTest >> testUnion [
	| setA setB expected actual |
	
	setA := CTOrderedSet withAll: #(a c d).
	setB := CTOrderedSet withAll: #(b c e).
	
	expected := CTOrderedSet withAll: #(a c d b e).
	actual := setA union: setB.
	
	self assert: actual equals: expected.
]

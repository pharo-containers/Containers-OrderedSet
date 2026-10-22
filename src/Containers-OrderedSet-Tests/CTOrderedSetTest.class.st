Class {
	#name : 'CTOrderedSetTest',
	#superclass : 'TestCase',
	#category : 'Containers-OrderedSet-Tests',
	#package : 'Containers-OrderedSet-Tests'
}

{ #category : 'tests - collections' }
CTOrderedSetTest >> testAddAllDistinctToEmpty [
	| set |
	set := CTOrderedSet new.
	set addAll: #(lorem ipsum dolor sit amet).
	self assert: set asArray equals: #(lorem ipsum dolor sit amet).
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testAddAllDistinctToNonEmpty [
	| set |
	set := CTOrderedSet with: 42.
	set addAll: #(lorem ipsum dolor sit amet).
	self assert: set asArray equals: #(42 lorem ipsum dolor sit amet).
]

{ #category : 'tests - no duplicates' }
CTOrderedSetTest >> testAddAllDuplicateToEmpty [
	| set |
	set := CTOrderedSet new.
	set addAll: #(lorem ipsum dolor ipsum ipsum amet).
	self assert: set asArray equals: #(lorem ipsum dolor amet).
]

{ #category : 'tests - no duplicates' }
CTOrderedSetTest >> testAddAllDuplicateToNonEmpty [
	| set |
	set := CTOrderedSet with: 42.
	set addAll: #(lorem 42 ipsum dolor ipsum ipsum amet).
	self assert: set asArray equals: #(42 lorem ipsum dolor amet).
]

{ #category : 'tests - ordered collection' }
CTOrderedSetTest >> testAddAllFirst [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	set addAllFirst: #(hello world).
	expected := CTOrderedSet withAll: #(hello world lorem ipsum dolor sit amet).
	
	self assert: set equals: expected.
]

{ #category : 'tests - no duplicates' }
CTOrderedSetTest >> testAddAllFirstDuplicate [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	set addAllFirst: #(hello ipsum).
	expected := CTOrderedSet withAll: #(hello lorem ipsum dolor sit amet).
	
	self assert: set equals: expected.
]

{ #category : 'tests - ordered collection' }
CTOrderedSetTest >> testAddAllLast [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	set addAllLast: #(hello world).
	expected := CTOrderedSet withAll: #(lorem ipsum dolor sit amet hello world).
	
	self assert: set equals: expected.
]

{ #category : 'tests - no duplicates' }
CTOrderedSetTest >> testAddAllLastDuplicate [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	set addAllLast: #(hello ipsum).
	expected := CTOrderedSet withAll: #(lorem ipsum dolor sit amet hello).
	
	self assert: set equals: expected.
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testAddDistinctToNonEmpty [
	| set |
	set := CTOrderedSet with: 10.
	set add: 42.
	self assert: set asArray equals: #(10 42).
]

{ #category : 'tests - no duplicates' }
CTOrderedSetTest >> testAddDuplicate [
	| set |
	set := CTOrderedSet with: 42.
	
	self assert: (set add: 42) equals: 42.
	self assert: set asArray equals: #(42).
]

{ #category : 'tests - ordered collection' }
CTOrderedSetTest >> testAddFirst [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	set addFirst: #hello.
	expected := CTOrderedSet withAll: #(hello lorem ipsum dolor sit amet).
	
	self assert: set equals: expected.
]

{ #category : 'tests - no duplicates' }
CTOrderedSetTest >> testAddFirstDuplicate [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	set addFirst: #ipsum.
	expected := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	self assert: set equals: expected.
]

{ #category : 'tests - ordered collection' }
CTOrderedSetTest >> testAddLast [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	set addLast: #hello.
	expected := CTOrderedSet withAll: #(lorem ipsum dolor sit amet hello).
	
	self assert: set equals: expected.
]

{ #category : 'tests - no duplicates' }
CTOrderedSetTest >> testAddLastDuplicate [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	set addLast: #ipsum.
	expected := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	self assert: set equals: expected.
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testAddToEmpty [
	| set |
	set := CTOrderedSet new.
	set add: 42.
	self assert: set asArray equals: #(42).
]

{ #category : 'tests - set operations' }
CTOrderedSetTest >> testAllLargestSubsets [
	| set expected actual |
	set := CTOrderedSet withAll: #(a c b).
	
	expected := CTOrderedSet withAll: { 
		CTOrderedSet withAll: #(a c) .
		CTOrderedSet withAll: #(a b) .
		CTOrderedSet withAll: #(c b) }.
		
	actual := set allLargestSubsets.
	self assert: actual equals: expected.
]

{ #category : 'tests' }
CTOrderedSetTest >> testAllSubsets [
	| set expected actual |
	set := CTOrderedSet withAll: #(a c b).

	expected := { 
		CTOrderedSet withAll: #(a) .
		CTOrderedSet withAll: #(c) .
		CTOrderedSet withAll: #(a c) . 
		CTOrderedSet withAll: #(b) .  
		CTOrderedSet withAll: #(a b) .
		CTOrderedSet withAll: #(c b) }.

	actual := set allSubsets.
	self assert: actual equals: expected. 
]

{ #category : 'tests - performance' }
CTOrderedSetTest >> testAllSubsetsPerformance [
	| set time |
	set := CTOrderedSet withAll: (1 to: 10) asArray. "Set of size 10"
	
	time := [ set allSubsets ] timeToRun.
	self assert: set allSubsets size equals: (1 bitShift: 10) - 2. "1022 subsets"
	self assert: time < 1 second description: 'Should complete within 1 second for size 10'.
]

{ #category : 'tests - ordered collection' }
CTOrderedSetTest >> testAt [
	| set expected actual |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	actual := set at: 3.
	expected := #dolor.
	
	self assert: actual equals: expected.
]

{ #category : 'tests - ordered collection' }
CTOrderedSetTest >> testAtPut [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	self assert: (set at: 3 put: #hello) equals: #hello.
	
	expected := CTOrderedSet withAll: #(lorem ipsum hello sit amet).
	self assert: set equals: expected.
]

{ #category : 'tests - no duplicates' }
CTOrderedSetTest >> testAtPutDuplicate [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	self should: [ set at: 3 put: #ipsum ] raise: CTDuplicateException.
]

{ #category : 'tests - no duplicates' }
CTOrderedSetTest >> testAtPutDuplicateSamePosition [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	set at: 3 put: #dolor.
	
	expected := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	self assert: set equals: expected
]

{ #category : 'tests - set operations' }
CTOrderedSetTest >> testDifference [
	| setA setB expected actual |
	
	setA := CTOrderedSet withAll: #(a c f b d).
	setB := CTOrderedSet withAll: #(b c e a).
	
	expected := CTOrderedSet withAll: #(f d).
	actual := setA difference: setB.
	
	self assert: actual equals: expected.
]

{ #category : 'tests - ordered collection' }
CTOrderedSetTest >> testEighth [
	| set expected actual |
	set := CTOrderedSet withAll: #(one two three four five six seven eight nine ten eleven).
	
	actual := set eighth.
	expected := #eight.
	
	self assert: actual equals: expected.
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testEmptyCollectionIncludes [
	| set |
	set := CTOrderedSet new.
	self deny: (set includes: 42).
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testEmptyCollectionIsEmpty [
	| set |
	set := CTOrderedSet new.
	self assert: set isEmpty.
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testEmptyCollectionIsNotEmpty [
	| set |
	set := CTOrderedSet new.
	self deny: set isNotEmpty.
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testEmptyCollectionSizeIsZero [
	| set |
	set := CTOrderedSet new.
	self assert: set size equals: 0.
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testEnumerateCollectDistinct [
	| set actual expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	actual := set collect: [ :each | each first ].
	expected := CTOrderedSet withAll: #($l $i $d $s $a).
	
	self assert: actual equals: expected.
]

{ #category : 'tests - no duplicates' }
CTOrderedSetTest >> testEnumerateCollectDuplicate [
	| set actual expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	actual := set collect: [ :each | each size ].
	expected := CTOrderedSet withAll: #(5 3 4).
	
	self assert: actual equals: expected.
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testEnumerateDetect [
	| set actual expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	actual := set detect: [ :each | each size < 5 ].
	expected := #sit.
	
	self assert: actual equals: expected.
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testEnumerateDo [
	| set actual expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	actual := OrderedCollection new.
	set do: [ :each | actual add: each size ].
	
	expected := OrderedCollection withAll: #(5 5 5 3 4).
	self assert: actual equals: expected.
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testEnumerateInjectInto [
	| set actual expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	actual := set inject: 0 into: [ :sum :each | sum + each size ].
	expected := 22.
	
	self assert: actual equals: expected.
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testEnumerateReject [
	| set actual expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	actual := set reject: [ :each | each size = 5 ].
	expected := CTOrderedSet withAll: #(sit amet).
	
	self assert: actual equals: expected.
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testEnumerateSelect [
	| set actual expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	actual := set select: [ :each | each size = 5 ].
	expected := CTOrderedSet withAll: #(lorem ipsum dolor).
	
	self assert: actual equals: expected.
]

{ #category : 'tests - ordered collection' }
CTOrderedSetTest >> testFifth [
	| set expected actual |
	set := CTOrderedSet withAll: #(one two three four five six seven eight nine ten eleven).
	
	actual := set fifth.
	expected := #five.
	
	self assert: actual equals: expected.
]

{ #category : 'tests - ordered collection' }
CTOrderedSetTest >> testFirst [
	| set expected actual |
	set := CTOrderedSet withAll: #(one two three four five six seven eight nine ten eleven).
	
	actual := set first.
	expected := #one.
	
	self assert: actual equals: expected.
]

{ #category : 'tests - ordered collection' }
CTOrderedSetTest >> testFourth [
	| set expected actual |
	set := CTOrderedSet withAll: #(one two three four five six seven eight nine ten eleven).
	
	actual := set fourth.
	expected := #four.
	
	self assert: actual equals: expected.
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testIncludesAllFalse [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	self deny: (set includesAll: #(lorem hello)).
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testIncludesAllTrue [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	self assert: (set includesAll: #(lorem sit)).
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testIncludesFalse [
	| set |
	set := CTOrderedSet with: 42.
	self deny: (set includes: 10).
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testIncludesTrue [
	| set |
	set := CTOrderedSet with: 42.
	self assert: (set includes: 42).
]

{ #category : 'tests - ordered collection' }
CTOrderedSetTest >> testIndexOf [
	| set expected actual |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	actual := set indexOf: #dolor.
	expected := 3.
	
	self assert: actual equals: expected.
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testInstanceCreationWith [
	| set |
	set := CTOrderedSet with: #lorem.
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem).
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testInstanceCreationWithAllDistinct [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem ipsum dolor sit amet).
]

{ #category : 'tests - no duplicates' }
CTOrderedSetTest >> testInstanceCreationWithAllDuplicate [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor ipsum ipsum amet).
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem ipsum dolor amet).
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testInstanceCreationWithWithDistinct [
	| set |
	set := CTOrderedSet with: #lorem with: #ipsum.
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem ipsum).
]

{ #category : 'tests - no duplicates' }
CTOrderedSetTest >> testInstanceCreationWithWithDuplicate [
	| set |
	set := CTOrderedSet with: #lorem with: #lorem.
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem).
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testInstanceCreationWithWithWithDistinct [
	| set |
	set := CTOrderedSet with: #lorem with: #ipsum with: #dolor.
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem ipsum dolor).
]

{ #category : 'tests - no duplicates' }
CTOrderedSetTest >> testInstanceCreationWithWithWithDuplicate [
	| set |
	set := CTOrderedSet with: #lorem with: #ipsum with: #lorem.
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem ipsum).
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testInstanceCreationWithWithWithWithDistinct [
	| set |
	set := CTOrderedSet with: #lorem with: #ipsum with: #dolor with: #sit.
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem ipsum dolor sit).
]

{ #category : 'tests - no duplicates' }
CTOrderedSetTest >> testInstanceCreationWithWithWithWithDuplicate [
	| set |
	set := CTOrderedSet with: #lorem with: #ipsum with: #lorem with: #dolor.
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem ipsum dolor).
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testInstanceCreationWithWithWithWithWithDistinct [
	| set |
	set := CTOrderedSet with: #lorem with: #ipsum with: #dolor with: #sit with: #amet.
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem ipsum dolor sit amet).
]

{ #category : 'tests - no duplicates' }
CTOrderedSetTest >> testInstanceCreationWithWithWithWithWithDuplicate [
	| set |
	set := CTOrderedSet with: #lorem with: #ipsum with: #lorem with: #dolor with: #ipsum.
	
	self assert: set class equals: CTOrderedSet.
	self assert: set asArray equals: #(lorem ipsum dolor).
]

{ #category : 'tests - set operations' }
CTOrderedSetTest >> testIntersection [
	| setA setB expected actual |
	
	setA := CTOrderedSet withAll: #(a c d b f).
	setB := CTOrderedSet withAll: #(b c e a).
	
	expected := CTOrderedSet withAll: #(a c b).
	actual := setA intersection: setB.
	
	self assert: actual equals: expected.
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testIsEmpty [
	| set |
	set := CTOrderedSet with: 42.
	self deny: set isEmpty.
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testIsNotEmpty [
	| set |
	set := CTOrderedSet with: 42.
	self assert: set isNotEmpty.
]

{ #category : 'tests - ordered collection' }
CTOrderedSetTest >> testIsSortedFalse [
	| set |
	set := CTOrderedSet withAll: #(2 3 6 4 1 5 9 7 8 0).
	self deny: set isSorted.
]

{ #category : 'tests - ordered collection' }
CTOrderedSetTest >> testIsSortedTrue [
	| set |
	set := CTOrderedSet withAll: #(0 1 2 3 4 5 6 7 8 9).
	self assert: set isSorted.
]

{ #category : 'tests - set operations' }
CTOrderedSetTest >> testIsSubsetOf [
	| setA setB setC |
	
	setA := CTOrderedSet withAll: #(a b c d e).
	setB := CTOrderedSet withAll: #(c e a).
	setC := CTOrderedSet withAll: #(b c f).
	
	self deny: (setA isSubsetOf: setB).
	self deny: (setA isSubsetOf: setC).
	self assert: (setB isSubsetOf: setA).
	self deny: (setB isSubsetOf: setC).
	self deny: (setC isSubsetOf: setA).
	self deny: (setC isSubsetOf: setB).
]

{ #category : 'tests - set operations' }
CTOrderedSetTest >> testIsSupersetOf [
	| setA setB setC |
	
	setA := CTOrderedSet withAll: #(a b c d e).
	setB := CTOrderedSet withAll: #(c e a).
	setC := CTOrderedSet withAll: #(b c f).
	
	self assert: (setA isSupersetOf: setB).
	self deny: (setA isSupersetOf: setC).
	self deny: (setB isSupersetOf: setA).
	self deny: (setB isSupersetOf: setC).
	self deny: (setC isSupersetOf: setA).
	self deny: (setC isSupersetOf: setB).
]

{ #category : 'tests - ordered collection' }
CTOrderedSetTest >> testLast [
	| set expected actual |
	set := CTOrderedSet withAll: #(one two three four five six seven eight nine ten eleven).
	
	actual := set last.
	expected := #eleven.
	
	self assert: actual equals: expected.
]

{ #category : 'tests - ordered collection' }
CTOrderedSetTest >> testNinth [
	| set expected actual |
	set := CTOrderedSet withAll: #(one two three four five six seven eight nine ten eleven).
	
	actual := set ninth.
	expected := #nine.
	
	self assert: actual equals: expected.
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testRemoveAbsentError [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	self should: [ set remove: #hello ] raise: NotFound.
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testRemoveAllAbsentError [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	self should: [ set removeAll: #(hello world) ] raise: NotFound.
	self assert: set asArray equals: #(lorem ipsum dolor sit amet).
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testRemoveAllExisting [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	self assert: (set removeAll: #(ipsum sit)) equals: #(ipsum sit).
	self assert: set asArray equals: #(lorem dolor amet).
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testRemoveAllFromEmpty [
	| set |
	set := CTOrderedSet new.
	self should: [ set removeAll: #(lorem ipsum) ] raise: NotFound.
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testRemoveAllOneAbsentError [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	self should: [ set removeAll: #(ipsum hello sit) ] raise: NotFound.
	self assert: set asArray equals: #(lorem dolor sit amet).
]

{ #category : 'tests - ordered collection' }
CTOrderedSetTest >> testRemoveAt [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	self assert: (set removeAt: 3) equals: #dolor.
	
	expected := CTOrderedSet withAll: #(lorem ipsum sit amet).
	self assert: set equals: expected.
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testRemoveExisting [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	self assert: (set remove: #ipsum) equals: #ipsum.
	self assert: set asArray equals: #(lorem dolor sit amet).
]

{ #category : 'tests - ordered collection' }
CTOrderedSetTest >> testRemoveFirst [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	self assert: set removeFirst equals: #lorem.
	
	expected := CTOrderedSet withAll: #(ipsum dolor sit amet).
	self assert: set equals: expected.
]

{ #category : 'tests - ordered collection' }
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

{ #category : 'tests - collections' }
CTOrderedSetTest >> testRemoveFromEmptyError [
	| set |
	set := CTOrderedSet new.
	self should: [ set remove: #hello ] raise: NotFound.
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testRemoveIfAbsentAbsent [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	self assert: (set remove: #hello ifAbsent: [ 'oops' ]) equals: #oops.
	self assert: set asArray equals: #(lorem ipsum dolor sit amet).
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testRemoveIfAbsentExisting [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	self assert: (set remove: #ipsum ifAbsent: [ 'oops' ]) equals: #ipsum.
	self assert: set asArray equals: #(lorem dolor sit amet).
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testRemoveIfAbsentFromEmpty [
	| set |
	set := CTOrderedSet new.
	self assert: (set remove: #hello ifAbsent: [ 'oops' ]) equals: #oops.
]

{ #category : 'tests - ordered collection' }
CTOrderedSetTest >> testRemoveLast [
	| set expected |
	set := CTOrderedSet withAll: #(lorem ipsum dolor sit amet).
	
	self assert: set removeLast equals: #amet.
	
	expected := CTOrderedSet withAll: #(lorem ipsum dolor sit).
	self assert: set equals: expected.
]

{ #category : 'tests - ordered collection' }
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

{ #category : 'tests - ordered collection' }
CTOrderedSetTest >> testSecond [
	| set expected actual |
	set := CTOrderedSet withAll: #(one two three four five six seven eight nine ten eleven).
	
	actual := set second.
	expected := #two.
	
	self assert: actual equals: expected.
]

{ #category : 'tests - ordered collection' }
CTOrderedSetTest >> testSeventh [
	| set expected actual |
	set := CTOrderedSet withAll: #(one two three four five six seven eight nine ten eleven).
	
	actual := set seventh.
	expected := #seven.
	
	self assert: actual equals: expected.
]

{ #category : 'tests - ordered collection' }
CTOrderedSetTest >> testSixth [
	| set expected actual |
	set := CTOrderedSet withAll: #(one two three four five six seven eight nine ten eleven).
	
	actual := set sixth.
	expected := #six.
	
	self assert: actual equals: expected.
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testSizeIsOne [
	| set |
	set := CTOrderedSet with: 42.
	self assert: set size equals: 1.
]

{ #category : 'tests - ordered collection' }
CTOrderedSetTest >> testSort [
	| set expected |
	set := CTOrderedSet withAll: #(2 3 6 4 1 5 9 7 8 0).
	
	set sort.
	expected := CTOrderedSet withAll: #(0 1 2 3 4 5 6 7 8 9).
	
	self assert: set equals: expected.
]

{ #category : 'tests - ordered collection' }
CTOrderedSetTest >> testSorted [
	| set expected actual |
	set := CTOrderedSet withAll: #(2 3 6 4 1 5 9 7 8 0).
	
	actual := set sorted.
	expected := CTOrderedSet withAll: #(0 1 2 3 4 5 6 7 8 9).
	
	self assert: actual equals: expected.
	
	expected := CTOrderedSet withAll: #(2 3 6 4 1 5 9 7 8 0).
	self assert: set equals: expected.
]

{ #category : 'tests - collections' }
CTOrderedSetTest >> testSwapWith [
	| set |
	set := CTOrderedSet withAll: #(lorem ipsum).
	set swap: 1 with: 2.
	self assert: set asArray equals: #(ipsum lorem).
]

{ #category : 'tests - ordered collection' }
CTOrderedSetTest >> testThird [
	| set expected actual |
	set := CTOrderedSet withAll: #(one two three four five six seven eight nine ten eleven).
	
	actual := set third.
	expected := #three.
	
	self assert: actual equals: expected.
]

{ #category : 'tests - set operations' }
CTOrderedSetTest >> testUnion [
	| setA setB expected actual |
	
	setA := CTOrderedSet withAll: #(a c d).
	setB := CTOrderedSet withAll: #(b c e).
	
	expected := CTOrderedSet withAll: #(a c d b e).
	actual := setA union: setB.
	
	self assert: actual equals: expected.
]

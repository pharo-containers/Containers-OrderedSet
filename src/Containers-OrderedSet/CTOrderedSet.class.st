Class {
	#name : 'CTOrderedSet',
	#superclass : 'Collection',
	#instVars : [
		'items'
	],
	#category : 'Containers-OrderedSet',
	#package : 'Containers-OrderedSet'
}

{ #category : 'instance creation' }
CTOrderedSet class >> new: aNumber [ 
	"SequenceableCollection >> new: and new don't call initialize. So we fix it here"
	
	^ (super new) initialize
]

{ #category : 'initialization' }
CTOrderedSet >> initialize [
	super initialize.
	items := OrderedCollection new.
]

{ #category : 'adding' }
CTOrderedSet >> add: anObject [
	"Add anObject unless already present"
	
	(self includes: anObject)
		ifFalse: [ items add: anObject ].
	
	^ anObject
]

{ #category : 'adding' }
CTOrderedSet >> addAll: aCollection [
	"Add all elements from aCollection"
	
	aCollection do: [ :each |
		self add: each ].
	
	^ self
]

{ #category : 'adding' }
CTOrderedSet >> addFirst: newObject [
	"Add newObject to the beginning of the receiver unless the receiver already includes newObject. Answer newObject"	

	(self includes: newObject)
		ifFalse: [ items addFirst: newObject ].
		
	^ newObject
]

{ #category : 'adding' }
CTOrderedSet >> addLast: newObject [
	"Add newObject to the end of the receiver unless the receiver already includes newObject. Answer newObject"	

	(self includes: newObject)
		ifFalse: [ items addLast: newObject ].
	
	^ newObject
]

{ #category : 'as yet unclassified' }
CTOrderedSet >> allLargestSubsets [
	"Generate all subsets of size k-1 where k is the size of receiver"
	
	^ self reversed collect: [ :each | self copyWithout: each ].
]

{ #category : 'as yet unclassified' }
CTOrderedSet >> allSubsets [
	"Generate all possible subsets of the receiver, excluding the receiver itself and the empty set.
	Uses a bitmask approach for efficiency.
	Example: #(a b c) => #(a), #(b), #(c), #(a b), #(a c), #(b c)"
	
	| subsets size |
	size := self size.
	subsets := OrderedCollection new: (1 bitShift: size) - 2. "Reserve space for 2^n - 2 subsets"
	
	1 to: (1 bitShift: size) - 2 do: [ :mask |
		| subset |
		subset := self species new.
		
		1 to: size do: [ :index |
			(mask bitAt: index) = 1 ifTrue: [
				subset addLast: (self at: index)
			]
		].
		
		subsets add: subset
	].
	
	^ subsets asArray
]

{ #category : 'accessing' }
CTOrderedSet >> at: anInteger [
	"Answer the element at anInteger"
	
	^ items at: anInteger
]

{ #category : 'accessing' }
CTOrderedSet >> at: anInteger put: anObject [
	"Put anObject at element index anInteger. Raise an exception if the object is already included"
	
	(self at: anInteger) = anObject
		ifTrue: [ ^ anObject ].

	(self includes: anObject)
		ifTrue: [
			CTDuplicateException signal: 'Can not insert duplicate into a set'
		].
	
	items at: anInteger put: anObject.
	
	^ anObject
]

{ #category : 'copying' }
CTOrderedSet >> copy [
	"Answer a copy of the receiver"
	
	| newSet |
	newSet := self class new.
	
	items do: [ :each |
		newSet add: each ].
	
	^ newSet
]

{ #category : 'copying' }
CTOrderedSet >> copyWithout: anObject [
	"Answer a copy of the receiver without anObject"
	
	| newSet |
	newSet := self copy.
	newSet remove: anObject.
	
	^ newSet
]

{ #category : 'enumerating' }
CTOrderedSet >> difference: aCollection [
	"A set of all elements that appear in this set but not in aCollection. The order is the same as in first set.
	
	Example:
	{a, c, f, b, d} difference: {b, c, e, a} = {f, d}"
	
	^ self reject: [ :each | aCollection includes: each ]
]

{ #category : 'enumerating' }
CTOrderedSet >> do: aBlock [
	"Evaluate aBlock for each element of the receiver"
	
	items do: aBlock
]

{ #category : 'testing' }
CTOrderedSet >> includes: anObject [
	"Answer whether anObject is included"
	
	^ items includes: anObject
]

{ #category : 'inspecting' }
CTOrderedSet >> inspectionStats: aBuilder [
	<inspectorPresentationOrder: 0 title: 'Stats'> 
	
	^ aBuilder newTable
		addColumn: (SpStringTableColumn title: 'Metric' evaluated: #key);
		addColumn: (SpStringTableColumn title: 'Value' evaluated: [ :assoc | assoc value asString ]);
		items: { 
			'Size (Unique Elements)' -> self size.
			'Internal Capacity' -> items capacity.
		};
		yourself
]

{ #category : 'accessing' }
CTOrderedSet >> intersection: aCollection [
	"Intersection of two sets. The order is defined as follows:
	- all elements of the first that appear in the second set
	
	Example:
	{d, c, a} intersection: {a, d, e} = {d, a}"
	
	^ self select: [ :each | aCollection includes: each ]
]

{ #category : 'testing' }
CTOrderedSet >> isEmpty [
	"Answer true if the receiver contains no elements"
	
	^ items isEmpty
]

{ #category : 'testing' }
CTOrderedSet >> isSubsetOf: aCollection [
	"Answer true if aCollection includes all elements of the receiver"
	
	^ aCollection includesAll: self
]

{ #category : 'testing' }
CTOrderedSet >> isSupersetOf: aCollection [
	"Answer true if receiver includes all elements of aCollection"
	
	^ self includesAll: aCollection
]

{ #category : 'removing' }
CTOrderedSet >> remove: anObject [
	"Remove anObject from the receiver"
	
	items remove: anObject ifAbsent: [ ].
	
	^ anObject
]

{ #category : 'enumerating' }
CTOrderedSet >> reject: aBlock [
	"Answer all elements for which aBlock evaluates to false"
	
	| result |
	result := self species new.
	
	self do: [ :each |
		(aBlock value: each)
			ifFalse: [ result add: each ]
	].
	
	^ result
]

{ #category : 'enumerating' }
CTOrderedSet >> reversed [
	"Answer the reversed order of the receiver"
	
	^ items reversed
]

{ #category : 'enumerating' }
CTOrderedSet >> select: aBlock [
	"Answer all elements for which aBlock evaluates to true"
	
	| result |
	result := self species new.
	
	self do: [ :each |
		(aBlock value: each)
			ifTrue: [ result add: each ]
	].
	
	^ result
]

{ #category : 'accessing' }
CTOrderedSet >> size [
	"Answer the number of elements in the receiver"
	
	^ items size
]

{ #category : 'accessing' }
CTOrderedSet >> species [
	"Answer the species of the receiver"
	
	^ CTOrderedSet
]

{ #category : 'accessing' }
CTOrderedSet >> swap: oneIndex with: anotherIndex [

	| element |
	element := self at: oneIndex.
	
	items at: oneIndex put: (self at: anotherIndex).
	items at: anotherIndex put: element
]

{ #category : 'accessing' }
CTOrderedSet >> union: aCollection [
	"Union of two sets. The order is defined as follows:
	- all elements of the first set go first
	- then the elements of the second set that were not in the first set
	
	Example:
	{a, c, d} union: {a, b, e} = {a, c, d, b, e}"
	
	| result |
	result := self copy.
	result addAll: aCollection.
	
	^ result
]
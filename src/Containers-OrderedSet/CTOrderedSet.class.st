Class {
	#name : 'CTOrderedSet',
	#superclass : 'OrderedCollection',
	#category : 'Containers-OrderedSet',
	#package : 'Containers-OrderedSet'
}

{ #category : 'instance creation' }
CTOrderedSet class >> new: aNumber [ 
	"SequenceableCollection >> new: and new don't call initialize. So we fix it here"
	^ (super new: aNumber) initialize
]

{ #category : 'adding' }
CTOrderedSet >> addFirst: newObject [
	"Add newObject to the beginning of the receiver unless the receiver already includes newObject. Answer newObject"	

	(self includes: newObject)
		ifFalse: [ ^ super addFirst: newObject].
	^ newObject
]

{ #category : 'adding' }
CTOrderedSet >> addLast: newObject [
	"Add newObject to the end of the receiver unless the receiver already includes newObject. Answer newObject"	

	(self includes: newObject)
		ifFalse: [ ^ super addLast: newObject].
	
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
			(mask bitAt: index) = 1 ifTrue: [ subset addLast: (self at: index) ] ].
		subsets add: subset ].
	
	^ subsets asArray
]

{ #category : 'accessing' }
CTOrderedSet >> at: anInteger put: anObject [
	"Put anObject at element index anInteger. Raise an exception if the object is already included"
	
	(self at: anInteger) = anObject
		ifTrue: [ ^ anObject ].

	(self includes: anObject)
		ifFalse: [ ^ super at: anInteger put: anObject].
	
	CTDuplicateException signal: 'Can not insert duplicate into a set'.
]

{ #category : 'enumerating' }
CTOrderedSet >> difference: aCollection [
	"A set of all elements that appear in this set but not in aCollection. The order is the same as in first set.
	
	Example:
	{a, c, f, b, d} difference: {b, c, e, a} = {f, d}"
	
	^ self reject: [ :each | aCollection includes: each ]
]

{ #category : 'inspecting' }
CTOrderedSet >> inspectionStats: aBuilder [
	<inspectorPresentationOrder: 0 title: 'Stats'> 
	
	^ aBuilder newTable
		addColumn: (SpStringTableColumn title: 'Metric' evaluated: #key);
		addColumn: (SpStringTableColumn title: 'Value' evaluated: [ :assoc | assoc value asString ]);
		items: { 
			'Size (Unique Elements)' -> self size.
			'Internal Capacity' -> self capacity.
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
CTOrderedSet >> isSubsetOf: aCollection [
	"Answer true if aCollection includes all elements of the receiver"
	
	^ aCollection includesAll: self
]

{ #category : 'testing' }
CTOrderedSet >> isSupersetOf: aCollection [
	"Answer true if receiver includes all elements of aCollection"
	
	^ self includesAll: aCollection
]

{ #category : 'accessing' }
CTOrderedSet >> union: aCollection [
	"Union of two sets. The order is defined as follows:
	- all elements of the first set go first
	- then the elements of the second set that were not in the first set
	
	Example:
	{a, c, d} union: {a, b, e} = {a, c, d, b, e}"
	
	self addAll: aCollection
]

Class {
	#name : #CTOrderedSet,
	#superclass : #OrderedCollection,
	#category : #'Containers-OrderedSet'
}

{ #category : #'instance creation' }
CTOrderedSet class >> new: aNumber [ 
	"SequenceableCollection >> new: and new don't call initialize. So we fix it here"
	^ (super new: aNumber) initialize
]

{ #category : #adding }
CTOrderedSet >> addFirst: newObject [
	"Add newObject to the beginning of the receiver unless the receiver already includes newObject. Answer newObject"	

	(self includes: newObject)
		ifFalse: [ ^ super addFirst: newObject].
	^ newObject
]

{ #category : #adding }
CTOrderedSet >> addLast: newObject [
	"Add newObject to the end of the receiver unless the receiver already includes newObject. Answer newObject"	

	(self includes: newObject)
		ifFalse: [ ^ super addLast: newObject].
	^ newObject
]

{ #category : #'as yet unclassified' }
CTOrderedSet >> allLargestSubsets [
	"Generate all subsets of size k-1 where k is the size of receiver"
	
	^ self reversed collect: [ :each | self copyWithout: each ].
]

{ #category : #'as yet unclassified' }
CTOrderedSet >> allSubsets [
	"Generate all possible subsets of this self without self and an empty set.
	Example:
	{1, 2, 3} => {1}, {2}, {3}, {1, 2}, {1, 3}, {2, 3}"
	
	"This implementation might not be very fast and has to be improved"
	^ (self combinations copyWithout: self asArray) collect: [ :eachArray |
		self species withAll: eachArray ]
]

{ #category : #accessing }
CTOrderedSet >> at: anInteger put: anObject [
	"Put anObject at element index anInteger. Raise an exception if the object is already included"
	
	(self at: anInteger) = anObject
		ifTrue: [ ^ anObject ].

	(self includes: anObject)
		ifFalse: [ ^ super at: anInteger put: anObject].
	
	CTDuplicateException signal: 'Can not insert duplicate into a set'.
]

{ #category : #accessing }
CTOrderedSet >> intersection: aCollection [
	"Intersection of two sets. The order is defined as follows:
	- all elements of the first that appear in the second set
	
	Example:
	{d, c, a} intersection: {a, d, e} = {d, a}"
	
	^ self select: [ :each | aCollection includes: each ]
]

{ #category : #testing }
CTOrderedSet >> isSubsetOf: aCollection [
	"Answer true if aCollection includes all elements of the receiver"
	
	^ aCollection includesAll: self
]

{ #category : #testing }
CTOrderedSet >> isSupersetOf: aCollection [
	"Answer true if receiver includes all elements of aCollection"
	
	^ self includesAll: aCollection
]

{ #category : #accessing }
CTOrderedSet >> union: aCollection [
	"Union of two sets. The order is defined as follows:
	- all elements of the first set go first
	- then the elements of the second set that were not in the first set
	
	Example:
	{a, c, d} union: {a, b, e} = {a, c, d, b, e}"
	
	self addAll: aCollection
]

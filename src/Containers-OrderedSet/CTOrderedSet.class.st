Class {
	#name : #CTOrderedSet,
	#superclass : #OrderedCollection,
	#category : #'Containers-OrderedSet'
}

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

{ #category : #accessing }
CTOrderedSet >> union: aCollection [
	"Union of two sets. The order is defined as follows:
	- all elements of the first set go first
	- then the elements of the second set that were not in the first set
	
	Example:
	{a, c, d} union: {a, b, e} = {a, c, d, b, e}"
	
	self addAll: aCollection
]

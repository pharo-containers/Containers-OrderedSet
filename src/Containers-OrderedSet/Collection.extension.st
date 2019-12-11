Extension { #name : #Collection }

{ #category : #'*Containers-OrderedSet' }
Collection >> asOrderedSet [
	^ CTOrderedSet withAll: self
]

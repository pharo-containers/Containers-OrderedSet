Class {
	#name : #BaselineOfContainersOrderedSet,
	#superclass : #BaselineOf,
	#category : #BaselineOfContainersOrderedSet
}

{ #category : #baselines }
BaselineOfContainersOrderedSet >> baseline: spec [
	<baseline>

	spec 
		for: #common 
		do: [		
			spec package: 'Containers-OrderedSet'.
			spec
				package: 'Containers-OrderedSet-Tests'
				with: [ spec requires: #( 'Containers-OrderedSet') ] ] 
]

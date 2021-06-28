!classDefinition: #TestMarsRover category: 'MarsRover'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/27/2021 15:58:31'!
test01RoverHasValidPositionAndBearingOnStart
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andBearing: 'N'.
	
	self assert: marsRover currentPosition = (0@0).
	self assert: marsRover currentBearing = 'N'.! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/27/2021 15:58:54'!
test02RoverCannotStartWithInvalidBearing
	self should: [ MarsRover withPosition: (0@0) andBearing: '' ]
	raise: Error
	withExceptionDo: [:anException |
		self assert: anException messageText equals: MarsRover  invalidBearingErrorMessage ]! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/27/2021 15:59:21'!
test03RoverCannotStartWithInvalidPosition
	self should: [ MarsRover withPosition: 1 andBearing: 'N' ]
	raise: Error
	withExceptionDo: [:anException |
		self assert: anException messageText equals: MarsRover  invalidPositionErrorMessage ]! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/27/2021 17:42:02'!
test04RoverMovesForwardWithForwardCommand
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andBearing: 'N'.
	
	marsRover executeCommands: 'f'.
	
	self assert: marsRover currentPosition = (0@1).
! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/27/2021 17:42:55'!
test05RoverMovesBackwardsWithBackwardCommand
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andBearing: 'N'.
	
	marsRover executeCommands: 'b'.
	
	self assert: marsRover currentPosition = (0@-1).! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/27/2021 17:43:42'!
test06RoverMovesMultipleOnVerticalDirections
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andBearing: 'N'.
	
	marsRover executeCommands: 'ffb'.
	
	self assert: marsRover currentPosition = (0@1).! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/27/2021 17:44:30'!
test07RoverRotatesClockwiseWithRightCommand
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andBearing: 'N'.
	
	marsRover executeCommands: 'r'.
	
	self assert: marsRover currentBearing = 'E'.! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/27/2021 17:45:08'!
test08RoverRotatesCounterClockwiseWithLeftCommand
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andBearing: 'N'.
	
	marsRover executeCommands: 'l'.
	
	self assert: marsRover currentBearing = 'O'.! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/27/2021 17:46:08'!
test09RoverRotatesMultipleTimesRightUntilInitialBearing
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andBearing: 'N'.
	
	marsRover executeCommands: 'rrrr'.
	
	self assert: marsRover currentBearing = 'N'.! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/28/2021 20:22:06'!
test10RoverMovesOnMultipleDirectionsWithValidPositionOnFinish
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andBearing: 'N'.
	
	marsRover executeCommands: 'frf'.
	
	self assert: marsRover currentBearing = 'E'.
	self assert: marsRover currentPosition  = (1@1).! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'currentPosition currentBearing'
	classVariableNames: 'BearingMapping'
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'accessing' stamp: 'fmonpelat 6/27/2021 17:09:38'!
currentBearing
	^(BearingMapping keyAtValue: currentBearing) asString. ! !

!MarsRover methodsFor: 'accessing' stamp: 'fmonpelat 6/27/2021 16:14:50'!
currentPosition
	^currentPosition! !


!MarsRover methodsFor: 'initialization' stamp: 'fmonpelat 6/27/2021 17:07:12'!
initializeWithPosition: aIntialPoint andBearing: aInitialBearing
	currentBearing := BearingMapping at: (aInitialBearing asSymbol).
	currentPosition := aIntialPoint.! !


!MarsRover methodsFor: 'operation' stamp: 'fmonpelat 6/28/2021 20:08:14'!
executeCommands: someExecuteCommands 
	| forwardMoveVertical backwardsMoveVertical forwardMoveHorizontal backwardsMoveHorizontal |
	forwardMoveVertical := (0@1).
	backwardsMoveVertical := (0@-1).
	forwardMoveHorizontal := (1@0).
	backwardsMoveHorizontal := (-1@0).
	
	
	someExecuteCommands do: [:aCommand | 
		( aCommand = $f ) ifTrue: [ currentPosition := (currentBearing = 90 or: [currentBearing = 270]) ifTrue: [ self currentPosition  +  forwardMoveHorizontal ]
																				ifFalse: [ self currentPosition  +  forwardMoveVertical ]].
		( aCommand = $b ) ifTrue: [ currentPosition := (currentBearing = 0 or: [currentBearing = 180]) ifTrue: [ self currentPosition  +  backwardsMoveVertical ]
																				ifFalse: [ self currentPosition  +  backwardsMoveHorizontal ]].
		(aCommand = $r ) ifTrue: [ currentBearing := (currentBearing + 90) = 360 ifTrue: [0] ifFalse: [currentBearing + 90] ].
		(aCommand = $l ) ifTrue: [ currentBearing :=  ((currentBearing - 90)<0 ifTrue: [currentBearing - 90 + 360] ifFalse: [currentBearing - 90]) ].
	].
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: 'bearingMapping'!

!MarsRover class methodsFor: 'class initialization' stamp: 'fmonpelat 6/27/2021 16:58:06'!
withPosition: aInitialPosition andBearing: aInitialBearing
	
	(self isValidBearing: aInitialBearing) ifFalse: [ ^self error: self invalidBearingErrorMessage ].
	(self isValidPosition: aInitialPosition) ifFalse: [ ^self error: self invalidPositionErrorMessage ].
	
	^ self new initializeWithPosition: aInitialPosition andBearing: aInitialBearing.! !


!MarsRover class methodsFor: 'error-messages' stamp: 'fmonpelat 6/27/2021 15:45:10'!
invalidBearingErrorMessage
	^'Invalid Bearing'! !

!MarsRover class methodsFor: 'error-messages' stamp: 'fmonpelat 6/27/2021 15:49:05'!
invalidPositionErrorMessage
	^'Invalid position'! !


!MarsRover class methodsFor: 'testing' stamp: 'fmonpelat 6/27/2021 17:07:05'!
isValidBearing: aBearing
	BearingMapping := Dictionary new.
	BearingMapping add: #N->0; add: #E->90; add: #S->180; add: #O->270.
	
	^ BearingMapping includesKey: (aBearing asSymbol)! !

!MarsRover class methodsFor: 'testing' stamp: 'fmonpelat 6/27/2021 15:55:17'!
isValidPosition: aPosition
	^aPosition isKindOf: Point
! !

!classDefinition: #TestMarsRover2 category: 'MarsRover2'!
TestCase subclass: #TestMarsRover2
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover2'!

!TestMarsRover2 methodsFor: 'testing' stamp: 'NDS 6/30/2021 18:37:49'!
test01RoverHasValidPositionAndBearingOnStart
	| marsRover |
	marsRover := MarsRover2 withPosition: (0@0) andBearing: 'N'.
	
	self assert: marsRover currentPosition = (0@0).
	self assert: marsRover currentBearing = 'N'.! !

!TestMarsRover2 methodsFor: 'testing' stamp: 'NDS 6/30/2021 18:37:49'!
test02RoverCannotStartWithInvalidBearing
	self should: [ MarsRover2 withPosition: (0@0) andBearing: '' ]
	raise: Error
	withExceptionDo: [:anException |
		self assert: anException messageText equals: MarsRover2  invalidBearingErrorMessage ]! !

!TestMarsRover2 methodsFor: 'testing' stamp: 'NDS 6/30/2021 18:37:49'!
test03RoverCannotStartWithInvalidPosition
	self should: [ MarsRover2 withPosition: 1 andBearing: 'N' ]
	raise: Error
	withExceptionDo: [:anException |
		self assert: anException messageText equals: MarsRover2  invalidPositionErrorMessage ]! !

!TestMarsRover2 methodsFor: 'testing' stamp: 'NDS 6/30/2021 18:37:49'!
test04RoverMovesForwardWithForwardCommand
	| marsRover |
	marsRover := MarsRover2 withPosition: (0@0) andBearing: 'N'.
	
	marsRover executeCommands: 'f'.
	
	self assert: marsRover currentPosition = (0@1).
! !

!TestMarsRover2 methodsFor: 'testing' stamp: 'NDS 6/30/2021 18:37:49'!
test05RoverMovesBackwardsWithBackwardCommand
	| marsRover |
	marsRover := MarsRover2 withPosition: (0@0) andBearing: 'N'.
	
	marsRover executeCommands: 'b'.
	
	self assert: marsRover currentPosition = (0@-1).! !

!TestMarsRover2 methodsFor: 'testing' stamp: 'NDS 6/30/2021 18:37:49'!
test06RoverMovesMultipleOnVerticalDirections
	| marsRover |
	marsRover := MarsRover2 withPosition: (0@0) andBearing: 'N'.
	
	marsRover executeCommands: 'ffb'.
	
	self assert: marsRover currentPosition = (0@1).! !

!TestMarsRover2 methodsFor: 'testing' stamp: 'NDS 6/30/2021 18:37:49'!
test07RoverRotatesClockwiseWithRightCommand
	| marsRover |
	marsRover := MarsRover2 withPosition: (0@0) andBearing: 'N'.
	
	marsRover executeCommands: 'r'.
	
	self assert: marsRover currentBearing = 'E'.! !

!TestMarsRover2 methodsFor: 'testing' stamp: 'NDS 6/30/2021 18:37:49'!
test08RoverRotatesCounterClockwiseWithLeftCommand
	| marsRover |
	marsRover := MarsRover2 withPosition: (0@0) andBearing: 'N'.
	
	marsRover executeCommands: 'l'.
	
	self assert: marsRover currentBearing = 'O'.! !

!TestMarsRover2 methodsFor: 'testing' stamp: 'NDS 6/30/2021 18:37:49'!
test09RoverRotatesMultipleTimesRightUntilInitialBearing
	| marsRover |
	marsRover := MarsRover2 withPosition: (0@0) andBearing: 'N'.
	
	marsRover executeCommands: 'rrrr'.
	
	self assert: marsRover currentBearing = 'N'.! !

!TestMarsRover2 methodsFor: 'testing' stamp: 'NDS 6/30/2021 18:37:49'!
test10RoverMovesOnMultipleDirectionsWithValidPositionOnFinish
	| marsRover |
	marsRover := MarsRover2 withPosition: (0@0) andBearing: 'N'.
	
	marsRover executeCommands: 'frf'.
	
	self assert: marsRover currentBearing = 'E'.
	self assert: marsRover currentPosition  = (1@1).! !


!classDefinition: #Command category: 'MarsRover2'!
Object subclass: #Command
	instanceVariableNames: 'command'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover2'!


!Command methodsFor: 'initialization' stamp: 'NDS 6/29/2021 20:12:06'!
executeFor: aCommand withBearing: aBearing andPosition: aPosition

	command := (Command allSubclasses detect:[:aClass | aClass canHandle: aCommand]) new.
	^command executeCommandWithBearing: aBearing andPosition: aPosition

! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Command class' category: 'MarsRover2'!
Command class
	instanceVariableNames: ''!

!Command class methodsFor: 'instance creation' stamp: 'NDS 6/29/2021 20:06:19'!
executeFor: aCommand withBearing: aBearing andPosition: aPosition
	^self new executeFor: aCommand withBearing: aBearing andPosition: aPosition
! !


!classDefinition: #MoveBackward category: 'MarsRover2'!
Command subclass: #MoveBackward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover2'!

!MoveBackward methodsFor: 'as yet unclassified' stamp: 'NDS 6/29/2021 19:07:31'!
executeCommandWithBearing: currentBearing andPosition: currentPosition

	 | backwardMoveHorizontal backwardMoveVertical|
	backwardMoveHorizontal := (-1@0).
	backwardMoveVertical := (0@-1).
	^(currentBearing = 90 or: [currentBearing = 270]) ifTrue: [ currentPosition  +  backwardMoveHorizontal ] ifFalse: [currentPosition + backwardMoveVertical]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MoveBackward class' category: 'MarsRover2'!
MoveBackward class
	instanceVariableNames: ''!

!MoveBackward class methodsFor: 'as yet unclassified' stamp: 'NDS 6/29/2021 19:54:33'!
canHandle: aCommand
	^aCommand = $b.! !


!classDefinition: #MoveForward category: 'MarsRover2'!
Command subclass: #MoveForward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover2'!

!MoveForward methodsFor: 'as yet unclassified' stamp: 'NDS 6/29/2021 20:10:15'!
executeCommandWithBearing: currentBearing andPosition: currentPosition

	 | forwardMoveHorizontal forwardMoveVertical |
	forwardMoveHorizontal := (1@0).
	forwardMoveVertical := (0@1).
	^(currentBearing = 90 or: [currentBearing = 270]) ifTrue: [ currentPosition  +  forwardMoveHorizontal ] ifFalse: [ currentPosition  +  forwardMoveVertical ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MoveForward class' category: 'MarsRover2'!
MoveForward class
	instanceVariableNames: ''!

!MoveForward class methodsFor: 'as yet unclassified' stamp: 'NDS 6/29/2021 19:54:49'!
canHandle: aCommand
	^aCommand = $f.! !


!classDefinition: #TurnLeft category: 'MarsRover2'!
Command subclass: #TurnLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover2'!

!TurnLeft methodsFor: 'as yet unclassified' stamp: 'NDS 6/29/2021 19:09:45'!
executeCommandWithBearing: currentBearing andPosition: currentPosition

	^(currentBearing - 90)<0 ifTrue: [currentBearing - 90 + 360] ifFalse: [currentBearing - 90]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TurnLeft class' category: 'MarsRover2'!
TurnLeft class
	instanceVariableNames: ''!

!TurnLeft class methodsFor: 'as yet unclassified' stamp: 'NDS 6/29/2021 19:54:57'!
canHandle: aCommand
	^aCommand = $l.! !


!classDefinition: #TurnRight category: 'MarsRover2'!
Command subclass: #TurnRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover2'!

!TurnRight methodsFor: 'as yet unclassified' stamp: 'NDS 6/29/2021 19:09:45'!
executeCommandWithBearing: currentBearing andPosition: currentPosition

	^(currentBearing + 90) = 360 ifTrue: [0] ifFalse: [currentBearing + 90]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TurnRight class' category: 'MarsRover2'!
TurnRight class
	instanceVariableNames: ''!

!TurnRight class methodsFor: 'as yet unclassified' stamp: 'NDS 6/29/2021 19:55:04'!
canHandle: aCommand
	^aCommand = $r.! !


!classDefinition: #MarsRover2 category: 'MarsRover2'!
Object subclass: #MarsRover2
	instanceVariableNames: 'currentPosition currentBearing'
	classVariableNames: 'BearingMapping'
	poolDictionaries: ''
	category: 'MarsRover2'!

!MarsRover2 methodsFor: 'accessing' stamp: 'fmonpelat 6/27/2021 17:09:38'!
currentBearing
	^(BearingMapping keyAtValue: currentBearing) asString. ! !

!MarsRover2 methodsFor: 'accessing' stamp: 'fmonpelat 6/27/2021 16:14:50'!
currentPosition
	^currentPosition! !


!MarsRover2 methodsFor: 'initialization' stamp: 'fmonpelat 6/27/2021 17:07:12'!
initializeWithPosition: aIntialPoint andBearing: aInitialBearing
	currentBearing := BearingMapping at: (aInitialBearing asSymbol).
	currentPosition := aIntialPoint.! !


!MarsRover2 methodsFor: 'operation' stamp: 'NDS 6/29/2021 20:08:29'!
executeCommands: someExecuteCommands 

	someExecuteCommands do: [:aCommand | 
		Command executeFor: aCommand withBearing: currentBearing andPosition: currentPosition

	].
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover2 class' category: 'MarsRover2'!
MarsRover2 class
	instanceVariableNames: 'bearingMapping'!

!MarsRover2 class methodsFor: 'class initialization' stamp: 'fmonpelat 6/27/2021 16:58:06'!
withPosition: aInitialPosition andBearing: aInitialBearing
	
	(self isValidBearing: aInitialBearing) ifFalse: [ ^self error: self invalidBearingErrorMessage ].
	(self isValidPosition: aInitialPosition) ifFalse: [ ^self error: self invalidPositionErrorMessage ].
	
	^ self new initializeWithPosition: aInitialPosition andBearing: aInitialBearing.! !


!MarsRover2 class methodsFor: 'error-messages' stamp: 'fmonpelat 6/27/2021 15:45:10'!
invalidBearingErrorMessage
	^'Invalid Bearing'! !

!MarsRover2 class methodsFor: 'error-messages' stamp: 'fmonpelat 6/27/2021 15:49:05'!
invalidPositionErrorMessage
	^'Invalid position'! !


!MarsRover2 class methodsFor: 'testing' stamp: 'fmonpelat 6/27/2021 17:07:05'!
isValidBearing: aBearing
	BearingMapping := Dictionary new.
	BearingMapping add: #N->0; add: #E->90; add: #S->180; add: #O->270.
	
	^ BearingMapping includesKey: (aBearing asSymbol)! !

!MarsRover2 class methodsFor: 'testing' stamp: 'fmonpelat 6/27/2021 15:55:17'!
isValidPosition: aPosition
	^aPosition isKindOf: Point
! !

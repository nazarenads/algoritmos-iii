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


!classDefinition: #Command category: 'MarsRover'!
Object subclass: #Command
	instanceVariableNames: 'command'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!


!Command methodsFor: 'initialization' stamp: 'NDS 6/29/2021 20:12:06'!
executeFor: aCommand withBearing: aBearing andPosition: aPosition

	command := (Command allSubclasses detect:[:aClass | aClass canHandle: aCommand]) new.
	^command executeCommandWithBearing: aBearing andPosition: aPosition

! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Command class' category: 'MarsRover'!
Command class
	instanceVariableNames: ''!

!Command class methodsFor: 'instance creation' stamp: 'NDS 6/29/2021 20:06:19'!
executeFor: aCommand withBearing: aBearing andPosition: aPosition
	^self new executeFor: aCommand withBearing: aBearing andPosition: aPosition
! !


!classDefinition: #MoveBackward category: 'MarsRover'!
Command subclass: #MoveBackward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MoveBackward methodsFor: 'as yet unclassified' stamp: 'NDS 6/29/2021 19:07:31'!
executeCommandWithBearing: currentBearing andPosition: currentPosition

	 | backwardMoveHorizontal backwardMoveVertical|
	backwardMoveHorizontal := (-1@0).
	backwardMoveVertical := (0@-1).
	^(currentBearing = 90 or: [currentBearing = 270]) ifTrue: [ currentPosition  +  backwardMoveHorizontal ] ifFalse: [currentPosition + backwardMoveVertical]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MoveBackward class' category: 'MarsRover'!
MoveBackward class
	instanceVariableNames: ''!

!MoveBackward class methodsFor: 'as yet unclassified' stamp: 'NDS 6/29/2021 19:54:33'!
canHandle: aCommand
	^aCommand = $b.! !


!classDefinition: #MoveForward category: 'MarsRover'!
Command subclass: #MoveForward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MoveForward methodsFor: 'as yet unclassified' stamp: 'NDS 6/29/2021 20:10:15'!
executeCommandWithBearing: currentBearing andPosition: currentPosition

	 | forwardMoveHorizontal forwardMoveVertical |
	forwardMoveHorizontal := (1@0).
	forwardMoveVertical := (0@1).
	^(currentBearing = 90 or: [currentBearing = 270]) ifTrue: [ currentPosition  +  forwardMoveHorizontal ] ifFalse: [ currentPosition  +  forwardMoveVertical ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MoveForward class' category: 'MarsRover'!
MoveForward class
	instanceVariableNames: ''!

!MoveForward class methodsFor: 'as yet unclassified' stamp: 'NDS 6/29/2021 19:54:49'!
canHandle: aCommand
	^aCommand = $f.! !


!classDefinition: #TurnLeft category: 'MarsRover'!
Command subclass: #TurnLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TurnLeft methodsFor: 'as yet unclassified' stamp: 'NDS 6/29/2021 19:09:45'!
executeCommandWithBearing: currentBearing andPosition: currentPosition

	^(currentBearing - 90)<0 ifTrue: [currentBearing - 90 + 360] ifFalse: [currentBearing - 90]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TurnLeft class' category: 'MarsRover'!
TurnLeft class
	instanceVariableNames: ''!

!TurnLeft class methodsFor: 'as yet unclassified' stamp: 'NDS 6/29/2021 19:54:57'!
canHandle: aCommand
	^aCommand = $l.! !


!classDefinition: #TurnRight category: 'MarsRover'!
Command subclass: #TurnRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TurnRight methodsFor: 'as yet unclassified' stamp: 'NDS 6/29/2021 19:09:45'!
executeCommandWithBearing: currentBearing andPosition: currentPosition

	^(currentBearing + 90) = 360 ifTrue: [0] ifFalse: [currentBearing + 90]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TurnRight class' category: 'MarsRover'!
TurnRight class
	instanceVariableNames: ''!

!TurnRight class methodsFor: 'as yet unclassified' stamp: 'NDS 6/29/2021 19:55:04'!
canHandle: aCommand
	^aCommand = $r.! !


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


!MarsRover methodsFor: 'operation' stamp: 'NDS 6/29/2021 20:08:29'!
executeCommands: someExecuteCommands 

	someExecuteCommands do: [:aCommand | 
		Command executeFor: aCommand withBearing: currentBearing andPosition: currentPosition

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

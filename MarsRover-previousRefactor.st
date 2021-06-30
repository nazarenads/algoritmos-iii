!classDefinition: #TestMarsRover category: 'MarsRover'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 10:37:23'!
assertsThat: marsRover isInPosition: aPosition andhasOrientation: aHeading
	self assert: (marsRover isInPosition: aPosition ).
	self assert: (marsRover isInHeading: aHeading ).! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 10:37:52'!
test01RoverHasValidPositionAndBearingOnStart
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andHeading: 'N'.
	
	marsRover executeCommands: ''.
	
	self assertsThat: marsRover isInPosition: (0@0) andhasOrientation: 'N'
! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 09:56:24'!
test02RoverCannotStartWithInvalidBearing
	self should: [ MarsRover withPosition: (0@0) andHeading: '' ]
	raise: Error
	withExceptionDo: [:anException |
		self assert: anException messageText equals: MarsRover  invalidHeadingErrorMessage ]! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 10:12:28'!
test03RoverCannotStartWithInvalidPosition
	self should: [ MarsRover withPosition: '' andHeading: 'N' ]
	raise: Error
	withExceptionDo: [:anException |
		self assert: anException messageText equals: MarsRover  invalidPositionErrorMessage ]! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 10:38:12'!
test04RoverMovesForwardOnNorthDirection
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andHeading: 'N'.
	
	marsRover executeCommands: 'f'.
	
	self assertsThat: marsRover isInPosition: (0@1) andhasOrientation: 'N'
! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 10:38:31'!
test05RoverMovesForwardOnEastDirection
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andHeading: 'E'.
	
	marsRover executeCommands: 'f'.
	
	self assertsThat: marsRover isInPosition: (1@0) andhasOrientation: 'E'
! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 10:38:48'!
test06RoverMovesForwardOnSouthDirection
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andHeading: 'S'.
	
	marsRover executeCommands: 'f'.
	
	self assertsThat: marsRover isInPosition: (0@-1) andhasOrientation: 'S'
! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 10:39:15'!
test07RoverMovesForwardOnWestDirection
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andHeading: 'O'.
	
	marsRover executeCommands: 'f'.
	
	self assertsThat: marsRover isInPosition: (-1@0) andhasOrientation: 'O'
! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 10:39:33'!
test08RoverMovesBackwardOnNorthDirection
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andHeading: 'N'.
	
	marsRover executeCommands: 'b'.
	
	self assertsThat: marsRover isInPosition: (0@-1) andhasOrientation: 'N'! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 10:39:49'!
test09RoverMovesBackwardOnEastDirection
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andHeading: 'E'.
	
	marsRover executeCommands: 'b'.
	
	self assertsThat: marsRover isInPosition: (-1@0) andhasOrientation: 'E'! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 10:40:03'!
test10RoverMovesBackwardOnSouthDirection
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andHeading: 'S'.
	
	marsRover executeCommands: 'b'.
	
	self assertsThat: marsRover isInPosition: (0@1) andhasOrientation: 'S'! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 10:40:18'!
test11RoverMovesBackwardOnWestDirection
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andHeading: 'O'.
	
	marsRover executeCommands: 'b'.
	
	self assertsThat: marsRover isInPosition: (1@0) andhasOrientation: 'O'! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 10:45:14'!
test12RoverRotatesClockwiseWithRightCommandFromNorth
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andHeading: 'N'.
	
	marsRover executeCommands: 'r'.
	
	self assertsThat: marsRover isInPosition: (0@0) andhasOrientation: 'E'! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 10:45:34'!
test13RoverRotatesClockwiseWithRightCommandFromEast
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andHeading: 'E'.
	
	marsRover executeCommands: 'r'.
	
	self assertsThat: marsRover isInPosition: (0@0) andhasOrientation: 'S'! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 10:53:28'!
test14RoverRotatesClockwiseWithRightCommandFromSouth
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andHeading: 'S'.
	
	marsRover executeCommands: 'r'.
	
	self assertsThat: marsRover isInPosition: (0@0) andhasOrientation: 'O'! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 10:53:53'!
test15RoverRotatesClockwiseWithRightCommandFromWest
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andHeading: 'O'.
	
	marsRover executeCommands: 'r'.
	
	self assertsThat: marsRover isInPosition: (0@0) andhasOrientation: 'N'! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 10:57:28'!
test16RoverRotatesCounterClockwiseWithLeftCommandFromNorth
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andHeading: 'N'.
	
	marsRover executeCommands: 'l'.
	
	self assertsThat: marsRover isInPosition: (0@0) andhasOrientation: 'O'! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 10:57:49'!
test17RoverRotatesCounterClockwiseWithLeftCommandFromWest
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andHeading: 'O'.
	
	marsRover executeCommands: 'l'.
	
	self assertsThat: marsRover isInPosition: (0@0) andhasOrientation: 'S'! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 10:58:22'!
test18RoverRotatesCounterClockwiseWithLeftCommandFromSouth
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andHeading: 'S'.
	
	marsRover executeCommands: 'l'.
	
	self assertsThat: marsRover isInPosition: (0@0) andhasOrientation: 'E'! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 10:59:23'!
test19RoverRotatesCounterClockwiseWithLeftCommandFromEast
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andHeading: 'E'.
	
	marsRover executeCommands: 'l'.
	
	self assertsThat: marsRover isInPosition: (0@0) andhasOrientation: 'N'! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 11:07:02'!
test20RoverCannotExecuteInvalidCommand
	| marsRover |
	self should: 
	[
		marsRover := MarsRover withPosition: (0@0) andHeading: 'N'.
		marsRover executeCommands: 'x'.
	]
	raise: Error
	withExceptionDo: [:anException |
		self assert: anException messageText equals: (MarsRover  invalidCommandErrorMessage) ]
	
	! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'point string currentPosition currentHeading'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'fmonpelat 6/30/2021 09:46:48'!
initializeWithPosition: aPosition andHeading: aHeading 
	currentPosition := aPosition .
	currentHeading := aHeading .! !


!MarsRover methodsFor: 'accessing' stamp: 'fmonpelat 6/30/2021 11:14:19'!
executeCommands: someExecuteCommands 
	
	
	someExecuteCommands do: [:aCommand | 
		( aCommand = $f ) ifTrue: [ 
			(currentHeading = 'N') ifTrue: [ ^currentPosition := currentPosition + (0@1)] .
			(currentHeading = 'E') ifTrue: [ ^currentPosition := currentPosition + (1@0)] .
			(currentHeading = 'S') ifTrue: [ ^currentPosition := currentPosition + (0@-1)] .
			(currentHeading = 'O') ifTrue: [ ^currentPosition := currentPosition + (-1@0)] .
		].
		( aCommand = $b ) ifTrue: [ 
			(currentHeading = 'N') ifTrue: [ ^currentPosition := currentPosition + (0@-1)] .
			(currentHeading = 'E') ifTrue: [ ^currentPosition := currentPosition + (-1@0)] .
			(currentHeading = 'S') ifTrue: [ ^currentPosition := currentPosition + (0@1)] .
			(currentHeading = 'O') ifTrue: [ ^currentPosition := currentPosition + (1@0)] .
		].
		( aCommand = $r ) ifTrue: [ 
			(currentHeading = 'N') ifTrue: [ ^currentHeading := 'E' ] .
			(currentHeading = 'E') ifTrue: [ ^currentHeading := 'S' ] .
			(currentHeading = 'S') ifTrue: [ ^currentHeading := 'O' ] .
			(currentHeading = 'O') ifTrue: [ ^currentHeading := 'N' ] .
		].
		( aCommand = $l ) ifTrue: [ 
			(currentHeading = 'N') ifTrue: [ ^currentHeading := 'O' ] .
			(currentHeading = 'O') ifTrue: [ ^currentHeading := 'S' ] .
			(currentHeading = 'S') ifTrue: [ ^currentHeading := 'E' ] .
			(currentHeading = 'E') ifTrue: [ ^currentHeading := 'N' ] .
		].
		"there was no matching of a valid command "
		self error: MarsRover invalidCommandErrorMessage
	].
	! !


!MarsRover methodsFor: 'evaluating' stamp: 'fmonpelat 6/30/2021 09:49:30'!
isInHeading: aHeading
	^ currentHeading = aHeading.
	! !

!MarsRover methodsFor: 'evaluating' stamp: 'fmonpelat 6/30/2021 09:48:56'!
isInPosition: aPosition
	^ currentPosition = aPosition.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'fmonpelat 6/30/2021 10:13:52'!
withPosition: aInitialPosition andHeading: aInitialHeading
	
	(self isValidHeading: aInitialHeading) ifFalse: [ ^self error: self invalidHeadingErrorMessage ].
	(self isValidPosition: aInitialPosition) ifFalse: [ ^self error: self invalidPositionErrorMessage ].

	^self new initializeWithPosition: aInitialPosition andHeading: aInitialHeading ! !


!MarsRover class methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 10:10:05'!
isValidHeading: aHeading
	| validHeading |
	validHeading := Array with: 'N' with: 'E' with: 'S' with: 'O'.
	^ validHeading includes: aHeading.		! !

!MarsRover class methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 10:13:25'!
isValidPosition: aPosition
	^ aPosition isKindOf: Point.
	! !


!MarsRover class methodsFor: 'error-messages' stamp: 'fmonpelat 6/30/2021 11:03:26'!
invalidCommandErrorMessage
	^'Invalid Command'! !

!MarsRover class methodsFor: 'error-messages' stamp: 'fmonpelat 6/30/2021 09:56:10'!
invalidHeadingErrorMessage
	^'Invalid Heading'! !

!MarsRover class methodsFor: 'error-messages' stamp: 'fmonpelat 6/30/2021 10:14:07'!
invalidPositionErrorMessage
	^'Invalid Position'! !

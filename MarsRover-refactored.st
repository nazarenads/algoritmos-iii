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

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 18:33:39'!
test01RoverHasValidPositionAndHeadingOnStart
	| marsRover |
	marsRover := MarsRover withPosition: (0@0) andHeading: 'N'.
	
	marsRover executeCommands: ''.
	
	self assertsThat: marsRover isInPosition: (0@0) andhasOrientation: 'N'
! !

!TestMarsRover methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 18:33:16'!
test02RoverCannotStartWithInvalidHeading
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


!classDefinition: #Command category: 'MarsRover'!
Object subclass: #Command
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Command methodsFor: 'initialization' stamp: 'fmonpelat 6/30/2021 19:17:04'!
executeFor: aCommand withRover: aRover
	
	(Command allSubclasses detect:[:aClass | aClass canHandle: aCommand] ifNone: [ InvalidCommand ]) new executeFor: aRover.

! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Command class' category: 'MarsRover'!
Command class
	instanceVariableNames: ''!

!Command class methodsFor: 'instance creation' stamp: 'fmonpelat 6/30/2021 18:54:27'!
executeFor: aCommand withRover: aRover
	^self new executeFor: aCommand withRover: aRover
! !


!classDefinition: #InvalidCommand category: 'MarsRover'!
Command subclass: #InvalidCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!InvalidCommand methodsFor: 'operation' stamp: 'fmonpelat 6/30/2021 19:10:02'!
executeFor: aRover
	aRover invalidCommand.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvalidCommand class' category: 'MarsRover'!
InvalidCommand class
	instanceVariableNames: ''!

!InvalidCommand class methodsFor: 'testing' stamp: 'fmonpelat 6/30/2021 19:16:24'!
canHandle: aCommand
	^false! !


!classDefinition: #MoveBackward category: 'MarsRover'!
Command subclass: #MoveBackward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MoveBackward methodsFor: 'operation' stamp: 'fmonpelat 6/30/2021 19:07:28'!
executeFor: aRover
	aRover moveBackward.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MoveBackward class' category: 'MarsRover'!
MoveBackward class
	instanceVariableNames: ''!

!MoveBackward class methodsFor: 'testing' stamp: 'NDS 6/29/2021 19:54:33'!
canHandle: aCommand
	^aCommand = $b.! !


!classDefinition: #MoveForward category: 'MarsRover'!
Command subclass: #MoveForward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MoveForward methodsFor: 'operation' stamp: 'fmonpelat 6/30/2021 19:07:42'!
executeFor: aRover
	aRover  moveForward.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MoveForward class' category: 'MarsRover'!
MoveForward class
	instanceVariableNames: ''!

!MoveForward class methodsFor: 'testing' stamp: 'NDS 6/29/2021 19:54:49'!
canHandle: aCommand
	^aCommand = $f.! !


!classDefinition: #TurnLeft category: 'MarsRover'!
Command subclass: #TurnLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TurnLeft methodsFor: 'operation' stamp: 'fmonpelat 6/30/2021 19:07:50'!
executeFor: aRover
	aRover turnLeft.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TurnLeft class' category: 'MarsRover'!
TurnLeft class
	instanceVariableNames: ''!

!TurnLeft class methodsFor: 'testing' stamp: 'NDS 6/29/2021 19:54:57'!
canHandle: aCommand
	^aCommand = $l.! !


!classDefinition: #TurnRight category: 'MarsRover'!
Command subclass: #TurnRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TurnRight methodsFor: 'operation' stamp: 'fmonpelat 6/30/2021 19:07:59'!
executeFor: aRover
	aRover turnRight.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TurnRight class' category: 'MarsRover'!
TurnRight class
	instanceVariableNames: ''!

!TurnRight class methodsFor: 'testing' stamp: 'NDS 6/29/2021 19:55:04'!
canHandle: aCommand
	^aCommand = $r.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'point string currentPosition currentHeading'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'fmonpelat 6/30/2021 19:59:07'!
initializeWithPosition: aPosition andHeading: aHeading 
	currentPosition := aPosition .
	currentHeading := Orientation initializeWith: aHeading for: self.! !


!MarsRover methodsFor: 'accessing' stamp: 'fmonpelat 6/30/2021 19:10:29'!
executeCommands: someExecuteCommands 
	
	someExecuteCommands do: [:aCommand | ^Command executeFor: aCommand withRover: self ].
	! !


!MarsRover methodsFor: 'evaluating' stamp: 'fmonpelat 6/30/2021 19:58:16'!
isInHeading: aHeading
	^ (currentHeading heading) = aHeading.
	! !

!MarsRover methodsFor: 'evaluating' stamp: 'fmonpelat 6/30/2021 09:48:56'!
isInPosition: aPosition
	^ currentPosition = aPosition.! !


!MarsRover methodsFor: 'private' stamp: 'fmonpelat 6/30/2021 20:06:27'!
headTo: aOrientation
	currentHeading := aOrientation.! !

!MarsRover methodsFor: 'private' stamp: 'fmonpelat 6/30/2021 19:09:51'!
invalidCommand
	^self error: MarsRover invalidCommandErrorMessage! !

!MarsRover methodsFor: 'private' stamp: 'fmonpelat 6/30/2021 19:59:51'!
moveBackward
	((currentHeading heading) = 'N') ifTrue: [ ^currentPosition := currentPosition + (0@-1)] .
	((currentHeading heading) = 'E') ifTrue: [ ^currentPosition := currentPosition + (-1@0)] .
	((currentHeading heading) = 'S') ifTrue: [ ^currentPosition := currentPosition + (0@1)] .
	((currentHeading heading) = 'O') ifTrue: [ ^currentPosition := currentPosition + (1@0)] ! !

!MarsRover methodsFor: 'private' stamp: 'fmonpelat 6/30/2021 19:59:59'!
moveForward
	((currentHeading heading) = 'N') ifTrue: [ ^currentPosition := currentPosition + (0@1)] .
	((currentHeading heading) = 'E') ifTrue: [ ^currentPosition := currentPosition + (1@0)] .
	((currentHeading heading) = 'S') ifTrue: [ ^currentPosition := currentPosition + (0@-1)] .
	((currentHeading heading) = 'O') ifTrue: [ ^currentPosition := currentPosition + (-1@0)] .! !

!MarsRover methodsFor: 'private' stamp: 'fmonpelat 6/30/2021 20:04:48'!
turnLeft
	currentHeading turnLeft.! !

!MarsRover methodsFor: 'private' stamp: 'fmonpelat 6/30/2021 20:04:55'!
turnRight
	currentHeading turnRight.
! !

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


!classDefinition: #Orientation category: 'MarsRover'!
Object subclass: #Orientation
	instanceVariableNames: 'rover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Orientation methodsFor: 'initialization' stamp: 'fmonpelat 6/30/2021 20:21:41'!
for: aRover
	rover := aRover.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Orientation class' category: 'MarsRover'!
Orientation class
	instanceVariableNames: 'rover'!

!Orientation class methodsFor: 'as yet unclassified' stamp: 'fmonpelat 6/30/2021 20:36:36'!
initializeWith: aInitialOrientation for: aRover
	
	^(Orientation allSubclasses detect:[:aClass | aClass heading = aInitialOrientation] ifNone: [ aRover class invalidHeadingErrorMessage ]) new for: aRover. ! !


!classDefinition: #EastOrientation category: 'MarsRover'!
Orientation subclass: #EastOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!EastOrientation methodsFor: 'operation' stamp: 'fmonpelat 6/30/2021 20:24:12'!
heading
	^'E'! !

!EastOrientation methodsFor: 'operation' stamp: 'fmonpelat 6/30/2021 20:20:01'!
turnLeft
	rover headTo: (NorthOrientation new for: rover).! !

!EastOrientation methodsFor: 'operation' stamp: 'fmonpelat 6/30/2021 20:20:01'!
turnRight
	rover headTo: (SouthOrientation new for: rover).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EastOrientation class' category: 'MarsRover'!
EastOrientation class
	instanceVariableNames: ''!

!EastOrientation class methodsFor: 'as yet unclassified' stamp: 'fmonpelat 6/30/2021 19:38:29'!
heading
	^'E'! !


!classDefinition: #NorthOrientation category: 'MarsRover'!
Orientation subclass: #NorthOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!NorthOrientation methodsFor: 'orientation' stamp: 'fmonpelat 6/30/2021 20:24:18'!
heading
	^'N'! !

!NorthOrientation methodsFor: 'orientation' stamp: 'fmonpelat 6/30/2021 20:20:01'!
turnLeft
	rover headTo: (WestOrientation new for: rover).! !

!NorthOrientation methodsFor: 'orientation' stamp: 'fmonpelat 6/30/2021 20:20:01'!
turnRight
	rover headTo: (EastOrientation new for: rover).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NorthOrientation class' category: 'MarsRover'!
NorthOrientation class
	instanceVariableNames: ''!

!NorthOrientation class methodsFor: 'as yet unclassified' stamp: 'fmonpelat 6/30/2021 19:38:40'!
heading
	^'N'! !


!classDefinition: #SouthOrientation category: 'MarsRover'!
Orientation subclass: #SouthOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!SouthOrientation methodsFor: 'orientation' stamp: 'fmonpelat 6/30/2021 20:24:24'!
heading
	^'S'! !

!SouthOrientation methodsFor: 'orientation' stamp: 'fmonpelat 6/30/2021 20:20:01'!
turnLeft
	rover headTo: (EastOrientation new for: rover).! !

!SouthOrientation methodsFor: 'orientation' stamp: 'fmonpelat 6/30/2021 20:20:01'!
turnRight
	rover headTo: (WestOrientation new for: rover).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SouthOrientation class' category: 'MarsRover'!
SouthOrientation class
	instanceVariableNames: ''!

!SouthOrientation class methodsFor: 'as yet unclassified' stamp: 'fmonpelat 6/30/2021 19:38:46'!
heading
	^'S'! !


!classDefinition: #WestOrientation category: 'MarsRover'!
Orientation subclass: #WestOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!WestOrientation methodsFor: 'orientation' stamp: 'fmonpelat 6/30/2021 20:24:32'!
heading
	^'O'! !

!WestOrientation methodsFor: 'orientation' stamp: 'fmonpelat 6/30/2021 20:20:01'!
turnLeft
	rover headTo: (SouthOrientation new for: rover).! !

!WestOrientation methodsFor: 'orientation' stamp: 'fmonpelat 6/30/2021 20:20:01'!
turnRight
	rover headTo: (NorthOrientation new for: rover).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WestOrientation class' category: 'MarsRover'!
WestOrientation class
	instanceVariableNames: ''!

!WestOrientation class methodsFor: 'as yet unclassified' stamp: 'fmonpelat 6/30/2021 20:10:55'!
heading
	^'O'! !

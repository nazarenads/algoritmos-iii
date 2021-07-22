!classDefinition: #TestMarsRover category: 'MarsRover-Solucion'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:42:57'!
test01MarsRoverDoestNotMoveWhenNoCommandsAreSent

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: '' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:05'!
test02RoverFacingNorthCanMoveForward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'f' endsAt: 0@1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:13'!
test03RoverFacingNorthCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'b' endsAt: 0@-1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:24'!
test04RoverFacingNorthHeadsEastAfterTurningRight

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'r' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:55'!
test05RoverFacingNorthHeadsWestAfterTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'l' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:26'!
test06RoverFacingEastHeadsSouthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'r' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:43'!
test07RoverFacingSouthHeadsWestWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'r' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:00'!
test08RoverFacingWestHeadsNorthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'r' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:20'!
test09RoverFacingEastHeadsNorthWhenTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'l' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:52'!
test10RoverFacingSouthHeadsEastWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'l' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:46:17'!
test11RoverFacingWestHeadsSouthWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'l' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:36'!
test12RoverFacingEastCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'f' endsAt: 1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:55'!
test13RoverFacingEastCanMoveBackwards

	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'b' endsAt: -1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:20'!
test14RoverFacingSouthCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'f' endsAt: 0@-1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:38'!
test15RoverFacingSouthCanMoveBackward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'b' endsAt: 0@1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:10'!
test16RoverFacingWestCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'f' endsAt: -1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:46'!
test17RoverFacingWestCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'b' endsAt: 1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:50:56'!
test18RoverCanProcessMultipleCommands

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'ff' endsAt: 0@2 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 6/30/2021 16:05:43'!
test19RoverStopsWhenProcessingAnInvalidCommand

	| marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	
	self should: [ marsRover processCommands: 'fxf' ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: marsRover invalidCommandErrorMessage.
			self assert: (marsRover isAt: 0@1 heading: #North).
		].
	
	! !


!TestMarsRover methodsFor: 'assertions' stamp: 'LL 7/1/2021 00:42:36'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands endsAt: aFinalPosition heading: aFinalCardinalPoint

	| marsRover |
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	marsRover processCommands: aStringOfCommands.
	
	self assert: (marsRover isAt: aFinalPosition heading: aFinalCardinalPoint)! !


!classDefinition: #TestMarsRoverLog category: 'MarsRover-Solucion'!
TestCase subclass: #TestMarsRoverLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRoverLog methodsFor: 'testing' stamp: 'fmonpelat 7/21/2021 19:50:12'!
test01LogIsEmptyWhenNoCommandsAreGiven
	| marsRover log |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog new.
	marsRover addPositionLog: log.
	
	marsRover processCommands: ''.
	
	self assert: 0 equals: log size.
	self assert: '' equals: log first.! !

!TestMarsRoverLog methodsFor: 'testing' stamp: 'fmonpelat 7/21/2021 19:50:18'!
test02LogPositionWhenMovingForwardsFromNorth
	| marsRover log |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog new.
	marsRover addPositionLog: log.
	
	marsRover processCommands: 'f'.
	
	self assert: 1 equals: log size.
	self assert: '0@1' equals: log first.! !

!TestMarsRoverLog methodsFor: 'testing' stamp: 'fmonpelat 7/21/2021 19:50:36'!
test03LogPositionWhenMovingBackwardsFromNorth
	| marsRover log |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog new.
	marsRover addPositionLog: log.
	
	marsRover processCommands: 'b'.
	
	self assert: 1 equals: log size.
	self assert: '0@-1' equals: log first.! !

!TestMarsRoverLog methodsFor: 'testing' stamp: 'fmonpelat 7/21/2021 19:50:40'!
test04LogPositionWhenMovingForwardFromWest
	| marsRover log |
	marsRover := MarsRover startingAt: 0@0 heading: #West.
	log := MarsRoverLog new.
	marsRover addPositionLog: log.
	
	marsRover processCommands: 'f'.
	
	self assert: 1 equals: log size.
	self assert: '-1@0' equals: log first.! !

!TestMarsRoverLog methodsFor: 'testing' stamp: 'fmonpelat 7/21/2021 19:50:43'!
test05LogPositionWhenMovingBackwardsFromWest
	| marsRover log |
	marsRover := MarsRover startingAt: 0@0 heading: #West.
	log := MarsRoverLog new.
	marsRover addPositionLog: log.
	
	marsRover processCommands: 'b'.
	
	self assert: 1 equals: log size.
	self assert: '1@0' equals: log first.! !

!TestMarsRoverLog methodsFor: 'testing' stamp: 'fmonpelat 7/21/2021 19:50:46'!
test06LogHeadingWhenRotatingEast
	| marsRover log |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog new.
	marsRover addHeadingLog: log.
	
	marsRover processCommands: 'r'.
	
	self assert: 1 equals: log size.
	self assert: 'East' equals: log first.! !

!TestMarsRoverLog methodsFor: 'testing' stamp: 'fmonpelat 7/21/2021 19:50:49'!
test07LogHeadingWhenRotatingSouth
	| marsRover log |
	marsRover := MarsRover startingAt: 0@0 heading: #East.
	log := MarsRoverLog new.
	marsRover addHeadingLog: log.
	
	marsRover processCommands: 'r'.
	
	self assert: 1 equals: log size.
	self assert: 'South' equals: log first.! !

!TestMarsRoverLog methodsFor: 'testing' stamp: 'fmonpelat 7/21/2021 19:50:53'!
test08LogHeadingWhenRotatingWest
	| marsRover log |
	marsRover := MarsRover startingAt: 0@0 heading: #South.
	log := MarsRoverLog new.
	marsRover addHeadingLog: log.
	
	marsRover processCommands: 'r'.
	
	self assert: 1 equals: log size.
	self assert: 'West' equals: log first.! !

!TestMarsRoverLog methodsFor: 'testing' stamp: 'fmonpelat 7/21/2021 19:50:57'!
test09LogHeadingWhenRotatingNorth
	| marsRover log |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog new.
	marsRover addHeadingLog: log.
	marsRover addPositionLog: log.
	
	marsRover processCommands: 'rf'.
	
	self assert: 2 equals: log size.
	self assert: 'East' equals: log first.
	self assert: '1@0' equals: log obtain second.! !


!classDefinition: #TestMarsRoverWindow category: 'MarsRover-Solucion'!
TestCase subclass: #TestMarsRoverWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'NDS 7/21/2021 20:23:57'!
test01MarsRoverWindowShowsPositionAfterMovingForward
	| marsRover window |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	window := MarsRoverWindow new.
	marsRover addWindowForPosition: window.
	
	marsRover processCommands: 'f'.
	
	self assert: '0@1' equals: window positionText.! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'NDS 7/21/2021 20:25:01'!
test02MarsRoverWindowShowsPositionAfterMovingBackwards
	| marsRover window |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	window := MarsRoverWindow new.
	marsRover addWindowForPosition: window.
	
	marsRover processCommands: 'b'.
	
	self assert: '0@-1' equals: window positionText.! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'NDS 7/21/2021 20:27:29'!
test03MarsRoverWindowShowsHeadingAfterRotatingRight
	| marsRover window |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	window := MarsRoverWindow new.
	marsRover addWindowForHeading: window.
	
	marsRover processCommands: 'r'.
	
	self assert: 'East' equals: window headingText.! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'NDS 7/21/2021 20:57:38'!
test04MarsRoverWindowShowsHeadingAfterRotatingLeft
	| marsRover window |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	window := MarsRoverWindow new.
	marsRover addWindowForHeading: window.
	
	marsRover processCommands: 'l'.
	
	self assert: 'West' equals: window headingText.! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'NDS 7/21/2021 21:01:34'!
test05MarsRoverWindowShowsHeadingAndPositionAfterMovingAndRotating
	| marsRover window |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	window := MarsRoverWindow new.
	marsRover addWindowForHeading: window.
	marsRover addWindowForPosition: window.
	
	marsRover processCommands: 'fl'.
	
	self assert: '0@1' equals: window positionText.
	self assert: 'West' equals: window headingText.
	! !


!classDefinition: #MarsRover category: 'MarsRover-Solucion'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head log logHeading logPosition positionWindow headingWindow'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRover methodsFor: 'initialization' stamp: 'LL 6/30/2021 19:47:14'!
initializeStartingAt: aPosition heading: aCardinalPoint 
	
	position := aPosition.
	head := MarsRoverHead of: self facing: aCardinalPoint.
	! !


!MarsRover methodsFor: 'process commands' stamp: 'LL 6/30/2021 15:54:14'!
processCommands: aStringWithCommands

	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand.
	].
	
! !


!MarsRover methodsFor: 'testing' stamp: 'LL 6/30/2021 19:47:14'!
isAt: aPosition heading: aCardinalPoint

	^ position = aPosition and: [ head isHeading: aCardinalPoint ]! !


!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:54:11'!
assertCommandIsValid: aCommand

	^ (self isInvalidCommand: aCommand) ifTrue: [ self error: self invalidCommandErrorMessage ]! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:48:06'!
invalidCommandErrorMessage

	^'Invalid command'! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 19:48:47'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ head movingForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ head movingBackwards ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ head rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ head rotateLeft ].
! !


!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:42'!
isBackwardCommand: command

	^ command = $b! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:27'!
isForwardCommand: command

	^ command = $f! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:51:21'!
isInvalidCommand: aCommand
	^(self isForwardCommand: aCommand) not and: 
		[ (self isBackwardCommand: aCommand) not and: 
			[ (self isRotateRightCommand: aCommand) not and: 
				[ (self isRotateLeftCommand: aCommand) not ] ] ]! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:50:53'!
isRotateLeftCommand: command

	^ command = $l! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:27:33'!
isRotateRightCommand: command

	^ command = $r! !


!MarsRover methodsFor: 'dd - moving' stamp: 'fmonpelat 7/21/2021 19:02:59'!
moveDown

	self updatePosition: (0@-1).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'fmonpelat 7/21/2021 19:03:08'!
moveLeft

	self updatePosition: (-1@0).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'fmonpelat 7/21/2021 19:03:17'!
moveRight

	self updatePosition: (1@0).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'fmonpelat 7/21/2021 19:03:24'!
moveUp

	self updatePosition: (0@1).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'fmonpelat 7/21/2021 19:10:47'!
updatePosition: aNewDeltaPosition
	position := position + aNewDeltaPosition.
	self logPositionChange.! !


!MarsRover methodsFor: 'dd - heading' stamp: 'fmonpelat 7/21/2021 19:21:36'!
headEast

	self updateHead: ( MarsRoverHeadFacingEast of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'fmonpelat 7/21/2021 19:21:49'!
headNorth

	self updateHead: (MarsRoverHeadFacingNorth of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'fmonpelat 7/21/2021 19:21:59'!
headSouth

	self updateHead: (MarsRoverHeadFacingSouth of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'fmonpelat 7/21/2021 19:22:10'!
headWest

	self updateHead: (MarsRoverHeadFacingWest of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'fmonpelat 7/21/2021 19:32:14'!
updateHead: newHeadValue
	head := newHeadValue.
	self logHeadingChange.
	
	! !


!MarsRover methodsFor: 'reporting' stamp: 'fmonpelat 7/21/2021 19:41:09'!
addHeadingLog: aMarsRoverLog 
	logHeading := aMarsRoverLog! !

!MarsRover methodsFor: 'reporting' stamp: 'fmonpelat 7/21/2021 19:41:27'!
addPositionLog: aMarsRoverLog 
	logPosition := aMarsRoverLog! !

!MarsRover methodsFor: 'reporting' stamp: 'NDS 7/21/2021 20:29:31'!
addWindowForHeading: aMarsRoverWindow 
	headingWindow := aMarsRoverWindow! !

!MarsRover methodsFor: 'reporting' stamp: 'NDS 7/21/2021 20:19:28'!
addWindowForPosition: aMarsRoverWindow 
	positionWindow := aMarsRoverWindow! !

!MarsRover methodsFor: 'reporting' stamp: 'NDS 7/21/2021 20:30:12'!
logHeadingChange
	logHeading ifNotNil: [ logHeading changeInHeading: head ].
	headingWindow ifNotNil: [ headingWindow updateHeadingTextWith: head].! !

!MarsRover methodsFor: 'reporting' stamp: 'NDS 7/21/2021 20:18:45'!
logPositionChange
	logPosition ifNotNil: [ logPosition changeInPosition: (position asString) ].
	positionWindow ifNotNil: [ positionWindow updatePositionTextWith: position].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Solucion'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 13:30:13'!
startingAt: aPoint heading: aCardinalPoint 
	
	^self new initializeStartingAt: aPoint heading: aCardinalPoint ! !


!classDefinition: #MarsRoverHead category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverHead
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:17:57'!
initializeOf: aMarsRover

	marsRover := aMarsRover! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
isHeading: aCardinalPoint

	^self class whenFacing: aCardinalPoint

	! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:46'!
rotateLeft

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:43'!
rotateRight

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHead class' category: 'MarsRover-Solucion'!
MarsRoverHead class
	instanceVariableNames: ''!

!MarsRoverHead class methodsFor: 'testing' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	self subclassResponsibility.! !


!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 16:16:27'!
of: aMarsRover

	^self new initializeOf: aMarsRover! !

!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 19:46:37'!
of: aMarsRover facing: aCardinalPoint
	
	| headingSubclass |
	headingSubclass := self subclasses detect: [ :aHeadingSubclass | aHeadingSubclass whenFacing: aCardinalPoint ].
	
	^headingSubclass of: aMarsRover.! !


!classDefinition: #MarsRoverHeadFacingEast category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveLeft.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveRight.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:22'!
rotateLeft

	^marsRover headNorth.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:14'!
rotateRight

	^marsRover headSouth.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingEast class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingEast class
	instanceVariableNames: ''!

!MarsRoverHeadFacingEast class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #East! !


!classDefinition: #MarsRoverHeadFacingNorth category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveDown.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveUp.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:33'!
rotateLeft

	^marsRover headWest.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:58'!
rotateRight

	^marsRover headEast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingNorth class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingNorth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #North! !


!classDefinition: #MarsRoverHeadFacingSouth category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveUp.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveDown! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:43'!
rotateLeft

	^marsRover headEast.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:30'!
rotateRight

	^marsRover headWest.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingSouth class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingSouth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #South! !


!classDefinition: #MarsRoverHeadFacingWest category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveRight.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveLeft.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:52'!
rotateLeft

	^marsRover headSouth.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:44'!
rotateRight

	^marsRover headNorth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingWest class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingWest class
	instanceVariableNames: ''!

!MarsRoverHeadFacingWest class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #West! !


!classDefinition: #MarsRoverLog category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverLog
	instanceVariableNames: 'log entries'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverLog methodsFor: 'initilization' stamp: 'fmonpelat 7/21/2021 18:55:29'!
first
	log size = 0 ifFalse: [ ^log first ] ifTrue: [ ^'' ].
	! !

!MarsRoverLog methodsFor: 'initilization' stamp: 'fmonpelat 7/21/2021 18:52:10'!
initialize
	log := OrderedCollection new.! !

!MarsRoverLog methodsFor: 'initilization' stamp: 'fmonpelat 7/21/2021 18:52:40'!
size
	^log size.! !


!MarsRoverLog methodsFor: 'operations' stamp: 'fmonpelat 7/21/2021 19:43:07'!
changeInHeading: aHeadChange
	
	(aHeadChange isKindOf: MarsRoverHeadFacingNorth ) ifTrue: [ log add: 'North' ].
	(aHeadChange isKindOf: MarsRoverHeadFacingEast ) ifTrue: [ log add: 'East' ].
	(aHeadChange isKindOf: MarsRoverHeadFacingSouth ) ifTrue: [ log add: 'South' ].
	(aHeadChange isKindOf: MarsRoverHeadFacingWest ) ifTrue: [ log add: 'West' ].
	! !

!MarsRoverLog methodsFor: 'operations' stamp: 'fmonpelat 7/21/2021 19:00:16'!
changeInPosition: aPositionChange
	log add: aPositionChange.! !


!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'fmonpelat 7/21/2021 19:48:25'!
obtain
	^log! !


!classDefinition: #MarsRoverWindow category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverWindow
	instanceVariableNames: 'positionText headingText'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'NDS 7/21/2021 20:31:11'!
headingText
	^headingText! !

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'NDS 7/21/2021 20:22:51'!
positionText
	^positionText! !

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'NDS 7/21/2021 20:39:43'!
updateHeadingTextWith: aHeading
	(aHeading isKindOf: MarsRoverHeadFacingNorth ) ifTrue: [ headingText := 'North' ].
	(aHeading isKindOf: MarsRoverHeadFacingEast ) ifTrue: [ headingText := 'East' ].
	(aHeading isKindOf: MarsRoverHeadFacingSouth ) ifTrue: [ headingText := 'South' ].
	(aHeading isKindOf: MarsRoverHeadFacingWest ) ifTrue: [ headingText := 'West' ].! !

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'NDS 7/21/2021 20:23:18'!
updatePositionTextWith: aPosition
	positionText := aPosition asString.! !

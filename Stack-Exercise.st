!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'fmonpelat 6/10/2021 10:40:17'!
test01SentenceFinderFindWithEmptyStack

	self
	should: [ SentenceFinderByPrefix with: '' ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError |
		self assert: anError messageText = SentenceFinderByPrefix SentenceFinderByPrefixErrorNotExpectedInstance ]
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'fmonpelat 6/10/2021 12:35:56'!
test02SentenceFinderCanNotFindWhenThereAreNoObjectsInTheStack

	| stack finder ocurrences|
	stack := OOStack new.
	
	finder := SentenceFinderByPrefix with: stack.
	
	ocurrences := finder find: '1'.
	! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'data'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'fmonpelat 6/8/2021 18:56:56'!
isEmpty
	^self size = 0.! !


!OOStack methodsFor: 'stack-operations' stamp: 'fmonpelat 6/9/2021 18:11:14'!
pop
	| topInstance content |
	topInstance := data last.
	content := topInstance content.
	
	data remove: topInstance.
	^content! !

!OOStack methodsFor: 'stack-operations' stamp: 'fmonpelat 6/8/2021 18:22:33'!
push: anElement
	| ElementToInsert |
	ElementToInsert := Element with: anElement.
	data addLast: ElementToInsert.! !

!OOStack methodsFor: 'stack-operations' stamp: 'fmonpelat 6/8/2021 18:53:12'!
size 
	^data size - 1.! !

!OOStack methodsFor: 'stack-operations' stamp: 'fmonpelat 6/9/2021 18:10:56'!
top
	| instance |
	instance := data last.
	^instance content.
! !


!OOStack methodsFor: 'initialization' stamp: 'fmonpelat 6/9/2021 17:30:54'!
initialize
	| baseOfData |
	baseOfData := BaseElement new.
	data := OrderedCollection new.
	data addLast: baseOfData.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'originalStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'fmonpelat 6/10/2021 12:34:26'!
find: aPrefix
	
	| stackAux value collection stackSize|
	(originalStack isEmpty) ifTrue: [^''].
	
	collection := OrderedCollection new.
	stackAux := OOStack new.
	stackSize := originalStack size.
	
	"loop to find aPrefix on stack values"
	self loop: [
		value := originalStack pop.
		('*',aPrefix,'*' match: value) ifTrue: [ collection addLast: value ].
		stackAux push: value.
	] endSize: stackSize.

	"returning original stack as it was"
	self loop: [
		value := stackAux pop.
		originalStack push: value.
	] endSize: stackSize.
	^collection.

	! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'fmonpelat 6/10/2021 12:33:10'!
loop: aBlock endSize: size
	1 to: size by: 1 do: [ :index | aBlock value ].! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'fmonpelat 6/10/2021 10:36:56'!
initializeWith: aOOStack
	originalStack := aOOStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: 'originalStack'!

!SentenceFinderByPrefix class methodsFor: 'error-descriptions' stamp: 'fmonpelat 6/10/2021 10:25:02'!
SentenceFinderByPrefixErrorNotExpectedInstance
	^'Should be initialized with an OOStack instance'! !


!SentenceFinderByPrefix class methodsFor: 'class initialization' stamp: 'fmonpelat 6/10/2021 10:38:13'!
with: aOOStack 
	
	(aOOStack isKindOf: OOStack) ifFalse: [  self error: SentenceFinderByPrefix SentenceFinderByPrefixErrorNotExpectedInstance ].
	
	^self new initializeWith: aOOStack! !


!classDefinition: #StackElement category: 'Stack-Exercise'!
Object subclass: #StackElement
	instanceVariableNames: 'element'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElement methodsFor: 'as yet unclassified' stamp: 'fmonpelat 6/9/2021 17:29:21'!
content
	self subclassResponsibility.! !


!classDefinition: #BaseElement category: 'Stack-Exercise'!
StackElement subclass: #BaseElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!BaseElement methodsFor: 'as yet unclassified' stamp: 'fmonpelat 6/9/2021 17:29:40'!
content
	self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #Element category: 'Stack-Exercise'!
StackElement subclass: #Element
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Element methodsFor: 'as yet unclassified' stamp: 'fmonpelat 6/9/2021 17:29:52'!
content
	^element! !

!Element methodsFor: 'as yet unclassified' stamp: 'fmonpelat 6/8/2021 18:10:43'!
initializeWith: anElement
	element := anElement.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Element class' category: 'Stack-Exercise'!
Element class
	instanceVariableNames: ''!

!Element class methodsFor: 'as yet unclassified' stamp: 'fmonpelat 6/8/2021 18:20:46'!
with: anElement
	^self new initializeWith: anElement! !

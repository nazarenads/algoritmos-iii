!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'NDS 5/16/2021 14:48:49'!
action: action runningMillisecondsThreshold: time
	|millisecondsBeforeRunning millisecondsAfterRunning |	
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	action.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (time * millisecond)! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NDS 5/16/2021 15:00:20'!
addCustomer: name
	| customerBook |
			
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: name.
	^customerBook.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NDS 5/16/2021 15:43:25'!
canNotSuspend: name customerBook: customerBook includedName: includedName

	[ customerBook suspendCustomerNamed: name.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: includedName) ]
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NDS 5/16/2021 15:34:40'!
customerBook: customerBook expectedActiveCustomers: 	activeCustomers expectedSuspendedCustomers: suspendedCustomers numberOfCustomers: customers 

	self assert: activeCustomers equals: customerBook numberOfActiveCustomers.
	self assert: suspendedCustomers equals: customerBook numberOfSuspendedCustomers.
	self assert: customers equals: customerBook numberOfCustomers.
 ! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NDS 5/16/2021 14:53:26'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook customerName runningThreshold|
	
	customerBook := CustomerBook new.
	customerName := 'John Lennon'.
	runningThreshold := 50.
	
	self action:  [:name | customerBook addCustomerNamed: customerName] runningMillisecondsThreshold: runningThreshold

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NDS 5/16/2021 15:01:35'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney runningThreshold|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self addCustomer: paulMcCartney.
	runningThreshold := 100.
	  
	self action:  [:name | customerBook addCustomerNamed: paulMcCartney] runningMillisecondsThreshold: runningThreshold 
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/9/2012 18:12'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NDS 5/16/2021 15:02:25'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self addCustomer: johnLennon.
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NDS 5/16/2021 15:35:54'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self addCustomer: paulMcCartney.
	
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self customerBook: customerBook expectedActiveCustomers: 	0 expectedSuspendedCustomers: 1 numberOfCustomers: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NDS 5/16/2021 15:36:46'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self addCustomer: paulMcCartney.

	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
		
	self customerBook: customerBook expectedActiveCustomers: 	0 expectedSuspendedCustomers: 0 numberOfCustomers: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NDS 5/16/2021 15:43:49'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon ringoStarr|
			
	johnLennon := 'John Lennon'.
	customerBook := self addCustomer: johnLennon.
	ringoStarr := 'Ringo Starr'.

	self canNotSuspend: ringoStarr customerBook: customerBook includedName: johnLennon.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NDS 5/16/2021 15:44:12'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self addCustomer: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self canNotSuspend: johnLennon customerBook: customerBook includedName: johnLennon.
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
removeCustomerNamed: aName 
 
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !

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

!CustomerBookTest methodsFor: 'tests' stamp: 'NDS 5/18/2021 23:40:37'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook johnLennon expectedTime|
	
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	expectedTime := 50 milliSeconds.
		
	self should: [customerBook addCustomerNamed: johnLennon] notTakeMoreThan: expectedTime.
	
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NDS 5/18/2021 23:41:40'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney expectedTime|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createCustomerBookWithCustomer: paulMcCartney.
	expectedTime := 100 milliSeconds.
	
	self should: [customerBook removeCustomerNamed: paulMcCartney] notTakeMoreThan: expectedTime.


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'fmonpelat 5/20/2021 13:05:50'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self should: [ customerBook addCustomerNamed: ''.]
		raise: Error
		withMessageText:  CustomerBook customerCanNotBeEmptyErrorMessage.
		
	self assert: customerBook isEmpty.	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NDS 5/18/2021 23:44:18'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon paulMcCartney|
			
	johnLennon := 'John Lennon'.
	customerBook := self createCustomerBookWithCustomer: johnLennon.
	paulMcCartney := 'Paul McCartney'.
		
	self should: [ customerBook removeCustomerNamed: paulMcCartney ] 
	raise: NotFound 
	withExceptionDo: [ :anError | 		
		self assert: customerBook numberOfCustomers = 1.
		self assert: (customerBook includesCustomerNamed: johnLennon)]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NDS 5/18/2021 23:45:06'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createCustomerBookWithCustomer: paulMcCartney.
	
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assertThatCustomerBook: customerBook numberOfActiveCustomersIs: 	0 numberOfSuspendedCustomersIs: 1 andTotalNumberOfCustomersIs: 1. 
	self assert: (customerBook includesCustomerNamed: paulMcCartney).

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'fmonpelat 5/20/2021 12:55:15'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createCustomerBookWithCustomer: paulMcCartney.

	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
		
	self assertThatCustomerBook: customerBook numberOfActiveCustomersIs: 	0 numberOfSuspendedCustomersIs: 0 andTotalNumberOfCustomersIs: 0. 
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'fmonpelat 5/20/2021 14:38:05'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon ringoStarr |
			
	johnLennon := 'John Lennon'.
	customerBook := self createCustomerBookWithCustomer: johnLennon.
	ringoStarr := 'Ringo Starr'.
	
	self suspendCustomerAndCheck: 
	[ :anError | 		
			self assert: customerBook numberOfCustomers = 1. 
			self deny: (customerBook includesCustomerNamed: ringoStarr )
	]
	customerBook: customerBook customerName: ringoStarr.
		
	! !

!CustomerBookTest methodsFor: 'tests' stamp: 'fmonpelat 5/20/2021 14:38:11'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self createCustomerBookWithCustomer: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self suspendCustomerAndCheck: 
	[ :anError | 		
		self assert: customerBook numberOfCustomers = 1. 
		self assert: (customerBook includesCustomerNamed: johnLennon )
	]
	customerBook: customerBook customerName: johnLennon.
! !


!CustomerBookTest methodsFor: 'helpers' stamp: 'NDS 5/18/2021 20:26:27'!
assertThatCustomerBook: customerBook numberOfActiveCustomersIs: 	activeCustomers numberOfSuspendedCustomersIs: suspendedCustomers andTotalNumberOfCustomersIs: customers 

	self assert: activeCustomers equals: customerBook numberOfActiveCustomers.
	self assert: suspendedCustomers equals: customerBook numberOfSuspendedCustomers.
	self assert: customers equals: customerBook numberOfCustomers.
 ! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'NDS 5/18/2021 20:29:23'!
createCustomerBookWithCustomer: customer
	| customerBook |
			
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: customer.
	^customerBook.! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'fmonpelat 5/20/2021 14:37:46'!
suspendCustomerAndCheck: aBlock customerBook: customerBook customerName: aCustomerName
	self should: [ customerBook suspendCustomerNamed: aCustomerName] 
	raise: CantSuspend 
	withExceptionDo: aBlock! !


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


!CustomerBook methodsFor: 'customer management' stamp: 'NDS 5/19/2021 22:18:49'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NDS 5/19/2021 22:06:15'!
removeCustomerNamed: aName 

	active remove: aName ifAbsent: [
		suspended remove: aName ifAbsent: [^ NotFound signal.]
		].

	
	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NDS 5/19/2021 22:14:21'!
suspendCustomerNamed: aName 
	
	active remove: aName ifAbsent: [^CantSuspend signal].
		
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NDS 5/19/2021 21:56:03'!
numberOfCustomers
	
	^( self numberOfActiveCustomers + self numberOfSuspendedCustomers)! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NDS 5/19/2021 22:25:50'!
isEmpty
	
	^ self numberOfCustomers = 0.! !


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

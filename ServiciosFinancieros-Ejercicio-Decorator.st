!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio-Decorator'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Decorator'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferenceTest category: 'ServiciosFinancieros-Ejercicio-Decorator'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Decorator'!

!TransferenceTest methodsFor: 'tests' stamp: 'fmonpelat 7/4/2021 15:20:41'!
test01TransferenceDecreasesBalanceFromSenderAndIncreasesBalanceFromReceiver
	| senderAccount receiverAccount aValue |
	senderAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: senderAccount.
	
	receiverAccount := ReceptiveAccount new.
	aValue := 10 * peso.
	
	Transference from: senderAccount to: receiverAccount value: aValue.
	
	
	self assert: 0 equals: senderAccount balance.
	self assert: aValue equals: receiverAccount balance.! !

!TransferenceTest methodsFor: 'tests' stamp: 'fmonpelat 7/4/2021 15:21:59'!
test02TransferenceValueCanBeObtained
	| senderAccount receiverAccount aValue aTransference|
	senderAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: senderAccount.
	
	receiverAccount := ReceptiveAccount new.
	aValue := 10 * peso.
	
	aTransference := Transference from: senderAccount to: receiverAccount value: aValue.
	
	self assert: aValue equals: aTransference value.! !

!TransferenceTest methodsFor: 'tests' stamp: 'NDS 7/4/2021 17:42:05'!
test03
	| senderAccount receiverAccount aValue aTransference aDepositPart|
	senderAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: senderAccount.
	
	receiverAccount := ReceptiveAccount new.
	aValue := 10 * peso.
	
	aTransference := Transference from: senderAccount to: receiverAccount value: aValue.
	aDepositPart := aTransference depositPart.
	
	self assert: aDepositPart equals: aTransference depositCounterpart.! !

!TransferenceTest methodsFor: 'tests' stamp: 'NDS 7/4/2021 17:47:08'!
test04
	| senderAccount receiverAccount aValue aTransference aWithdrawPart |
	senderAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: senderAccount.
	
	receiverAccount := ReceptiveAccount new.
	aValue := 10 * peso.
	
	aTransference := Transference from: senderAccount to: receiverAccount value: aValue.
	aWithdrawPart := aTransference withdrawPart.
	
	self assert: aWithdrawPart equals: aTransference withdrawCounterpart.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio-Decorator'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Decorator'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio-Decorator'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio-Decorator'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Decorator'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio-Decorator'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio-Decorator'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Decorator'!

!Withdraw methodsFor: 'initialization' stamp: 'fmonpelat 7/4/2021 14:20:13'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio-Decorator'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio-Decorator'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Decorator'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'fmonpelat 7/4/2021 14:27:46'!
balance

	^transactions sum: [ :aTransaction | 
		(aTransaction isKindOf: Withdraw) ifTrue: [ (aTransaction value) * -1 ]
		ifFalse: [ aTransaction value ].
	] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio-Decorator'!
Object subclass: #Transference
	instanceVariableNames: 'value depositPart withdrawPart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Decorator'!

!Transference methodsFor: 'initialization' stamp: 'NDS 7/4/2021 17:55:33'!
initializeFrom: aSenderAccount to: aReceiverAccount value: aValue 
 	value := aValue .
	withdrawPart := WithdrawPart decorating: (Withdraw register: aValue on: aSenderAccount).
	depositPart := DepositPart decorating: (Deposit register: aValue on: 	aReceiverAccount).
	
	
! !


!Transference methodsFor: 'as yet unclassified' stamp: 'fmonpelat 7/4/2021 14:55:50'!
value
	^ value! !


!Transference methodsFor: 'accessing' stamp: 'NDS 7/4/2021 17:35:49'!
depositPart
	^depositPart.! !

!Transference methodsFor: 'accessing' stamp: 'NDS 7/4/2021 17:47:39'!
withdrawCounterpart
	^withdrawPart! !

!Transference methodsFor: 'accessing' stamp: 'NDS 7/4/2021 17:36:37'!
withdrawPart
	^withdrawPart.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio-Decorator'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'instance creation' stamp: 'fmonpelat 7/4/2021 14:42:31'!
from: aSenderAccount to: aReceiverAccount value: aValue 
	^self new initializeFrom: aSenderAccount to: aReceiverAccount value: aValue. ! !


!classDefinition: #TransferencePart category: 'ServiciosFinancieros-Ejercicio-Decorator'!
Object subclass: #TransferencePart
	instanceVariableNames: 'decoratee'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Decorator'!

!TransferencePart methodsFor: 'as yet unclassified' stamp: 'NDS 7/4/2021 18:06:19'!
initializeDecorating: anAccountTransaction
	decoratee := anAccountTransaction.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferencePart class' category: 'ServiciosFinancieros-Ejercicio-Decorator'!
TransferencePart class
	instanceVariableNames: ''!

!TransferencePart class methodsFor: 'as yet unclassified' stamp: 'NDS 7/4/2021 17:57:56'!
decorating: aTransferencePart
	^self new initializeDecorating: aTransferencePart .! !


!classDefinition: #DepositPart category: 'ServiciosFinancieros-Ejercicio-Decorator'!
TransferencePart subclass: #DepositPart
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Decorator'!

!DepositPart methodsFor: 'as yet unclassified' stamp: 'NDS 7/4/2021 18:01:28'!
value

	^ transferencePart value! !


!classDefinition: #WithdrawPart category: 'ServiciosFinancieros-Ejercicio-Decorator'!
TransferencePart subclass: #WithdrawPart
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Decorator'!

!WithdrawPart methodsFor: 'as yet unclassified' stamp: 'NDS 7/4/2021 18:01:39'!
value

	^ transferencePart value! !

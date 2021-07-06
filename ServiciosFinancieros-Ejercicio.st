!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio-Decorator'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Decorator'!

!PortfolioTest methodsFor: 'testing' stamp: 'fmonpelat 7/5/2021 20:52:55'!
test01PortfolioWithNoAccountHasZeroBalance
	| portfolio |
	portfolio := Portfolio new.
	
	self assert: 0 equals: portfolio balance! !

!PortfolioTest methodsFor: 'testing' stamp: 'fmonpelat 7/6/2021 18:48:16'!
test02PortfolioHasNewAccount
	| portfolio account |
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	portfolio addAsset: account.
	
	self assert: (portfolio hasAccount: account).! !

!PortfolioTest methodsFor: 'testing' stamp: 'fmonpelat 7/6/2021 18:48:16'!
test03PortfolioHasSameBalanceAsItsAssets
	| portfolio account |
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	portfolio addAsset: account.
	
	Deposit register: 100 * peso on: account.
	
	self assert: 100 * peso equals: (portfolio balance).! !

!PortfolioTest methodsFor: 'testing' stamp: 'fmonpelat 7/6/2021 18:48:16'!
test04PortfolioHasRegisteredAnAccountTransaction
	| portfolio account anAccountTransaction|
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	portfolio addAsset: account.
	
	anAccountTransaction := Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
	
	self assert: (portfolio hasRegistered: anAccountTransaction).! !

!PortfolioTest methodsFor: 'testing' stamp: 'fmonpelat 7/6/2021 18:48:16'!
test05PortfolioCanGiveTransactionsFromAssets
	| portfolio account anAccountTransaction |
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	portfolio addAsset: account.
	
	anAccountTransaction := Deposit register: 100 * peso on: account.
	
	self assert: (OrderedCollection with: anAccountTransaction) equals: portfolio transactions.! !

!PortfolioTest methodsFor: 'testing' stamp: 'fmonpelat 7/6/2021 18:49:40'!
test06PortfolioHasPortfolioAsAsset
	| portfolio1 portfolio2 |
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio  new.
	portfolio1 addAsset: portfolio2.
	
	self assert: (portfolio1 hasAccount: portfolio2).! !

!PortfolioTest methodsFor: 'testing' stamp: 'fmonpelat 7/6/2021 18:55:45'!
test07PortfolioWithPortfolioAsAssetHasSameBalanceAsItsAssets
	| portfolio1 portfolio2 account |
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio  new.
	portfolio1 addAsset: portfolio2.
	
	account := ReceptiveAccount new.
	portfolio2 addAsset: account.
	
	Deposit register: 100 * peso on: account.
	
	self assert:  100 * peso equals: (portfolio1 balance).! !

!PortfolioTest methodsFor: 'testing' stamp: 'fmonpelat 7/6/2021 19:00:22'!
test08PortfolioHasRegisteredATransactionFromAPortfolioAsset
	| portfolio1 portfolio2 account anAccountTransaction |
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio  new.
	portfolio1 addAsset: portfolio2.
	
	account := ReceptiveAccount new.
	anAccountTransaction := Deposit register: 100 * peso on: account.
	portfolio2 addAsset: account.
	
	self assert: (portfolio1 hasRegistered: anAccountTransaction).! !

!PortfolioTest methodsFor: 'testing' stamp: 'fmonpelat 7/6/2021 19:06:58'!
test09PorfolioCanGiveTransactionsFromAnAccountAndAPortofolio
	| portfolio1 portfolio2 account1 account2 anAccountTransaction1 anAccountTransaction2 |
	"
		portofolio1 <= portfolio2 <= account1
		portofolio1 <= account2
	"
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio  new.
	portfolio1 addAsset: portfolio2.
	
	account1 := ReceptiveAccount new.
	anAccountTransaction1 := Deposit register: 100 * peso on: account1.
	portfolio2 addAsset: account1.
	
	account2 := ReceptiveAccount new.
	anAccountTransaction2 := Deposit register: 100 * peso on: account2.
	portfolio1 addAsset: account2.
	
	self assert:  (OrderedCollection with: anAccountTransaction1 with: anAccountTransaction2 ) equals: (portfolio1 transactions).
	
	
	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'fmonpelat 7/6/2021 19:54:07'!
test10PortfolioCannotAddPortfolioToItselfAsAsset
	| portfolio |
	portfolio := Portfolio new.
	
	self should: [ portfolio addAsset: portfolio ]
	raise: Error
	withExceptionDo: [:anException |
		self assert: anException messageText equals: Portfolio CannotAddPortfolioToItselfAsAssetMessage ].! !


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

!TransferenceTest methodsFor: 'tests' stamp: 'fmonpelat 7/6/2021 19:43:36'!
test03TransferencePartsHaveRespectiveCounterparts
	| senderAccount receiverAccount aValue aTransference aDepositPart aWithdrawPart|
	senderAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: senderAccount.
	
	receiverAccount := ReceptiveAccount new.
	aValue := 10 * peso.
	
	aTransference := Transference from: senderAccount to: receiverAccount value: aValue.
	
	aDepositPart := aTransference depositPart. 
	aWithdrawPart := aTransference withdrawPart .
	
	
	
	self assert: aDepositPart equals: aWithdrawPart counterpart.
	self assert: aWithdrawPart equals: aDepositPart counterpart.! !


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

!Deposit methodsFor: 'initialization' stamp: 'fmonpelat 7/6/2021 20:05:51'!
initializeFor: aValue
	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'fmonpelat 7/6/2021 20:05:47'!
value
	^ value! !


!Deposit methodsFor: 'account-operation' stamp: 'fmonpelat 7/6/2021 19:09:30'!
effectOnBalance: aBalance
	^ aBalance + value ! !

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

!Withdraw methodsFor: 'initialization' stamp: 'fmonpelat 7/6/2021 20:06:06'!
initializeFor: aValue
	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'fmonpelat 7/6/2021 20:06:15'!
value
	^ value! !


!Withdraw methodsFor: 'account-operation' stamp: 'fmonpelat 7/6/2021 19:09:39'!
effectOnBalance: aBalance
	^ aBalance - value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio-Decorator'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio-Decorator'!
Object subclass: #Portfolio
	instanceVariableNames: 'assets'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Decorator'!

!Portfolio methodsFor: 'accessing' stamp: 'fmonpelat 7/5/2021 21:13:08'!
balance
	^ assets sum: [ :asset | asset balance ] ifEmpty: [ ^ 0 ].! !


!Portfolio methodsFor: 'associating' stamp: 'fmonpelat 7/6/2021 19:59:09'!
addAsset: anAssset
	 anAssset = self ifTrue: [ ^self error: Portfolio CannotAddPortfolioToItselfAsAssetMessage ].
	 assets add: anAssset.
	! !

!Portfolio methodsFor: 'associating' stamp: 'fmonpelat 7/6/2021 18:41:24'!
transactions
	| allTransactions |
	allTransactions := OrderedCollection new.
	assets do: [:asset | 
		(asset transactions) do: [ :transaction | allTransactions add: transaction ].
	].
	^ allTransactions
	! !


!Portfolio methodsFor: 'initialization' stamp: 'fmonpelat 7/5/2021 21:04:21'!
initialize
	assets := OrderedCollection new.! !


!Portfolio methodsFor: 'testing' stamp: 'fmonpelat 7/5/2021 21:05:38'!
hasAccount: anAccount
	^ assets includes: anAccount.
	! !

!Portfolio methodsFor: 'testing' stamp: 'fmonpelat 7/5/2021 21:22:19'!
hasRegistered: aTransaction
	assets do: [:asset | (asset hasRegistered: aTransaction) ifTrue: [ ^true ] ].
	^ false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio-Decorator'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'fmonpelat 7/5/2021 21:04:01'!
initialize
	^self new initialize ! !


!Portfolio class methodsFor: 'error-messages' stamp: 'fmonpelat 7/6/2021 19:51:58'!
CannotAddPortfolioToItselfAsAssetMessage
	^'Cannot add itself as Asset'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio-Decorator'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Decorator'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'fmonpelat 7/6/2021 19:13:52'!
balance

	^transactions inject: 0 into: [:aBalance :aTransaction |  aTransaction effectOnBalance: aBalance ].! !

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
	instanceVariableNames: 'value depositPart withdrawPart transference senderAccount receiverAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Decorator'!

!Transference methodsFor: 'initialization' stamp: 'fmonpelat 7/6/2021 19:29:29'!
initializeFrom: aSenderAccount to: aReceiverAccount value: aValue
 	value := aValue.
	senderAccount := aSenderAccount.
	receiverAccount := aReceiverAccount.
	
	withdrawPart := WithdrawPart initializeWith: self.
	depositPart := DepositPart initializeWith: self.! !


!Transference methodsFor: 'transference-part-private' stamp: 'fmonpelat 7/6/2021 19:33:13'!
depositToReceiver
	Deposit register: value on: receiverAccount .! !

!Transference methodsFor: 'transference-part-private' stamp: 'fmonpelat 7/6/2021 19:32:13'!
withdrawFromSender
	Withdraw register: value on: senderAccount.! !


!Transference methodsFor: 'accessing' stamp: 'NDS 7/4/2021 17:35:49'!
depositPart
	^depositPart.! !

!Transference methodsFor: 'accessing' stamp: 'fmonpelat 7/4/2021 14:55:50'!
value
	^ value! !

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
	instanceVariableNames: 'transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Decorator'!

!TransferencePart methodsFor: 'operations' stamp: 'fmonpelat 7/6/2021 19:36:11'!
value
	^ transference value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferencePart class' category: 'ServiciosFinancieros-Ejercicio-Decorator'!
TransferencePart class
	instanceVariableNames: ''!

!TransferencePart class methodsFor: 'class initialization' stamp: 'fmonpelat 7/6/2021 19:23:21'!
initializeWith: aTransference
	^self new initializeWith: aTransference! !


!classDefinition: #DepositPart category: 'ServiciosFinancieros-Ejercicio-Decorator'!
TransferencePart subclass: #DepositPart
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Decorator'!

!DepositPart methodsFor: 'operations' stamp: 'fmonpelat 7/6/2021 19:24:21'!
counterpart
	^ transference withdrawPart.! !


!DepositPart methodsFor: 'initialization' stamp: 'fmonpelat 7/6/2021 19:34:33'!
initializeWith: aTransference
	transference := aTransference.
	transference depositToReceiver.! !


!classDefinition: #WithdrawPart category: 'ServiciosFinancieros-Ejercicio-Decorator'!
TransferencePart subclass: #WithdrawPart
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Decorator'!

!WithdrawPart methodsFor: 'operations' stamp: 'fmonpelat 7/6/2021 19:24:33'!
counterpart
	^ transference depositPart.! !


!WithdrawPart methodsFor: 'initialization' stamp: 'fmonpelat 7/6/2021 19:34:46'!
initializeWith: aTransference
	transference := aTransference.
	transference withdrawFromSender.! !

Portfolio initialize!
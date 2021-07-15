!classDefinition: #AccountTests category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #AccountTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
AccountTests subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
AccountTests subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

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


!classDefinition: #ReportsTests category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReportsTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!


!classDefinition: #SummaryReportsTest category: 'ServiciosFinancieros-Solucion'!
ReportsTests subclass: #SummaryReportsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!SummaryReportsTest methodsFor: 'testing' stamp: 'NDS 7/11/2021 17:12:31'!
test01AccountSummaryForEmptyAccountReturnsExpectedBalanceString
	| account accountSummary |
	
	account := ReceptiveAccount new.
	
	accountSummary := OrderedCollection with: 'Balance = 0 pesos'.
	
	
	self assert: accountSummary equals: (account summary).	! !

!SummaryReportsTest methodsFor: 'testing' stamp: 'NDS 7/11/2021 17:13:20'!
test02AccountSummaryForAccountWithOneDepositReturnsExpectedDepositString
	| account accountSummary |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	accountSummary := OrderedCollection with: 'Depósito por 100 pesos' with: 'Balance = 100 pesos'.
	
	
	self assert: accountSummary equals: (account summary).	! !

!SummaryReportsTest methodsFor: 'testing' stamp: 'NDS 7/11/2021 17:19:42'!
test03AccountSummaryForAccountWithOneWithdrawReturnsExpectedWithdrawString
	| account accountSummary |
	
	account := ReceptiveAccount new.
	Withdraw register: 100 * peso on: account.
	accountSummary := OrderedCollection with: 'Extracción por 100 pesos' with: 'Balance = -100 pesos'.
	
	
	self assert: accountSummary equals: (account summary).	! !

!SummaryReportsTest methodsFor: 'testing' stamp: 'NDS 7/11/2021 17:20:10'!
test04AccountSummaryForOriginAccountWithTransferReturnsExpectedSummary
	| accountSummary originAccount destinationAccount |
	
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	accountSummary := OrderedCollection with: 'Depósito por 10 pesos' with: 'Salida por transferencia de 2 pesos' with: 'Balance = 8 pesos'.
	
	
	self assert: accountSummary equals: (originAccount summary).	! !

!SummaryReportsTest methodsFor: 'testing' stamp: 'NDS 7/11/2021 17:20:19'!
test05AccountSummaryForDestinationAccountWithTransferReturnsExpectedSummary
	| accountSummary originAccount destinationAccount |
	
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	accountSummary := OrderedCollection with: 'Depósito por 10 pesos' with: 'Entrada por transferencia de 2 pesos' with: 'Balance = 12 pesos'.
	
	
	self assert: accountSummary equals: (destinationAccount summary).	! !

!SummaryReportsTest methodsFor: 'testing' stamp: 'NDS 7/11/2021 17:27:29'!
test06AccountSummaryForEmptyPortfolioReturnsExpectedBalanceString
	| portfolio accountSummary |
	
	portfolio := Portfolio new.
	
	accountSummary := OrderedCollection with: 'Balance = 0 pesos'.
	
	
	self assert: accountSummary equals: (portfolio summary).	! !

!SummaryReportsTest methodsFor: 'testing' stamp: 'NDS 7/11/2021 17:59:50'!
test07AccountSummaryForPortfolioWithAccountThatHasADepositReturnsExpectedBalanceString
	| portfolio account accountSummary |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	accountSummary := OrderedCollection with: 'Depósito por 100 pesos' with: 'Balance = 100 pesos'.
	
	
	self assert: accountSummary equals: (portfolio summary).	! !

!SummaryReportsTest methodsFor: 'testing' stamp: 'NDS 7/11/2021 18:00:11'!
test08AccountSummaryForPortfolioWithAccountWithOneWithdrawReturnsExpectedString
	| portfolio account accountSummary |
	
	account := ReceptiveAccount new.
	Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	accountSummary := OrderedCollection with: 'Extracción por 100 pesos' with: 'Balance = -100 pesos'.
	
	
	self assert: accountSummary equals: (portfolio summary).	! !

!SummaryReportsTest methodsFor: 'testing' stamp: 'NDS 7/11/2021 18:00:19'!
test09AccountSummaryForPortfolioWithAccountWithATransferReturnsExpectedString
	| portfolio accountSummary originAccount destinationAccount|
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	portfolio := Portfolio with: originAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	accountSummary := OrderedCollection with: 'Depósito por 10 pesos' with: 'Salida por transferencia de 2 pesos' with: 'Balance = 8 pesos'.
	
	
	self assert: accountSummary equals: (portfolio summary).	! !

!SummaryReportsTest methodsFor: 'testing' stamp: 'NDS 7/11/2021 18:00:27'!
test10AccountSummaryForPortfolioWithAccountWithOneWithdrawReturnsExpectedString
	| portfolio accountSummary originAccount destinationAccount|
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	portfolio := Portfolio with: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	accountSummary := OrderedCollection with: 'Depósito por 10 pesos' with: 'Entrada por transferencia de 2 pesos' with: 'Balance = 12 pesos'.
	
	
	self assert: accountSummary equals: (portfolio summary).	! !

!SummaryReportsTest methodsFor: 'testing' stamp: 'NDS 7/11/2021 18:04:34'!
test11AccountSummaryForPortfolioWithPortfolioThatHasAnAccountWithOneDepositReturnsExpectedString
	| portfolio account accountSummary portfolioFather |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioFather := Portfolio with: portfolio.
	
	accountSummary := OrderedCollection with: 'Depósito por 100 pesos' with: 'Balance = 100 pesos'.
	
	
	self assert: accountSummary equals: (portfolioFather summary).
		! !


!classDefinition: #TransferNetTest category: 'ServiciosFinancieros-Solucion'!
ReportsTests subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNetTest methodsFor: 'testing' stamp: 'NDS 7/11/2021 18:16:47'!
test01TransferNetForEmptyAccountReturnsZero
	
	| account |
	
	account := ReceptiveAccount new.
	
	self assert: 0 equals: account transferNet.
	! !

!TransferNetTest methodsFor: 'testing' stamp: 'NDS 7/11/2021 18:19:26'!
test02TransferNetForAccountWithOneTransferReturnsExpectedValue
	
	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: -2 equals: originAccount transferNet.
	self assert: 2 equals: destinationAccount transferNet.
	! !

!TransferNetTest methodsFor: 'testing' stamp: 'fmonpelat 7/15/2021 11:31:47'!
test03TransferNetForPortfolioWithAnAccountThatTransferedReturnsExpectedValue
	
	| destinationAccount originAccount portfolio |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	portfolio := Portfolio with: originAccount.
	
	self assert: -2 equals: portfolio transferNet.
	! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'testing' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'testing' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'testing' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'testing' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'testing' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'testing' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!Account methodsFor: 'accessing' stamp: 'fmonpelat 7/15/2021 11:38:16'!
summary
	| aReport |
	aReport := SummaryReport for: self.
	^aReport create.
	! !

!Account methodsFor: 'accessing' stamp: 'fmonpelat 7/15/2021 11:45:47'!
transferNet
	| aReport |
	aReport := TransferNetReport for: self.
	^aReport create.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'LL 7/1/2021 03:21:03'!
initialize

	accounts := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'NDS 7/11/2021 17:47:38'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 * peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'LL 7/1/2021 03:21:12'!
add: accountToAdd
	
	accounts add: accountToAdd.
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NDS 7/11/2021 17:18:28'!
balance

	^transactions 
		inject: 0 * peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
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


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !



!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'reporting' stamp: 'fmonpelat 7/15/2021 16:38:23'!
summary: aReport
	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'reporting' stamp: 'fmonpelat 7/15/2021 16:38:52'!
transferNetFromReport: aReport withNetValue: aNetValue
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Solucion'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'reporting' stamp: 'NDS 7/12/2021 21:12:03'!
summary: aReport
	^aReport reportMessageforDeposit: self value.! !

!Deposit methodsFor: 'reporting' stamp: 'fmonpelat 7/15/2021 16:27:55'!
transferNetFromReport: aReport withNetValue: aNetValue
	^aNetValue ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'reporting' stamp: 'NDS 7/12/2021 21:13:06'!
summary: aReport
	^aReport reportMessageforTransferDepositLeg: self value.! !

!TransferDepositLeg methodsFor: 'reporting' stamp: 'fmonpelat 7/15/2021 16:35:04'!
transferNetFromReport: aReport withNetValue: aNetValue
	^aReport calculateForTransferDepositLeg: self withNetValue: aNetValue.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'reporting' stamp: 'NDS 7/12/2021 21:13:24'!
summary: aReport
	^aReport reportMessageforTransferWithdrawLeg: self value.! !

!TransferWithdrawLeg methodsFor: 'reporting' stamp: 'fmonpelat 7/15/2021 16:35:24'!
transferNetFromReport: aReport withNetValue: aNetValue
	^aReport calculateForTransferWithdrawLeg: self withNetValue: aNetValue.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !



!Withdraw methodsFor: 'as yet unclassified' stamp: 'NDS 7/12/2021 21:13:51'!
summary: aReport
	^aReport reportMessageforWithdraw: self value.! !

!Withdraw methodsFor: 'as yet unclassified' stamp: 'fmonpelat 7/15/2021 16:28:12'!
transferNetFromReport: aReport withNetValue: aNetValue
	^aNetValue ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Reports category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Reports
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Reports methodsFor: 'creation' stamp: 'fmonpelat 7/15/2021 11:38:48'!
create
	self subclassResponsibility.! !


!Reports methodsFor: 'initialization' stamp: 'fmonpelat 7/15/2021 11:39:14'!
initializeFor: anAccount
	account := anAccount! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Reports class' category: 'ServiciosFinancieros-Solucion'!
Reports class
	instanceVariableNames: ''!

!Reports class methodsFor: 'initialization' stamp: 'fmonpelat 7/15/2021 11:39:38'!
for: anAccount
	^self new initializeFor: anAccount.! !


!classDefinition: #SummaryReport category: 'ServiciosFinancieros-Solucion'!
Reports subclass: #SummaryReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!SummaryReport methodsFor: 'summary-messages' stamp: 'NDS 7/12/2021 21:12:24'!
reportMessageforDeposit: value
	^'Depósito por ',value asString.! !

!SummaryReport methodsFor: 'summary-messages' stamp: 'NDS 7/12/2021 21:12:30'!
reportMessageforTransferDepositLeg: value
	^'Entrada por transferencia de ', value asString.! !

!SummaryReport methodsFor: 'summary-messages' stamp: 'NDS 7/12/2021 21:12:42'!
reportMessageforTransferWithdrawLeg: value
	^'Salida por transferencia de ', value asString.! !

!SummaryReport methodsFor: 'summary-messages' stamp: 'NDS 7/12/2021 21:12:47'!
reportMessageforWithdraw: value
	^'Extracción por ',value asString.! !


!SummaryReport methodsFor: 'creation' stamp: 'NDS 7/12/2021 21:15:49'!
create
	| summary |
	summary := OrderedCollection new. 
	account transactions do: [:aTransaction | 
		summary add: (aTransaction summary: self).
	].
	summary add: 'Balance = ', account balance asString.
	^summary! !


!classDefinition: #TransferNetReport category: 'ServiciosFinancieros-Solucion'!
Reports subclass: #TransferNetReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNetReport methodsFor: 'creation' stamp: 'fmonpelat 7/15/2021 16:31:31'!
create
	| transferNet |
	transferNet := 0. 
	(account transactions) do: [:aTransaction | 
		transferNet := aTransaction transferNetFromReport: self withNetValue: transferNet .
	].
	^transferNet! !


!TransferNetReport methodsFor: 'transferNet-operations' stamp: 'fmonpelat 7/15/2021 16:34:27'!
calculateForTransferDepositLeg: anAccountTransaction withNetValue: aTransferNetValue
	^(aTransferNetValue + (anAccountTransaction value amount))! !

!TransferNetReport methodsFor: 'transferNet-operations' stamp: 'fmonpelat 7/15/2021 16:33:59'!
calculateForTransferWithdrawLeg: anAccountTransaction withNetValue: aTransferNetValue
	^(aTransferNetValue - (anAccountTransaction value amount))! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !

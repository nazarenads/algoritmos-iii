!classDefinition: #Caja category: 'FactorioParte2'!
DenotativeObject subclass: #Caja
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Caja class' category: 'FactorioParte2'!
Caja class
	instanceVariableNames: 'contenido'!

!Caja class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:07:37'!
agregar: unaMena
	contenido add: unaMena.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:42:38'!
agregarMenas: aCollectionOfMenas
	^contenido addAll: aCollectionOfMenas.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:08:26'!
cantidadDeMenas
	^contenido size.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'NDS 5/7/2021 15:09:13'!
cantidadDeMenasDeCarbon
	^contenido count: [ :cadaMena | cadaMena = 'una mena de carbon' ].! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'NDS 5/7/2021 15:10:01'!
cantidadDeMenasDeHierro
	^contenido count: [ :cadaMena | cadaMena = 'una mena de hierro' ].! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'NDS 5/7/2021 18:38:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new) add: 'una mena de carbon'; yourself).! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:09:06'!
vaciar
	contenido := OrderedCollection new.! !


!classDefinition: #CintaA category: 'FactorioParte2'!
DenotativeObject subclass: #CintaA
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaA class' category: 'FactorioParte2'!
CintaA class
	instanceVariableNames: 'contenido destino'!

!CintaA class methodsFor: 'as yet unclassified' stamp: 'NDS 5/5/2021 00:02:09'!
agregar: unaMena
	contenido add: unaMena.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'NDS 5/5/2021 00:02:09'!
agregarMenas: aCollectionOfMenas
	^contenido addAll: aCollectionOfMenas.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'NDS 5/5/2021 00:02:09'!
cantidadDeMenas
	^contenido size.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'NDS 5/5/2021 00:02:09'!
destino: aContenedor 
	destino := aContenedor.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'NDS 5/7/2021 18:38:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new) add: 'una mena de hierro'; yourself).
	destino := Caja.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'NDS 5/5/2021 00:02:09'!
transportar
	destino agregarMenas: contenido.
	self vaciar.
! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'NDS 5/5/2021 00:02:09'!
vaciar
	contenido := OrderedCollection new.! !


!classDefinition: #CintaB category: 'FactorioParte2'!
DenotativeObject subclass: #CintaB
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaB class' category: 'FactorioParte2'!
CintaB class
	instanceVariableNames: 'contenido destino'!

!CintaB class methodsFor: 'as yet unclassified' stamp: 'NDS 5/5/2021 00:00:49'!
agregar: unaMena
	contenido add: unaMena.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'NDS 5/5/2021 00:00:49'!
agregarMenas: aCollectionOfMenas
	^contenido addAll: aCollectionOfMenas.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'NDS 5/5/2021 00:00:49'!
cantidadDeMenas
	^contenido size.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'NDS 5/5/2021 00:00:50'!
destino: aContenedor 
	destino := aContenedor.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'NDS 5/7/2021 18:38:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new)).
	destino := CintaA.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'NDS 5/5/2021 00:00:50'!
transportar
	destino agregarMenas: contenido.
	self vaciar.
! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'NDS 5/5/2021 00:00:50'!
vaciar
	contenido := OrderedCollection new.! !


!classDefinition: #ExtractorDeCarbon category: 'FactorioParte2'!
DenotativeObject subclass: #ExtractorDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeCarbon class' category: 'FactorioParte2'!
ExtractorDeCarbon class
	instanceVariableNames: 'energiaActual destino'!

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/15/2021 21:23:04'!
agregarEnergia: energiaExtra

	energiaActual := energiaActual +	energiaExtra.
	^energiaExtra.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 5/2/2021 19:44:58'!
conjuntoDeMenasDeCarbonCantidad: cantidadDeMenas

	^ Array new: cantidadDeMenas withAll: 'una mena de carbon'! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:30:49'!
costoDeExtraccionPorMena
	^5 * joule.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:29:41'!
destino: aContenedor 
	destino := aContenedor.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/15/2021 21:21:02'!
energiaActual

	^energiaActual.
! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:31:29'!
energiaParaExtraerTodasLasMenasPosibles
	^self menasAExtraerSegunEnergiaActual * self costoDeExtraccionPorMena.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:34:57'!
extraer
	| cantidadDeMenas energiaConsumida |
	cantidadDeMenas := self menasAExtraerSegunEnergiaActual.
	energiaConsumida := self energiaParaExtraerTodasLasMenasPosibles.
	self sacarEnergia: energiaConsumida.
	^destino agregarMenas: (self conjuntoDeMenasDeCarbonCantidad: cantidadDeMenas).! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'NDS 5/7/2021 18:38:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energiaActual := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'joule'; instVarAt: 2 put: 'joules'; instVarAt: 3 put: 'j'; yourself); yourself).
	destino := Caja.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:30:27'!
menasAExtraerSegunEnergiaActual
	^energiaActual // self costoDeExtraccionPorMena.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 5/2/2021 19:36:12'!
ponerEnCeroLaEnergia
	energiaActual := 0 * joule.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:31:57'!
sacarEnergia: energiaASacar
	energiaActual := energiaActual - energiaASacar! !


!classDefinition: #ExtractorDeHierro category: 'FactorioParte2'!
DenotativeObject subclass: #ExtractorDeHierro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeHierro class' category: 'FactorioParte2'!
ExtractorDeHierro class
	instanceVariableNames: 'energiaActual destino'!

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NDS 5/5/2021 00:00:59'!
agregarEnergia: energiaExtra

	energiaActual := energiaActual +	energiaExtra.
	^energiaExtra.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NDS 5/5/2021 00:01:16'!
conjuntoDeMenasDeHierroCantidad: cantidadDeMenas

	^ Array new: cantidadDeMenas withAll: 'una mena de hierro'! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NDS 5/5/2021 00:00:59'!
costoDeExtraccionPorMena
	^5 * joule.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NDS 5/5/2021 00:00:59'!
destino: aContenedor 
	destino := aContenedor.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NDS 5/5/2021 00:00:59'!
energiaActual

	^energiaActual.
! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NDS 5/5/2021 00:00:59'!
energiaParaExtraerTodasLasMenasPosibles
	^self menasAExtraerSegunEnergiaActual * self costoDeExtraccionPorMena.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NDS 5/5/2021 00:01:30'!
extraer
	| cantidadDeMenas energiaConsumida |
	cantidadDeMenas := self menasAExtraerSegunEnergiaActual.
	energiaConsumida := self energiaParaExtraerTodasLasMenasPosibles.
	self sacarEnergia: energiaConsumida.
	^destino agregarMenas: (self conjuntoDeMenasDeHierroCantidad: cantidadDeMenas).! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NDS 5/7/2021 18:38:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energiaActual := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'joule'; instVarAt: 2 put: 'joules'; instVarAt: 3 put: 'j'; yourself); yourself).
	destino := CintaB.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NDS 5/5/2021 00:00:59'!
menasAExtraerSegunEnergiaActual
	^energiaActual // self costoDeExtraccionPorMena.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NDS 5/5/2021 00:00:59'!
ponerEnCeroLaEnergia
	energiaActual := 0 * joule.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NDS 5/5/2021 00:00:59'!
sacarEnergia: energiaASacar
	energiaActual := energiaActual - energiaASacar! !


!classDefinition: #PruebasDeExtractorDeCarbon category: 'FactorioParte2'!
DenotativeObject subclass: #PruebasDeExtractorDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasDeExtractorDeCarbon class' category: 'FactorioParte2'!
PruebasDeExtractorDeCarbon class
	instanceVariableNames: ''!

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 5/2/2021 19:37:39'!
setUp
	ExtractorDeCarbon destino: Caja.
	Caja vaciar.! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:41:43'!
test01UnExtractorSinEnergiaNoExtraeMenas
	"Cuando no cargue energia en el extractor, no saco menas"
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	Assert isTrue: ExtractorDeCarbon extraer isEmpty.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:46:54'!
test02UnExtractorConInsuficienteEnergiaNoExtraeMenas
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 1 * joule.
	Assert isTrue: ExtractorDeCarbon extraer isEmpty.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:47:56'!
test03UnExtractorConSuficienteEnergiaExtrae1Mena
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	Assert that: ExtractorDeCarbon extraer size isEqualTo: 1.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:49:57'!
test04UnExtractorConservaLaEnergiaNoUtilizada
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 7 * joule.
	Assert that: ExtractorDeCarbon extraer size isEqualTo: 1.
	Assert that: ExtractorDeCarbon energiaActual isEqualTo: 2 * joule.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:50:53'!
test05UnExtractorPuedeExtraerMultiplesMenasConMuchaEnergia
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 50 * joule.
	Assert that: ExtractorDeCarbon extraer size isEqualTo: 10.
	Assert that: ExtractorDeCarbon energiaActual isEqualTo: 0 * joule.
! !


!classDefinition: #PruebasDeFactorio category: 'FactorioParte2'!
DenotativeObject subclass: #PruebasDeFactorio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasDeFactorio class' category: 'FactorioParte2'!
PruebasDeFactorio class
	instanceVariableNames: ''!

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'NDS 5/7/2021 15:21:09'!
testEscenarioDosExtractorDeCarbonCintaCaja
	"arrange"
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeCarbon destino: CintaA.
	CintaA destino: Caja.
	CintaA vaciar.
	Assert that: CintaA cantidadDeMenas isEqualTo: 0.
	Caja vaciar.
	Assert that: Caja cantidadDeMenas isEqualTo: 0.
	
	"act"
	ExtractorDeCarbon extraer.	
	CintaA transportar.
	
	"assert"
	Assert that: CintaA cantidadDeMenas isEqualTo: 0.
	Assert that: Caja cantidadDeMenas isEqualTo: 1.
	Assert that: Caja cantidadDeMenasDeCarbon isEqualTo: 1.
! !

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'NDS 5/7/2021 15:18:03'!
testEscenarioDosExtractorDeCarbonUnaCinta
	
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeCarbon destino: CintaA.

	CintaA vaciar.
	Assert that: CintaA cantidadDeMenas isEqualTo: 0.

	ExtractorDeCarbon extraer.
	Assert that: CintaA cantidadDeMenas isEqualTo: 1.
! !

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'NDS 5/7/2021 18:37:10'!
testEscenarioTresDosExtractoresDosCintas
	
	"arrange"
	ExtractorDeHierro ponerEnCeroLaEnergia.
	ExtractorDeHierro agregarEnergia: 5 * joule.
	ExtractorDeHierro destino: CintaB.
	
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeCarbon destino: CintaA.
	
	CintaB destino: CintaA.
	CintaA destino: Caja.
	CintaB vaciar.
	CintaA vaciar.
	Caja vaciar.
	
	
	"act"
	ExtractorDeHierro extraer.	
	ExtractorDeCarbon extraer.
	CintaB transportar.
	CintaA transportar.
	
	"assert"
	Assert that: CintaB cantidadDeMenas isEqualTo: 0.
	Assert that: CintaA cantidadDeMenas isEqualTo: 0.
	
	Assert that: Caja cantidadDeMenas isEqualTo: 2.
	Assert that: Caja cantidadDeMenasDeCarbon isEqualTo: 1.
	Assert that: Caja cantidadDeMenasDeHierro isEqualTo: 1.
! !

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'NDS 5/7/2021 15:17:16'!
testEscenarioUnoExtractorDeCarbonCaja
	"arrange"
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeCarbon destino: Caja.
	Caja vaciar.
	
	"act"
	ExtractorDeCarbon extraer.
	
	"assert"
	Assert that: Caja cantidadDeMenas isEqualTo: 1.
	Assert that: Caja cantidadDeMenasDeCarbon isEqualTo: 1.! !

Caja initializeAfterFileIn!
CintaA initializeAfterFileIn!
CintaB initializeAfterFileIn!
ExtractorDeCarbon initializeAfterFileIn!
ExtractorDeHierro initializeAfterFileIn!
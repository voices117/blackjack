Feature: Blackjack

Scenario: Juego nuevo
	Given visito la pagina
	Then veo "Blackjack"
	And veo "Total: 0"
	And veo "Pedir"
	And veo "Plantarme"

Scenario: Ver total
	Given visito la pagina
	When click "Pedir"
	Then veo "Total: 7"

Scenario: Ganar
	Given visito la pagina
	When click "Pedir"
	And click "Pedir"
	And click "Pedir"
 	And click "Plantarme"
	Then veo "GANASTE!!"

Scenario: Perder
	Given visito la pagina
	When click "Pedir"
	And click "Plantarme"
	Then veo "PERDISTE!!"

Scenario: Pasarse
	Given visito la pagina
	When click "Pedir"
	And click "Pedir"
	And click "Pedir"
	And click "Pedir"
	Then veo "PERDISTE!!"




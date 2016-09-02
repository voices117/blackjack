Feature: Blackjack

Scenario: Juego nuevo
	Given visito la pagina
	Then veo "Blackjack"
	And veo "Total: "
	And veo "Pedir"
	And veo "Plantarme"

Scenario: Ver total
	Given visito la pagina
	And el mazo tiene "[5, 4, 3, 7, 10, 2, 1]"
	When click "Pedir"
	And click "Pedir"
	And click "Pedir"
	Then veo carta "A" para jugador "0"
	And veo carta "2" para jugador "0"
	And veo carta "3" para jugador "0"
	And veo carta "4" para jugador "0"
	And veo carta "5" para jugador "0"
	And veo carta "10" para croupier

Scenario: Ver total
	Given visito la pagina
	And el mazo tiene "[4, 4, 4, 4, 4]"
	When click "Pedir"
	Then veo "Total: 12"

Scenario: Ganar
	Given visito la pagina
	And el mazo tiene "[6, 4, 10, 7, 4, 4]"
	When click "Pedir"
	And click "Pedir"
 	And click "Plantarme"
	Then veo "GANASTE!!"

Scenario: Perder
	Given visito la pagina
	And el mazo tiene "[4, 10, 7, 4, 4]"
	When click "Pedir"
	And click "Plantarme"
	Then veo "PERDISTE!!"

Scenario: Pasarse
	Given visito la pagina
	And el mazo tiene "[4, 4, 4, 4, 10, 7, 4, 4]"
	When click "Pedir"
	And click "Pedir"
	And click "Pedir"
	And click "Pedir"
	Then veo "PERDISTE!!"
	And no veo "Pedir"
	And no veo "Plantarme"



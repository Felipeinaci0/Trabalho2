Feature: Testando API Rick and Morty

Background: Executa antes de cada teste
    * def url_base = 'https://rickandmortyapi.com/api/'

Scenario: Testando retorno do personagem Rick.
    Given url url_base
    And path 'character/1'
    When method get
    Then status 200
    And match response.name == "Rick Sanchez"
    And match response.id == 1 

Scenario: Testando retorno de um personagem inexistente.
    Given url url_base
    And path 'character/9999'
    When method get
    Then status 404

Scenario: Testando retorno do episódio 1.
    Given url url_base
    And path 'episode/1'
    When method get
    Then status 200
    And match response.name == "Pilot"
    And match response.id == 1 

Scenario: Testando retorno de todos os personagens.
    Given url url_base
    And path 'character/'
    When method get
    Then status 200
    And match response.results[0].name == "Rick Sanchez"
    And match response.results[1].name == "Morty Smith"
    And match response.results[2].name == "Summer Smith"

Scenario: Testando retorno de todos os episódios.
    Given url url_base
    And path 'episode/'
    When method get
    Then status 200
    And match response.results[0].name == "Pilot"
    And match response.results[1].name == "Lawnmower Dog"
    And match response.results[2].name == "Anatomy Park"

Scenario: Testando retorno de um episódio inexistente.
    Given url url_base
    And path 'episode/70'
    When method get
    Then status 404

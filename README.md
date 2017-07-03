# Quake_Log_Parser

O projeto tem como objetivo realizar um parser do arquivo games.log, afim de realizar os seguintes objetivos

## Task 1

O parser deve ser capaz de ler o arquivo, agrugar os dados de cada jogo, e em cada jogo deve coletar as informações de morte.

### Exemplo
```
 21:42 Kill: 1022 2 22: <world> killed Isgalamido by MOD_TRIGGER_HURT
```
O player "Isgalamido" morreu pois estava ferido e caiu de uma altura que o matou.

```
2:22 Kill: 3 2 10: Isgalamido killed Dono da Bola by MOD_RAILGUN
```
O player "Isgalamido" matou o player Dono da Bola usando a arma Railgun.

Para cada jogo o parser está gerando algo como:

```
game_1: {
    total_kills: 45;
    players: ["Dono da bola", "Isgalamido", "Zeh"]
    kills: {
      "Dono da bola": 5,
      "Isgalamido": 18,
      "Zeh": 20
    }
  }
```
### Observações
1. Quando o "\<world\>" mata o player ele perde -1 kill.
2. "\<world\>" não é um player e não deve aparecer na lista de players e nem no dicionário de kills.

## Task 2
Após construir o parser constrir um script que imprima um relatório de cada jogo (simplemente usando o hash) e um ranking geral de kills por jogador.

Formato:

```
RANKING:
PLAYER Dono da Bola 25 KILLS
PLAYER Isgalamido 4 KILLS
GAME 1
PLAYER Dono da Bola 10 KILLS
PLAYER Isgalamido 5 KILLS
GAME 2
PLAYER Dono da Bola 15 KILLS
PLAYER Isgalamido -1 KILLS
```

## Task 3
Caso consiga fazer tudo acima e ainda tiver tempo e paciência
No relatório mostrar as maiores causas de morte por partida.

Nessa Task, o codigo está gerando algo como:

```
 game_19: {
   Causas de mortes: {
     'MOD_ROCKET_SPLASH' : 32
     'MOD_ROCKET' : 27
     'MOD_TRIGGER_HURT' : 12
     'MOD_RAILGUN' : 10
     'MOD_MACHINEGUN' : 7
     'MOD_SHOTGUN' : 6
     'MOD_FALLING' : 1
   }
}

 game_20: {
   Causas de mortes: {
     'MOD_ROCKET_SPLASH' : 2
     'MOD_ROCKET' : 1
   }
}

 game_21: {
   Causas de mortes: {
     'MOD_ROCKET_SPLASH' : 60
     'MOD_ROCKET' : 37
     'MOD_TRIGGER_HURT' : 14
     'MOD_RAILGUN' : 9
     'MOD_MACHINEGUN' : 4
     'MOD_SHOTGUN' : 4
     'MOD_FALLING' : 3
   }
}
```
## Observação
1. O codigo está em Ruby

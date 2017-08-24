# Para abrir uma tela de 128x64 no MARS
# Run > Assemble
# Tools > Bitmap Display
	# Unit Width in Pixels: 4
	# Unit Height in Pixels: 4
	# Display Width in Pixels: 512
	# Display Height in Pixels: 256
	# Base address for display: 0x10008000($gp)
	# Connect to MIPS
# Run > Go


.data
	# codigos das cores, da forma 0x00 + (codigo em RGB)
	black:		.word 0x00000000
	white:		.word 0x00FFFFFF
	red:		.word 0x00FF0000
	green:		.word 0x0000FF00
	blue:		.word 0x000000FF
	darkred:	.word 0x008B0000
	gray:		.word 0x00A9A9A9
	lightgray:	.word 0x00D3D3D3
	darkgray:	.word 0x002F4F4F
	myMessage: .asciiz "Uma fome atingiu o seu reino, deseja comprar comida do feudo vizinho?\n(y) para sim (n) para nao\n "
	QuebraLinha: .asciiz "\n"
	Erro: .asciiz "\nDigite Apenas (y) ou (n)\n"

	myMessage1: .asciiz "\nUma grande fome assola o reino, comprar comida do feudo vizinho?\n(y) para sim / (n) para nao\n "
	myMessage2: .asciiz "\nExistem muitos livros sem uso na igreja, quer vende-los?\n(y) para sim / (n) para nao\n "
	myMessage3: .asciiz "\nUm grupo de monges do oriente chegou ao seu feudo pedindo abrigo\n(y) para manda-los para a igreja / (n) para recruta-los no seu exercito\n "
	myMessage4: .asciiz "\nSeus batedores encontraram uma reliquia religiosa, guardar na sua igreja ou vender?\n(y) para guardar / (n) para vender\n "
	myMessage5: .asciiz "\nUm exercito inimigo bloqueou sua fonte de agua\n(y) para mandar seu exercito para batalha (n) para comprar um negociacao de paz\n "
	myMessage6: .asciiz "\nUma peste assolou seus estoques de comida, queimar tudo?\n(y) para sim ou (n) para nao\n "
	myMessage7: .asciiz "\nUm Viajante estrageiro quer contratar alguns dos recrutas do seu exercito para acompanha-lo em sua viagem, quer negociar?\n(y) para sim ou (n) para nao\n "
	myMessage8: .asciiz "\nO preco do pao esta muito baixo, voce quer dobrar o preco?\n(y) para dobrar o preco ou (n) para aumentar um pouco o preco \n "
	myMessage9: .asciiz "\nUm terremoto destruiu grande parte da capital! A guarda esta esperando seu comando\n(y) para evitar os saques ou (n) para salvar as vitimas\n "
	myMessage10: .asciiz "\nDeveriamos atacar o reino do sul. Eles estao ficando cada vez mais fortes\n(y) para sim ou (n) para nao\n "
	myMessage11: .asciiz "\nPrecisamos melhorar as defesas! Os barbaros das baronias orientais estao nas fronteiras de nosso reino\n(y) para melhorar as defesas ou (n) para nao melhorar as defesas\n " #sim aumenta exercito e diminui dinheiro / não para diminuir execito
	myMessage12: .asciiz "\nO reino do sul alega que voce esta prometido para a jovem princesa. Recusar-se pode resultar em guerra\n(y) para aceitar ou (n) para recusar \n" #sim aumenta todos indicadores /	não diminui popularidade e diminui exercito
	myMessage13: .asciiz "\nQue absurdo! O General Arnolfo de Dover foi visto na cama da Rainha. Quem voce quer executar alguem por isso?\n(y) para executar o General ou (n) para executar a Rainha \n" #sim diminui exercito e igreja / nao ganha exercito e perde BASTANTE igreja
	myMessage14: .asciiz "\nUm navio foi isolado em quarentena. Pode ser a peste. Sera que devemos isolar todo o porto?\n(y) para sim ou (n) para nao\n" #sim perde bastante dinheiro, um pouco de exercito e ganha popularidade / nao perde populaidade e ganha dinheiro
	myMessage15: .asciiz "\nMeu rei, parece que o exercito tem pouca higiene. Deveriamos cuidar desse problema?\n(y) para sim ou (n) para nao\n" #sim  aumenta exercito, popularidade e diminui dinheiro / nao perde popularidade e exercito
	myMessage16: .asciiz "\nUma explosao na mina matou pelo menos cem pessoas! Devemos continuar cavando?\n(y) para sim ou (n) para nao\n" #sim aumenta dinheiro e perde popularidade/ nao perde dinheiro
	myMessage17: .asciiz "\nA colheita foi fantastica senhor\n(y) para alimentar o exercito ou (n) para alimentar o povo\n" #s: +2 -1 e n: -2 +1 -3
	myMessage18: .asciiz "\nEncontramos ouro na mina, devemos cavar mais fundo ou nao?\n(y) para sim ou (n) para nao\n" #s: ++3 -1 e n: +1 -3
	myMessage19: .asciiz "\nA guerra ja e longa e dolorosa, devemos cessar fogo?\n(y) para sim ou (n) para nao\n" #s: +1 -2 e n: -1 -3
	myMessage20: .asciiz "\nUm pelotao de soldados bebados saqueou uma abadia. Queremos justica!\n(y) para sim ou (n) para nao\n" #s: +0 -2 e n: --0 +2
	myMessage21: .asciiz "\nOs comerciantes gostariam de criar uma nova guilda e enviar um representante para a corte!\n(y) para sim ou (n) para nao\n" #s: ++3 +1 -0 -2  e n: --3
	myMessage22: .asciiz "\nO leste e o sul estao organizando um ataque contra nos, devemos pedir a ajuda do oeste?\n(y) para sim ou (n) para nao\n" #s: +1 +2 -3 e n: -2 -1
	myMessage23: .asciiz "\nOs aldeoes estao se rebelando! Grandes grupos estao saqueando a capital. Seu exercito foi subjulgado\n(y) para reforcar o exercito ou (n) para fechar os portoes do castelo\n" #s: -1 -2 -3 e n: -1 +2 -3
	myMessage24: .asciiz "\nUma jovem alega que deu a luz a um filho bastardo seu. Quer fazer o problema desaparecer?\n(y) para sim ou (n) para nao\n" #s: +1 -3 e n: +0 -1 +1
	myMessage25: .asciiz "\nInstaure um toque de recolher. As ruas da capital nao sao seguras a noite!\n(y) para sim ou (n) para nao\n" #s: -1 +2 e n: -1 -2
	myMessage26: .asciiz "\nA igreja pede poder suficiente para exaltar a justica divina em seu reino. O papa esta pronto para pagar o preco\n(y) para sim ou (n) para nao\n" #s: ++0 ++3 -2 -1 e n: --0 +1 +2"
	myMessage27: .asciiz "\nO rio esta alagando os campos! Precisamos do apoio da igreja e do exercito!\n(y) para sim ou (n) para nao\n" #s: -0 +1 -2 e n: -1
	myMessage28: .asciiz "\nPodemos arranjar um casamento com a princesa do Norte. Isso provavelmente acabara com a guerra\n(y) para sim ou (n) para nao\n" #s: +0+1+2+3 e n: -1 -3
	myMessage29: .asciiz "\nA foz do rio eh um pantano perigoso para viajantes. Deveriamos limpar a regiao\n(y) para sim ou (n) para nao\n" #s: ++1 -3 e n: -1
	myMessage30: .asciiz "\nNossa cidade cheira lixo o ano todo. Vamos construir um sistema de esgoto?\n(y) para sim ou (n) para nao\n" #s: +1 -3 e n: -1
	myMessage31: .asciiz "\nOs vikings estao nos atacando pelo norte, Devemos atacar ou defender?\n(y) para atacar ou (n) para defender\n" #s: -1 -2 -3 e n: -2
	myMessage32: .asciiz "\nO rio esta secando, deveriamos contruir uma barragem\n(y) para sim ou (n) para nao\n" #s: --3 +1 e n: --1
	myMessage33: .asciiz "\nSua fortaleza esta muito fraca, sugiro construir uma torre nova\n(y) para sim ou (n) para nao\n" #s: +2 -3 e n: -1 -2
	myMessage34: .asciiz "\nUma nova tecnica de plantio melhorou nossa colheita! O que fazer com a renda?\n(y) para levar para o cofre do castelo ou (n) para compartilhar\n" #s: +0 +1 +2 e n: ++3
	myMessage35: .asciiz "\nA rainha do Sul lhe ofereceu varios livros. Deveriamos contruir uma biblioteca publica\n(y) para sim ou (n) para nao\n" #s: -0 ++1 +2 -3 e n: +0 -1 -2
	myMessage36: .asciiz "\nA torre da basilica esta caindo aos pedacos. Precisamos de ajuda\n(y) para sim ou (n) para nao\n" #s: ++0 --3 e n: --0
	myMessage37: .asciiz "\nUm grupo de aldeoes fingiu ser assaltado por seres celestiais. Deve ser uma desculpa para pagar menos imposto\n(y) para sim ou (n) para acreditar neles\n" #s: -1 e n: +1 -3
	myMessage38: .asciiz "\nMajestade, deveriamos contruir um celeiro publico para prevencao da fome.\n(y) para sim ou (n) para nao\n" #s: +1 --3 e n: --1
	myMessage39: .asciiz "\nO povo de uma aldeia remota esta ensinado as criancas a cuspir nos homens do rei, Quer fazer deles um exemplo?\n(y) para sim ou (n) para nao\n" #s: +0 -1 e n: +1
	myMessage40: .asciiz "\nO rei no Norte esta oferecendo para comprar uma parte do pais. Quer vender?\n(y) para sim ou (n) para nao\n" #s: ++3 -1 e n: +1
	myMessageInferiorReligiao: .asciiz "\nA igreja perdeu seu poder e voce foi linchado por pagaos"
	myMessageSuperiorReligiao: .asciiz "\nA Igreja fica muito poderosa e te transforma em um martir. Eles te rasgaram membro de membro."
	myMessageInferiorPopularidade: .asciiz "\nO castelo � saqueado, sua corte se dispersa e voc� fica com pombos para governar"
	myMessageSuperiorPopularidade: .asciiz "\nSeu reinado acaba mas ningu�m te prejudica. Voc� morre alguns anos depois elogiado e bem lembrado"
	myMessageInferiorExercito: .asciiz "\nVoc� conduz os �ltimos remanescentes de seu ex�rcito e morre nos degraus do trono"
	myMessageSuperiorExercito: .asciiz "\nO exercito ganhou muito poder e voce sofreu um golpe de estado e foi morto"
	myMessageInferiorRiqueza: .asciiz "\nA nova oligarquia forca seu exilio"
	myMessageSuperiorRiqueza: .asciiz "\nVoce comeu tanto que acabou sufocando. Todos estao bebados e sua morte eh noticiada no dia seguinte"
	anosPoder1: .asciiz "\nSua dinastia reinou por: "
	anosPoder2: .asciiz " anos\n"
.text

.macro black
	addi $a2, $0, 0x00000000
.end_macro

.macro red
	addi $a2, $0, 0x00FF0000
.end_macro

.macro darkred
	addi $a2, $0, 0x008B0000
.end_macro

.macro white
	addi $a2, $0, 0x00FFFFFF
.end_macro

.macro coral
	addi $a2, $0, 0x00DEB887
.end_macro

.macro silver
	addi $a2, $0, 0x00C0C0C0
.end_macro

.macro pink
	addi $a2, $0, 0x00FFC0CB
.end_macro

.macro firebrick
	addi $a2, $0, 0x00B22222
.end_macro

.macro dim_gray

	addi $a2, $0, 0x00696969
.end_macro

.macro slate_gray
	addi $a2, $0, 0x00708090
.end_macro

.macro dark_gray
	addi $a2, $0, 0x002F4F4F
.end_macro

.macro painel
	# ---------- parte vermelha

		red
		li $a0, 4
		li $a3, 123

		li $a1, 4
		jal DrawHorizontalLine
		li $a1, 5
		jal DrawHorizontalLine
		li $a1, 6
		jal DrawHorizontalLine
		li $a1, 7
		jal DrawHorizontalLine
		li $a1, 25
		jal DrawHorizontalLine
		li $a1, 26
		jal DrawHorizontalLine
		li $a1, 27
		jal DrawHorizontalLine
		li $a1, 28
		jal DrawHorizontalLine
		li $a1, 29
		jal DrawHorizontalLine

		li $a1, 8
		li $a0, 4
		li $a3, 21
		jal DrawHorizontalLine
		li $a0, 25
		li $a3, 50
		jal DrawHorizontalLine
		li $a0, 54
		li $a3, 76
		jal DrawHorizontalLine
		li $a0, 78
		li $a3, 101
		jal DrawHorizontalLine
		li $a0, 104
		li $a3, 123
		jal DrawHorizontalLine

		li $a1, 9
		li $a0, 4
		li $a3, 21
		jal DrawHorizontalLine
		li $a0, 25
		li $a3, 49
		jal DrawHorizontalLine
		li $a0, 55
		li $a3, 75
		jal DrawHorizontalLine
		li $a0, 79
		li $a3, 101
		jal DrawHorizontalLine
		li $a0, 104
		li $a3, 123
		jal DrawHorizontalLine

		li $a1, 10
		li $a0, 4
		li $a3, 21
		jal DrawHorizontalLine
		li $a0, 25
		li $a3, 49
		jal DrawHorizontalLine
		li $a0, 55
		li $a3, 75
		jal DrawHorizontalLine
		li $a0, 79
		li $a3, 101
		jal DrawHorizontalLine
		li $a0, 104
		li $a3, 123
		jal DrawHorizontalLine

		li $a1, 11
		li $a0, 4
		li $a3, 21
		jal DrawHorizontalLine
		li $a0, 25
		li $a3, 49
		jal DrawHorizontalLine
		li $a0, 55
		li $a3, 75
		jal DrawHorizontalLine
		li $a0, 79
		li $a3, 100
		jal DrawHorizontalLine
		li $a0, 106
		li $a3, 123
		jal DrawHorizontalLine

		li $a1, 12
		li $a0, 4
		li $a3, 21
		jal DrawHorizontalLine
		li $a0, 25
		li $a3, 49
		jal DrawHorizontalLine
		li $a0, 55
		li $a3, 75
		jal DrawHorizontalLine
		li $a0, 79
		li $a3, 99
		jal DrawHorizontalLine
		li $a0, 107
		li $a3, 123
		jal DrawHorizontalLine

		li $a1, 13
		li $a0, 4
		li $a3, 16
		jal DrawHorizontalLine
		li $a0, 30
		li $a3, 50
		jal DrawHorizontalLine
		li $a0, 54
		li $a3, 75
		jal DrawHorizontalLine
		li $a0, 79
		li $a3, 98
		jal DrawHorizontalLine
		li $a0, 103
		li $a3, 104
		jal DrawHorizontalLine
		li $a0, 107
		li $a3, 123
		jal DrawHorizontalLine

		li $a1, 14
		li $a0, 4
		li $a3, 16
		jal DrawHorizontalLine
		li $a0, 30
		li $a3, 48
		jal DrawHorizontalLine
		li $a0, 57
		li $a3, 75
		jal DrawHorizontalLine
		li $a0, 79
		li $a3, 98
		jal DrawHorizontalLine
		li $a0, 102
		li $a3, 123
		jal DrawHorizontalLine

		li $a1, 15
		li $a0, 4
		li $a3, 21
		jal DrawHorizontalLine
		li $a0, 25
		li $a3, 46
		jal DrawHorizontalLine
		li $a0, 58
		li $a3, 75
		jal DrawHorizontalLine
		li $a0, 79
		li $a3, 99
		jal DrawHorizontalLine
		li $a0, 103
		li $a3, 123
		jal DrawHorizontalLine

		li $a1, 16
		li $a0, 4
		li $a3, 21
		jal DrawHorizontalLine
		li $a0, 25
		li $a3, 46
		jal DrawHorizontalLine
		li $a0, 49
		li $a3, 50
		jal DrawHorizontalLine
		li $a0, 54
		li $a3, 55
		jal DrawHorizontalLine
		li $a0, 58
		li $a3, 75
		jal DrawHorizontalLine
		li $a0, 79
		li $a3, 100
		jal DrawHorizontalLine
		li $a0, 105
		li $a3, 123
		jal DrawHorizontalLine

		li $a1, 17
		li $a0, 4
		li $a3, 21
		jal DrawHorizontalLine
		li $a0, 25
		li $a3, 50
		jal DrawHorizontalLine
		li $a0, 54
		li $a3, 75
		jal DrawHorizontalLine
		li $a0, 79
		li $a3, 101
		jal DrawHorizontalLine
		li $a0, 106
		li $a3, 123
		jal DrawHorizontalLine

		li $a1, 18
		li $a0, 4
		li $a3, 21
		jal DrawHorizontalLine
		li $a0, 25
		li $a3, 50
		jal DrawHorizontalLine
		li $a0, 54
		li $a3, 75
		jal DrawHorizontalLine
		li $a0, 79
		li $a3, 102
		jal DrawHorizontalLine
		li $a0, 107
		li $a3, 123
		jal DrawHorizontalLine

		li $a1, 19
		li $a0, 4
		li $a3, 21
		jal DrawHorizontalLine
		li $a0, 25
		li $a3, 50
		jal DrawHorizontalLine
		li $a0, 54
		li $a3, 75
		jal DrawHorizontalLine
		li $a0, 79
		li $a3, 98
		jal DrawHorizontalLine
		li $a0, 101
		li $a3, 102
		jal DrawHorizontalLine
		li $a0, 107
		li $a3, 123
		jal DrawHorizontalLine

		li $a1, 20
		li $a0, 4
		li $a3, 21
		jal DrawHorizontalLine
		li $a0, 25
		li $a3, 49
		jal DrawHorizontalLine
		li $a0, 55
		li $a3, 72
		jal DrawHorizontalLine
		li $a0, 82
		li $a3, 98
		jal DrawHorizontalLine
		li $a0, 106
		li $a3, 123
		jal DrawHorizontalLine

		li $a1, 21
		li $a0, 4
		li $a3, 21
		jal DrawHorizontalLine
		li $a0, 25
		li $a3, 48
		jal DrawHorizontalLine
		li $a0, 52
		li $a3, 52
		jal DrawHorizontalLine
		li $a0, 56
		li $a3, 72
		jal DrawHorizontalLine
		li $a0, 82
		li $a3, 99
		jal DrawHorizontalLine
		li $a0, 106
		li $a3, 123
		jal DrawHorizontalLine

		li $a1, 22
		li $a0, 4
		li $a3, 21
		jal DrawHorizontalLine
		li $a0, 25
		li $a3, 48
		jal DrawHorizontalLine
		li $a0, 51
		li $a3, 53
		jal DrawHorizontalLine
		li $a0, 56
		li $a3, 75
		jal DrawHorizontalLine
		li $a0, 79
		li $a3, 100
		jal DrawHorizontalLine
		li $a0, 105
		li $a3, 123
		jal DrawHorizontalLine

		li $a1, 23
		li $a0, 4
		li $a3, 21
		jal DrawHorizontalLine
		li $a0, 25
		li $a3, 47
		jal DrawHorizontalLine
		li $a0, 50
		li $a3, 54
		jal DrawHorizontalLine
		li $a0, 57
		li $a3, 75
		jal DrawHorizontalLine
		li $a0, 79
		li $a3, 101
		jal DrawHorizontalLine
		li $a0, 104
		li $a3, 123
		jal DrawHorizontalLine

		li $a1, 24
		li $a0, 4
		li $a3, 21
		jal DrawHorizontalLine
		li $a0, 25
		li $a3, 46
		jal DrawHorizontalLine
		li $a0, 50
		li $a3, 54
		jal DrawHorizontalLine
		li $a0, 58
		li $a3, 75
		jal DrawHorizontalLine
		li $a0, 79
		li $a3, 101
		jal DrawHorizontalLine
		li $a0, 104
		li $a3, 123
		jal DrawHorizontalLine

.end_macro

.macro nobre

#Fundo--------------------------------------------------------------
	li $a0, 0
	li $a1, 127
	addi $a2, $0, 0x000000FF
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 126
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 125
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 124
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 123
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 122
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 121
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 120
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 119
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 118
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 117
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 116
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 115
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 114
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 113
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 112
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 111
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 110
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 109
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 108
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 107
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 106
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 105
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 104
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 103
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 102
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 101
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 100
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 99
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 98
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 97
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 96
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 95
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 94
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 93
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 92
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 91
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 90
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 89
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 88
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 87
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 86
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 85
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 84
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 83
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 82
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 81
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 80
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 79
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 78
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 77
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 76
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 75
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 74
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 73
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 72
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 71
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 70
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 69
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 68
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 67
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 66
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 65
	li $a3, 127
	jal DrawHorizontalLine


	#Corpo do Plebeu--------------------------------------------------------------
	li $a0, 28			# coordenada x inicial
	li $a1, 127			# coordenada y
	dim_gray		# cor
	li $a3, 98			# coordenada x final
	jal DrawHorizontalLine

	# desenhar linha vertical
	li $a0, 28			# coordenada x
	li $a1, 110			# coordenada y inicial
	dim_gray			# cor
	li $a3, 127			# coordenada y final
	jal DrawVerticalLine

	li $a0, 98
	li $a1, 110
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 28
	li $a1, 126
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 125
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 124
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 123
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 122
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 121
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 120
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 119
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 118
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 117
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 116
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 115
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 114
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 113
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 112
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 111
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 110
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 29
	li $a1, 109
	li $a3, 97
	jal DrawHorizontalLine

	li $a0, 31
	li $a1, 108
	li $a3, 95
	jal DrawHorizontalLine

	li $a0, 31
	li $a1, 107
	li $a3, 95
	jal DrawHorizontalLine

	li $a0, 33
	li $a1, 106
	li $a3, 93
	jal DrawHorizontalLine

	li $a0, 33
	li $a1, 105
	li $a3, 93
	jal DrawHorizontalLine

	li $a0, 35
	li $a1, 104
	li $a3, 91
	jal DrawHorizontalLine

	li $a0, 35
	li $a1, 103
	li $a3, 91
	jal DrawHorizontalLine

	li $a0, 39
	li $a1, 102
	li $a3, 87
	jal DrawHorizontalLine

	li $a0, 43
	li $a1, 101
	li $a3, 83
	jal DrawHorizontalLine

	li $a0, 47
	li $a1, 100
	li $a3, 79
	jal DrawHorizontalLine

	#Cabeca--------------------------------------------------

	li $a0, 51
	li $a1, 85
	pink
	li $a3, 110
	jal DrawVerticalLine

	li $a0, 75
	li $a1, 85
	li $a3, 110
	jal DrawVerticalLine

	li $a0, 51			# coordenada x
	li $a1, 90			# coordenada y inicial			# cor
	li $a3, 110			# coordenada y final
	jal DrawVerticalLine

	li $a0, 75
	li $a1, 90
	li $a3, 110
	jal DrawVerticalLine

	li $a0, 51
	li $a1, 110
	pink
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 52
	li $a1, 111
	li $a3, 74
	jal DrawHorizontalLine

	li $a0, 52
	li $a1, 112
	li $a3, 74
	jal DrawHorizontalLine

	li $a0, 53
	li $a1, 113
	li $a3, 73
	jal DrawHorizontalLine

	li $a0, 53
	li $a1, 114
	li $a3, 73
	jal DrawHorizontalLine

	li $a0, 55
	li $a1, 115
	li $a3, 71
	jal DrawHorizontalLine

	li $a0, 57
	li $a1, 116
	li $a3, 69
	jal DrawHorizontalLine

	li $a0, 59
	li $a1, 117
	li $a3, 67
	jal DrawHorizontalLine

	li $a0, 61
	li $a1, 118
	li $a3, 65
	jal DrawHorizontalLine

	li $a0, 62
	li $a1, 119
	li $a3, 64
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 109
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 108
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 107
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 106
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 105
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 104
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 103
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 102
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 101
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 100
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 99
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 98
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 97
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 96
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 95
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 94
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 93
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 92
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 91
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 90
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 85
	li $a3, 110
	jal DrawVerticalLine

	li $a0, 75
	li $a1, 85
	li $a3, 110
	jal DrawVerticalLine

	li $a0, 75
	li $a1, 85
	pink
	li $a3, 92
	jal DrawVerticalLine

	li $a0, 51
	li $a1, 85
	li $a3, 92
	jal DrawVerticalLine

	li $a0, 52
	li $a1, 82
	li $a3, 92
	jal DrawVerticalLine

	li $a0, 74
	li $a1, 82
	li $a3, 92
	jal DrawVerticalLine

	li $a0, 53
	li $a1, 82
	li $a3, 91
	jal DrawVerticalLine

	li $a0, 73
	li $a1, 82
	li $a3, 91
	jal DrawVerticalLine

	li $a0, 54
	li $a1, 79
	li $a3, 90
	jal DrawVerticalLine

	li $a0, 72
	li $a1, 79
	li $a3, 90
	jal DrawVerticalLine

	li $a0, 55
	li $a1, 79
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 71
	li $a1, 79
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 56
	li $a1, 77
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 70
	li $a1, 77
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 57
	li $a1, 77
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 69
	li $a1, 77
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 58
	li $a1, 75
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 68
	li $a1, 75
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 59
	li $a1, 75
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 75
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 60
	li $a1, 73
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 66
	li $a1, 73
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 61
	li $a1, 73
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 65
	li $a1, 73
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 62
	li $a1, 71
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 64
	li $a1, 71
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 63
	li $a1, 71
	li $a3, 89
	jal DrawVerticalLine









	#cabelito=====================

	li $a0, 51
	li $a1, 91
	addi $a2, $0, 0x00FFFF00
	li $a3, 106
	jal DrawVerticalLine

	li $a0, 75
	li $a1, 91
	li $a3, 106
	jal DrawVerticalLine

	li $a0, 52
	li $a1, 88
	li $a3, 91
	jal DrawVerticalLine

	li $a0, 74
	li $a1, 88
	li $a3, 91
	jal DrawVerticalLine

	li $a0, 53
	li $a1, 88
	li $a3, 91
	jal DrawVerticalLine

	li $a0, 73
	li $a1, 88
	li $a3, 91
	jal DrawVerticalLine

	li $a0, 54
	li $a1, 85
	li $a3, 88
	jal DrawVerticalLine

	li $a0, 72
	li $a1, 85
	li $a3, 88
	jal DrawVerticalLine

	li $a0, 55
	li $a1, 85
	li $a3, 88
	jal DrawVerticalLine

	li $a0, 71
	li $a1, 85
	li $a3, 88
	jal DrawVerticalLine



	li $a0, 56
	li $a1, 83
	li $a3, 85
	jal DrawVerticalLine

	li $a0, 70
	li $a1, 83
	li $a3, 85
	jal DrawVerticalLine

	li $a0, 57
	li $a1, 83
	li $a3, 85
	jal DrawVerticalLine

	li $a0, 69
	li $a1, 83
	li $a3, 85
	jal DrawVerticalLine






	li $a0, 58
	li $a1, 81
	li $a3, 83
	jal DrawVerticalLine

	li $a0, 68
	li $a1, 81
	li $a3, 83
	jal DrawVerticalLine

	li $a0, 59
	li $a1, 81
	li $a3, 83
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 81
	li $a3, 83
	jal DrawVerticalLine




	li $a0, 60
	li $a1, 79
	li $a3, 81
	jal DrawVerticalLine

	li $a0, 66
	li $a1, 79
	li $a3, 81
	jal DrawVerticalLine

	li $a0, 61
	li $a1, 79
	li $a3, 81
	jal DrawVerticalLine

	li $a0, 65
	li $a1, 79
	li $a3, 81
	jal DrawVerticalLine


	li $a0, 61
	li $a1, 77
	li $a3, 79
	jal DrawVerticalLine

	li $a0, 65
	li $a1, 77
	li $a3, 79
	jal DrawVerticalLine

	li $a0, 62
	li $a1, 77
	li $a3, 79
	jal DrawVerticalLine

	li $a0, 64
	li $a1, 77
	li $a3, 79
	jal DrawVerticalLine

	li $a0, 63
	li $a1, 77
	li $a3, 79
	jal DrawVerticalLine



	#cabelito=====================

	li $a0, 51
	li $a1, 91
	addi $a2, $0, 0x00FFFF00
	li $a3, 106
	jal DrawVerticalLine

	li $a0, 75
	li $a1, 91
	li $a3, 106
	jal DrawVerticalLine

	li $a0, 52
	li $a1, 88
	li $a3, 91
	jal DrawVerticalLine

	li $a0, 74
	li $a1, 88
	li $a3, 91
	jal DrawVerticalLine

	li $a0, 53
	li $a1, 88
	li $a3, 91
	jal DrawVerticalLine

	li $a0, 73
	li $a1, 88
	li $a3, 91
	jal DrawVerticalLine

	li $a0, 54
	li $a1, 85
	li $a3, 88
	jal DrawVerticalLine

	li $a0, 72
	li $a1, 85
	li $a3, 88
	jal DrawVerticalLine

	li $a0, 55
	li $a1, 85
	li $a3, 88
	jal DrawVerticalLine

	li $a0, 71
	li $a1, 85
	li $a3, 88
	jal DrawVerticalLine



	li $a0, 56
	li $a1, 83
	li $a3, 85
	jal DrawVerticalLine

	li $a0, 70
	li $a1, 83
	li $a3, 85
	jal DrawVerticalLine

	li $a0, 57
	li $a1, 83
	li $a3, 85
	jal DrawVerticalLine

	li $a0, 69
	li $a1, 83
	li $a3, 85
	jal DrawVerticalLine






	li $a0, 58
	li $a1, 81
	li $a3, 83
	jal DrawVerticalLine

	li $a0, 68
	li $a1, 81
	li $a3, 83
	jal DrawVerticalLine

	li $a0, 59
	li $a1, 81
	li $a3, 83
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 81
	li $a3, 83
	jal DrawVerticalLine




	li $a0, 60
	li $a1, 79
	li $a3, 81
	jal DrawVerticalLine

	li $a0, 66
	li $a1, 79
	li $a3, 81
	jal DrawVerticalLine

	li $a0, 61
	li $a1, 79
	li $a3, 81
	jal DrawVerticalLine

	li $a0, 65
	li $a1, 79
	li $a3, 81
	jal DrawVerticalLine


	li $a0, 61
	li $a1, 77
	li $a3, 79
	jal DrawVerticalLine

	li $a0, 65
	li $a1, 77
	li $a3, 79
	jal DrawVerticalLine

	li $a0, 62
	li $a1, 77
	li $a3, 79
	jal DrawVerticalLine

	li $a0, 64
	li $a1, 77
	li $a3, 79
	jal DrawVerticalLine

	li $a0, 63
	li $a1, 77
	li $a3, 79
	jal DrawVerticalLine





	#chapeleira========================



	#chapeleira========================

	li $a0, 51
	li $a1, 84
	red
	li $a3, 90
	jal DrawVerticalLine

	li $a0, 75
	li $a1, 84
	li $a3, 90
	jal DrawVerticalLine

	li $a0, 52
	li $a1, 81
	li $a3, 87
	jal DrawVerticalLine

	li $a0, 74
	li $a1, 81
	li $a3, 87
	jal DrawVerticalLine

	li $a0, 53
	li $a1, 81
	li $a3, 87
	jal DrawVerticalLine

	li $a0, 73
	li $a1, 81
	li $a3, 87
	jal DrawVerticalLine

	li $a0, 54
	li $a1, 78
	li $a3, 84
	jal DrawVerticalLine

	li $a0, 72
	li $a1, 78
	li $a3, 84
	jal DrawVerticalLine

	li $a0, 55
	li $a1, 78
	li $a3, 84
	jal DrawVerticalLine

	li $a0, 71
	li $a1, 78
	li $a3, 84
	jal DrawVerticalLine

	li $a0, 56
	li $a1, 76
	li $a3, 82
	jal DrawVerticalLine

	li $a0, 70
	li $a1, 76
	li $a3, 82
	jal DrawVerticalLine

	li $a0, 57
	li $a1, 76
	li $a3, 82
	jal DrawVerticalLine

	li $a0, 69
	li $a1, 76
	li $a3, 82
	jal DrawVerticalLine

	li $a0, 58
	li $a1, 74
	li $a3, 80
	jal DrawVerticalLine

	li $a0, 68
	li $a1, 74
	li $a3, 80
	jal DrawVerticalLine

	li $a0, 59
	li $a1, 74
	li $a3, 80
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 74
	li $a3, 80
	jal DrawVerticalLine

	li $a0, 60
	li $a1, 72
	li $a3, 78
	jal DrawVerticalLine

	li $a0, 66
	li $a1, 72
	li $a3, 78
	jal DrawVerticalLine

	li $a0, 61
	li $a1, 70
	li $a3, 76
	jal DrawVerticalLine

	li $a0, 65
	li $a1, 70
	li $a3, 76
	jal DrawVerticalLine

	li $a0, 62
	li $a1, 68
	li $a3, 76
	jal DrawVerticalLine

	li $a0, 64
	li $a1, 68
	li $a3, 76
	jal DrawVerticalLine

	li $a0, 63
	li $a1, 68
	li $a3, 76
	jal DrawVerticalLine

	# Olhos-------------------------------------------------------
	li $a0, 59
	li $a1, 95
	black
	li $a3, 102
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 95
	li $a3, 102
	jal DrawVerticalLine

	#bracos----------------------------------------------------------

	li $a0, 28
	li $a1, 110
	pink
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 98
	li $a1, 110
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 29
	li $a1, 109
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 97
	li $a1, 109
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 30
	li $a1, 109
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 95
	li $a1, 107
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 31
	li $a1, 107
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 97
	li $a1, 107
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 32
	li $a1, 107
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 96
	li $a1, 107
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 33
	li $a1, 105
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 94
	li $a1, 105
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 34
	li $a1, 105
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 93
	li $a1, 105
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 92
	li $a1, 105
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 35
	li $a1, 103
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 91
	li $a1, 103
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 36
	li $a1, 103
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 90
	li $a1, 103
	li $a3, 127
	jal DrawVerticalLine





	#Peninha---------------------------------

	li $a0, 69
	li $a1, 76
	addi $a2, $0, 0x00FFD700
	li $a3, 72
	jal DrawHorizontalLine

	li $a0, 72
	li $a1, 77
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 72
	li $a1, 76
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 72
	li $a1, 75
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 75
	li $a1, 76
	li $a3, 76
	jal DrawHorizontalLine

	#animacoes papa--------------------------

	li $a0, 1000
	li $v0, 32
	syscall

	li $a0, 59
	li $a1, 95
	pink
	li $a3, 98
	jal DrawVerticalLine

	li $a0, 59
	li $a1, 100
	li $a3, 103
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 95
	li $a3, 98
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 100
	li $a3, 103
	jal DrawVerticalLine

	li $a0, 1000
	li $v0, 32
	syscall

	li $a0, 59
	li $a1, 95
	black
	li $a3, 98
	jal DrawVerticalLine

	li $a0, 59
	li $a1, 100
	black
	li $a3, 103
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 95
	li $a3, 98
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 100
	li $a3, 103
	jal DrawVerticalLine

.end_macro

.macro plebeu
	#Fundo--------------------------------------------------------------
	li $a0, 0
	li $a1, 127
	silver
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 126
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 125
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 124
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 123
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 122
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 121
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 120
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 119
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 118
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 117
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 116
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 115
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 114
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 113
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 112
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 111
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 110
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 109
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 108
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 107
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 106
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 105
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 104
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 103
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 102
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 101
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 100
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 99
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 98
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 97
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 96
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 95
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 94
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 93
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 92
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 91
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 90
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 89
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 88
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 87
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 86
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 85
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 84
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 83
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 82
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 81
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 80
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 79
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 78
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 77
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 76
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 75
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 74
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 73
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 72
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 71
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 70
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 69
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 68
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 67
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 66
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 65
	li $a3, 127
	jal DrawHorizontalLine


	#Corpo do Plebeu--------------------------------------------------------------
	li $a0, 28			# coordenada x inicial
	li $a1, 127			# coordenada y
	coral			# cor
	li $a3, 98			# coordenada x final
	jal DrawHorizontalLine

	# desenhar linha vertical
	li $a0, 28			# coordenada x
	li $a1, 110			# coordenada y inicial
	coral			# cor
	li $a3, 127			# coordenada y final
	jal DrawVerticalLine

	li $a0, 98
	li $a1, 110
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 28
	li $a1, 126
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 125
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 124
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 123
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 122
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 121
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 120
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 119
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 118
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 117
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 116
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 115
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 114
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 113
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 112
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 111
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 110
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 29
	li $a1, 109
	li $a3, 97
	jal DrawHorizontalLine

	li $a0, 31
	li $a1, 108
	li $a3, 95
	jal DrawHorizontalLine

	li $a0, 31
	li $a1, 107
	li $a3, 95
	jal DrawHorizontalLine

	li $a0, 33
	li $a1, 106
	li $a3, 93
	jal DrawHorizontalLine

	li $a0, 33
	li $a1, 105
	li $a3, 93
	jal DrawHorizontalLine

	li $a0, 35
	li $a1, 104
	li $a3, 91
	jal DrawHorizontalLine

	li $a0, 35
	li $a1, 103
	li $a3, 91
	jal DrawHorizontalLine

	li $a0, 39
	li $a1, 102
	li $a3, 87
	jal DrawHorizontalLine

	li $a0, 43
	li $a1, 101
	li $a3, 83
	jal DrawHorizontalLine

	li $a0, 47
	li $a1, 100
	li $a3, 79
	jal DrawHorizontalLine

	#Cabeca--------------------------------------------------

	li $a0, 51
	li $a1, 85
	pink
	li $a3, 110
	jal DrawVerticalLine

	li $a0, 75
	li $a1, 85
	li $a3, 110
	jal DrawVerticalLine

	li $a0, 51			# coordenada x
	li $a1, 90			# coordenada y inicial			# cor
	li $a3, 110			# coordenada y final
	jal DrawVerticalLine

	li $a0, 75
	li $a1, 90
	li $a3, 110
	jal DrawVerticalLine

	li $a0, 51
	li $a1, 110
	pink
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 52
	li $a1, 111
	li $a3, 74
	jal DrawHorizontalLine

	li $a0, 52
	li $a1, 112
	li $a3, 74
	jal DrawHorizontalLine

	li $a0, 53
	li $a1, 113
	li $a3, 73
	jal DrawHorizontalLine

	li $a0, 53
	li $a1, 114
	li $a3, 73
	jal DrawHorizontalLine

	li $a0, 55
	li $a1, 115
	li $a3, 71
	jal DrawHorizontalLine

	li $a0, 57
	li $a1, 116
	li $a3, 69
	jal DrawHorizontalLine

	li $a0, 59
	li $a1, 117
	li $a3, 67
	jal DrawHorizontalLine

	li $a0, 61
	li $a1, 118
	li $a3, 65
	jal DrawHorizontalLine

	li $a0, 62
	li $a1, 119
	li $a3, 64
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 109
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 108
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 107
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 106
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 105
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 104
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 103
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 102
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 101
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 100
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 99
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 98
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 97
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 96
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 95
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 94
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 93
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 92
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 91
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 90
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 85
	li $a3, 110
	jal DrawVerticalLine

	li $a0, 75
	li $a1, 85
	li $a3, 110
	jal DrawVerticalLine

	li $a0, 75
	li $a1, 85
	pink
	li $a3, 92
	jal DrawVerticalLine

	li $a0, 51
	li $a1, 85
	li $a3, 92
	jal DrawVerticalLine

	li $a0, 52
	li $a1, 82
	li $a3, 92
	jal DrawVerticalLine

	li $a0, 74
	li $a1, 82
	li $a3, 92
	jal DrawVerticalLine

	li $a0, 53
	li $a1, 82
	li $a3, 91
	jal DrawVerticalLine

	li $a0, 73
	li $a1, 82
	li $a3, 91
	jal DrawVerticalLine

	li $a0, 54
	li $a1, 79
	li $a3, 90
	jal DrawVerticalLine

	li $a0, 72
	li $a1, 79
	li $a3, 90
	jal DrawVerticalLine

	li $a0, 55
	li $a1, 79
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 71
	li $a1, 79
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 56
	li $a1, 77
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 70
	li $a1, 77
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 57
	li $a1, 77
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 69
	li $a1, 77
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 58
	li $a1, 75
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 68
	li $a1, 75
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 59
	li $a1, 75
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 75
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 60
	li $a1, 73
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 66
	li $a1, 73
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 61
	li $a1, 73
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 65
	li $a1, 73
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 62
	li $a1, 71
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 64
	li $a1, 71
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 63
	li $a1, 71
	li $a3, 89
	jal DrawVerticalLine

	#olhos----------------------------------------------------

	li $a0, 59
	li $a1, 92
	black
	li $a3, 94
	jal DrawVerticalLine

	li $a0, 58
	li $a1, 92
	li $a3, 94
	jal DrawVerticalLine

	li $a0, 68
	li $a1, 92
	li $a3, 93
	jal DrawVerticalLine

	li $a0, 57
	li $a1, 91
	li $a3, 91
	jal DrawVerticalLine


	li $a0, 58
	li $a1, 90
	li $a3, 90
	jal DrawVerticalLine

	li $a0, 59
	li $a1, 89
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 60
	li $a1, 88
	li $a3, 88
	jal DrawVerticalLine

	li $a0, 70
	li $a1, 91
	li $a3, 91
	jal DrawVerticalLine

	li $a0, 69
	li $a1, 90
	li $a3, 90
	jal DrawVerticalLine

	li $a0, 68
	li $a1, 89
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 88
	li $a3, 88
	jal DrawVerticalLine

	#bracos----------------------------------------------------------

	li $a0, 28
	li $a1, 110
	pink
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 98
	li $a1, 110
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 29
	li $a1, 109
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 97
	li $a1, 109
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 30
	li $a1, 109
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 95
	li $a1, 107
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 31
	li $a1, 107
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 97
	li $a1, 107
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 32
	li $a1, 107
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 96
	li $a1, 107
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 33
	li $a1, 105
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 94
	li $a1, 105
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 34
	li $a1, 105
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 93
	li $a1, 105
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 92
	li $a1, 105
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 35
	li $a1, 103
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 91
	li $a1, 103
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 36
	li $a1, 103
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 90
	li $a1, 103
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 1000
	li $v0, 32
	syscall
	#animacoes plebeu-------------------------------------------------------

	#animacoes plebeu-------------------------------------------------------


	li $a0, 58
	li $a1, 92
	black
	li $a3, 92
	jal DrawVerticalLine

	li $a0, 58
	li $a1, 92
	black
	li $a3, 92
	jal DrawVerticalLine

	li $a0, 58
	li $a1, 92
	li $a3, 94
	jal DrawVerticalLine

	li $a0, 68
	li $a1, 92
	li $a3, 93
	jal DrawVerticalLine

	li $a0, 57
	li $a1, 91
	li $a3, 91
	jal DrawVerticalLine


	li $a0, 58
	li $a1, 90
	li $a3, 90
	jal DrawVerticalLine

	li $a0, 59
	li $a1, 89
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 60
	li $a1, 88
	li $a3, 88
	jal DrawVerticalLine

	li $a0, 70
	li $a1, 91
	li $a3, 91
	jal DrawVerticalLine

	li $a0, 69
	li $a1, 90
	li $a3, 90
	jal DrawVerticalLine

	li $a0, 68
	li $a1, 89
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 88
	li $a3, 88
	jal DrawVerticalLine

	li $a0, 1000
	li $v0, 32
	syscall

	li $a0, 59
	li $a1, 93
	pink
	li $a3, 93
	jal DrawVerticalLine

	li $a0, 58
	li $a1, 92
	li $a3, 92
	jal DrawVerticalLine

	li $a0, 58
	li $a1, 94
	li $a3, 94
	jal DrawVerticalLine

	li $a0, 59
	li $a1, 92
	li $a3, 92
	jal DrawVerticalLine

	li $a0, 59
	li $a1, 94
	li $a3, 94
	jal DrawVerticalLine

	li $a0, 57
	li $a1, 93
	black
	li $a3, 93
	jal DrawVerticalLine




	li $a0, 1000
	li $v0, 32
	syscall

	li $a0, 59
	li $a1, 93
	black
	li $a3, 93
	jal DrawVerticalLine

	li $a0, 58
	li $a1, 92
	li $a3, 92
	jal DrawVerticalLine

	li $a0, 58
	li $a1, 94
	li $a3, 94
	jal DrawVerticalLine

	li $a0, 59
	li $a1, 94
	li $a3, 94
	jal DrawVerticalLine

	li $a0, 59
	li $a1, 92
	li $a3, 92
	jal DrawVerticalLine

	li $a0, 57
	li $a1, 92
	pink
	li $a3, 92
	jal DrawVerticalLine

	li $a0, 57
	li $a1, 94
	li $a3, 94
	jal DrawVerticalLine

	li $a0, 57
	li $a1, 93
	li $a3, 93
	jal DrawVerticalLine

.end_macro

.macro morte

	li $a0, 0
	li $a1, 127
	addi $a2, $0, 0x00000000
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 126
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 125
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 124
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 123
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 122
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 121
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 120
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 119
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 118
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 117
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 116
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 115
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 114
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 113
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 112
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 111
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 110
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 109
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 108
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 107
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 106
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 105
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 104
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 103
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 102
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 101
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 100
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 99
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 98
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 97
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 96
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 95
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 94
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 93
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 92
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 91
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 90
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 89
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 88
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 87
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 86
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 85
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 84
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 83
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 82
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 81
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 80
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 79
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 78
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 77
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 76
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 75
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 74
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 73
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 72
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 71
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 70
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 69
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 68
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 67
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 66
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 65
	li $a3, 127
	jal DrawHorizontalLine




	#Corpo da Morte--------------------------------------------------------------
	li $a0, 28			# coordenada x inicial
	li $a1, 127			# coordenada y
	slate_gray			# cor
	li $a3, 98			# coordenada x final
	jal DrawHorizontalLine

	# desenhar linha vertical
	li $a0, 28			# coordenada x
	li $a1, 110			# coordenada y inicial
	slate_gray			# cor
	li $a3, 127			# coordenada y final
	jal DrawVerticalLine

	li $a0, 98
	li $a1, 110
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 28
	li $a1, 126
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 125
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 124
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 123
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 122
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 121
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 120
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 119
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 118
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 117
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 116
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 115
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 114
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 113
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 112
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 111
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 110
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 29
	li $a1, 109
	li $a3, 97
	jal DrawHorizontalLine

	li $a0, 31
	li $a1, 108
	li $a3, 95
	jal DrawHorizontalLine

	li $a0, 31
	li $a1, 107
	li $a3, 95
	jal DrawHorizontalLine

	li $a0, 33
	li $a1, 106
	li $a3, 93
	jal DrawHorizontalLine

	li $a0, 33
	li $a1, 105
	li $a3, 93
	jal DrawHorizontalLine

	li $a0, 35
	li $a1, 104
	li $a3, 91
	jal DrawHorizontalLine

	li $a0, 35
	li $a1, 103
	li $a3, 91
	jal DrawHorizontalLine

	li $a0, 39
	li $a1, 102
	li $a3, 87
	jal DrawHorizontalLine

	li $a0, 43
	li $a1, 101
	li $a3, 83
	jal DrawHorizontalLine

	li $a0, 47
	li $a1, 100
	li $a3, 79
	jal DrawHorizontalLine

	li $a0, 51			# coordenada x
	li $a1, 90			# coordenada y inicial
	addi $a2, $0, 0x00000000			# cor
	li $a3, 110			# coordenada y final
	jal DrawVerticalLine

	li $a0, 75
	li $a1, 90
	li $a3, 110
	jal DrawVerticalLine

	li $a0, 51
	li $a1, 110
	addi $a2, $0, 0x00000000
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 52
	li $a1, 111
	li $a3, 74
	jal DrawHorizontalLine

	li $a0, 52
	li $a1, 112
	li $a3, 74
	jal DrawHorizontalLine

	li $a0, 53
	li $a1, 113
	li $a3, 73
	jal DrawHorizontalLine

	li $a0, 53
	li $a1, 114
	li $a3, 73
	jal DrawHorizontalLine

	li $a0, 55
	li $a1, 115
	li $a3, 71
	jal DrawHorizontalLine

	li $a0, 57
	li $a1, 116
	li $a3, 69
	jal DrawHorizontalLine

	li $a0, 59
	li $a1, 117
	li $a3, 67
	jal DrawHorizontalLine

	li $a0, 61
	li $a1, 118
	li $a3, 65
	jal DrawHorizontalLine

	li $a0, 62
	li $a1, 119
	li $a3, 64
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 109
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 108
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 107
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 106
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 105
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 104
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 103
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 102
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 101
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 100
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 99
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 98
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 97
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 96
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 95
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 94
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 93
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 92
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 91
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 90
	li $a3, 75
	jal DrawHorizontalLine

	# Olhos-------------------------------------------------------
	li $a0, 59
	li $a1, 95
	darkred
	li $a3, 102
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 95
	li $a3, 102
	jal DrawVerticalLine

	#Chapeu-------------------------------------------------------
	li $a0, 75
	li $a1, 83
	dim_gray
	li $a3, 114
	jal DrawVerticalLine

	li $a0, 51
	li $a1, 83
	li $a3, 114
	jal DrawVerticalLine

	li $a0, 74
	li $a1, 81
	li $a3, 113
	jal DrawVerticalLine

	li $a0, 52
	li $a1, 81
	li $a3, 113
	jal DrawVerticalLine

	li $a0, 73
	li $a1, 80
	li $a3, 105
	jal DrawVerticalLine

	li $a0, 53
	li $a1, 80
	li $a3, 105
	jal DrawVerticalLine

	li $a0, 72
	li $a1, 80
	li $a3, 103
	jal DrawVerticalLine

	li $a0, 54
	li $a1, 80
	li $a3, 103
	jal DrawVerticalLine

	li $a0, 71
	li $a1, 79
	li $a3, 101
	jal DrawVerticalLine

	li $a0, 55
	li $a1, 79
	li $a3, 101
	jal DrawVerticalLine

	li $a0, 70
	li $a1, 78
	li $a3, 98
	jal DrawVerticalLine

	li $a0, 56
	li $a1, 78
	li $a3, 98
	jal DrawVerticalLine

	li $a0, 69
	li $a1, 77
	li $a3, 96
	jal DrawVerticalLine

	li $a0, 57
	li $a1, 77
	li $a3, 96
	jal DrawVerticalLine

	li $a0, 68
	li $a1, 77
	li $a3, 94
	jal DrawVerticalLine

	li $a0, 58
	li $a1, 77
	li $a3, 94
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 76
	li $a3, 92
	jal DrawVerticalLine

	li $a0, 59
	li $a1, 76
	li $a3, 92
	jal DrawVerticalLine

	li $a0, 66
	li $a1, 75
	li $a3, 91
	jal DrawVerticalLine

	li $a0, 60
	li $a1, 75
	li $a3, 91
	jal DrawVerticalLine

	li $a0, 65
	li $a1, 75
	li $a3, 90
	jal DrawVerticalLine

	li $a0, 61
	li $a1, 75
	li $a3, 90
	jal DrawVerticalLine

	li $a0, 64
	li $a1, 74
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 62
	li $a1, 74
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 63
	li $a1, 74
	li $a3, 89
	jal DrawVerticalLine



	#Cruz---------------------------------------------------------
			li $a0, 93
	li $a1, 77
	addi $a2, $0, 0x00A52A2A
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 94
	li $a1, 77
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 92
	li $a1, 82
	dim_gray
	li $a3, 85
	jal DrawVerticalLine

	#cabo
		li $a0, 93
	li $a1, 77
	addi $a2, $0, 0x00A52A2A
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 94
	li $a1, 77
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 92
	li $a1, 82
	dim_gray
	li $a3, 85
	jal DrawVerticalLine

	#cabo
	li $a0, 92
	li $a1, 82
	dim_gray
	li $a3, 105
	jal DrawHorizontalLine

	li $a0, 92
	li $a1, 83
	li $a3, 105
	jal DrawHorizontalLine

	li $a0, 92
	li $a1, 84
	li $a3, 105
	jal DrawHorizontalLine

	li $a0, 92
	li $a1, 85
	li $a3, 105
	jal DrawHorizontalLine




	li $a0, 105
	li $a1, 83
	li $a3, 110
	jal DrawHorizontalLine

	li $a0, 105
	li $a1, 84
	li $a3, 110
	jal DrawHorizontalLine

	li $a0, 105
	li $a1, 85
	li $a3, 110
	jal DrawHorizontalLine

	li $a0, 105
	li $a1, 86
	li $a3, 110
	jal DrawHorizontalLine




	li $a0, 110
	li $a1, 84
	li $a3, 115
	jal DrawHorizontalLine

	li $a0, 110
	li $a1, 85
	li $a3, 115
	jal DrawHorizontalLine

	li $a0, 110
	li $a1, 86
	li $a3, 115
	jal DrawHorizontalLine

	li $a0, 110
	li $a1, 87
	li $a3, 115
	jal DrawHorizontalLine



	li $a0, 115
	li $a1, 85
	li $a3, 118
	jal DrawHorizontalLine

	li $a0, 115
	li $a1, 86
	li $a3, 118
	jal DrawHorizontalLine

	li $a0, 115
	li $a1, 87
	li $a3, 118
	jal DrawHorizontalLine

	li $a0, 115
	li $a1, 88
	li $a3, 118
	jal DrawHorizontalLine



	li $a0, 118
	li $a1, 86
	li $a3, 121
	jal DrawHorizontalLine

	li $a0, 118
	li $a1, 87
	li $a3, 121
	jal DrawHorizontalLine

	li $a0, 118
	li $a1, 88
	li $a3, 121
	jal DrawHorizontalLine

	li $a0, 118
	li $a1, 89
	li $a3, 121
	jal DrawHorizontalLine



	li $a0, 121
	li $a1, 87
	li $a3, 123
	jal DrawHorizontalLine

	li $a0, 121
	li $a1, 88
	li $a3, 123
	jal DrawHorizontalLine

	li $a0, 121
	li $a1, 89
	li $a3, 123
	jal DrawHorizontalLine





	li $a0, 123
	li $a1, 88
	li $a3, 125
	jal DrawHorizontalLine

	li $a0, 123
	li $a1, 89
	li $a3, 125
	jal DrawHorizontalLine

	li $a0, 125
	li $a1, 89
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 125
	li $a1, 90
	li $a3, 127
	jal DrawHorizontalLine



	#animacoes------------------------------------------

	li $a0, 1000
	li $v0, 32
	syscall

	li $a0, 59
	li $a1, 95
	addi $a2, $0, 0x00000000
	li $a3, 97
	jal DrawVerticalLine

	li $a0, 59
	li $a1, 100
	addi $a2, $0, 0x00000000
	li $a3, 102
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 95
	li $a3, 97
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 100
	li $a3, 102
	jal DrawVerticalLine

	li $a0, 1000
	li $v0, 32
	syscall

	li $a0, 59
	li $a1, 95
	darkred
	li $a3, 102
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 95
	li $a3, 102
	jal DrawVerticalLine

	li $a0, 1000
	li $v0, 32
	syscall

	li $a0, 28
	li $a1, 109
	slate_gray
	li $a3, 28
	jal DrawHorizontalLine

	li $a0, 98
	li $a1, 109
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 29
	li $a1, 108
	li $a3, 29
	jal DrawHorizontalLine

	li $a0, 97
	li $a1, 108
	li $a3, 97
	jal DrawHorizontalLine

	li $a0, 30
	li $a1, 108
	li $a3, 30
	jal DrawHorizontalLine

	li $a0, 96
	li $a1, 108
	li $a3, 96
	jal DrawHorizontalLine

	li $a0, 31
	li $a1, 106
	li $a3, 31
	jal DrawHorizontalLine

	li $a0, 95
	li $a1, 106
	li $a3, 95
	jal DrawHorizontalLine

	li $a0, 32
	li $a1, 106
	li $a3, 32
	jal DrawHorizontalLine

	li $a0, 94
	li $a1, 106
	li $a3, 94
	jal DrawHorizontalLine

	li $a0, 33
	li $a1, 104
	li $a3, 33
	jal DrawHorizontalLine

	li $a0, 93
	li $a1, 104
	li $a3, 93
	jal DrawHorizontalLine

	li $a0, 34
	li $a1, 104
	li $a3, 34
	jal DrawHorizontalLine

	li $a0, 92
	li $a1, 104
	li $a3, 92
	jal DrawHorizontalLine

	li $a0, 35
	li $a1, 102
	li $a3, 35
	jal DrawHorizontalLine

	li $a0, 91
	li $a1, 102
	li $a3, 91
	jal DrawHorizontalLine


	li $a0, 36
	li $a1, 102
	li $a3, 36
	jal DrawHorizontalLine

	li $a0, 90
	li $a1, 102
	li $a3, 90
	jal DrawHorizontalLine

	li $a0, 37
	li $a1, 102
	li $a3, 28
	jal DrawHorizontalLine

	li $a0, 89
	li $a1, 102
	li $a3, 89
	jal DrawHorizontalLine

	li $a0, 38
	li $a1, 101
	li $a3, 38
	jal DrawHorizontalLine

	li $a0, 88
	li $a1, 101
	li $a3, 88
	jal DrawHorizontalLine

	li $a0, 39
	li $a1, 101
	li $a3, 39
	jal DrawHorizontalLine

	li $a0, 87
	li $a1, 101
	li $a3, 87
	jal DrawHorizontalLine

	li $a0, 40
	li $a1, 101
	li $a3, 40
	jal DrawHorizontalLine

	li $a0, 86
	li $a1, 101
	li $a3, 86
	jal DrawHorizontalLine





	li $a0, 1000
	li $v0, 32
	syscall






	li $a0, 28
	li $a1, 109
	black
	li $a3, 28
	jal DrawHorizontalLine

	li $a0, 98
	li $a1, 109
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 29
	li $a1, 108
	li $a3, 29
	jal DrawHorizontalLine

	li $a0, 97
	li $a1, 108
	li $a3, 97
	jal DrawHorizontalLine

	li $a0, 30
	li $a1, 108
	li $a3, 30
	jal DrawHorizontalLine

	li $a0, 96
	li $a1, 108
	li $a3, 96
	jal DrawHorizontalLine

	li $a0, 31
	li $a1, 106
	li $a3, 31
	jal DrawHorizontalLine

	li $a0, 95
	li $a1, 106
	li $a3, 95
	jal DrawHorizontalLine

	li $a0, 32
	li $a1, 106
	li $a3, 32
	jal DrawHorizontalLine

	li $a0, 94
	li $a1, 106
	li $a3, 94
	jal DrawHorizontalLine

	li $a0, 33
	li $a1, 104
	li $a3, 33
	jal DrawHorizontalLine

	li $a0, 93
	li $a1, 104
	li $a3, 93
	jal DrawHorizontalLine

	li $a0, 34
	li $a1, 104
	li $a3, 34
	jal DrawHorizontalLine

	li $a0, 92
	li $a1, 104
	li $a3, 92
	jal DrawHorizontalLine

	li $a0, 35
	li $a1, 102
	li $a3, 35
	jal DrawHorizontalLine

	li $a0, 91
	li $a1, 102
	li $a3, 91
	jal DrawHorizontalLine


	li $a0, 36
	li $a1, 102
	li $a3, 36
	jal DrawHorizontalLine

	li $a0, 90
	li $a1, 102
	li $a3, 90
	jal DrawHorizontalLine

	li $a0, 37
	li $a1, 102
	li $a3, 28
	jal DrawHorizontalLine

	li $a0, 89
	li $a1, 102
	li $a3, 89
	jal DrawHorizontalLine

	li $a0, 38
	li $a1, 101
	li $a3, 38
	jal DrawHorizontalLine

	li $a0, 88
	li $a1, 101
	li $a3, 88
	jal DrawHorizontalLine

	li $a0, 39
	li $a1, 101
	li $a3, 39
	jal DrawHorizontalLine

	li $a0, 87
	li $a1, 101
	li $a3, 87
	jal DrawHorizontalLine

	li $a0, 40
	li $a1, 101
	li $a3, 40
	jal DrawHorizontalLine

	li $a0, 86
	li $a1, 101
	li $a3, 86
	jal DrawHorizontalLine

	li $a0, 1000
	li $v0, 32
	syscall




	li $a0, 28
	li $a1, 109
	slate_gray
	li $a3, 28
	jal DrawHorizontalLine

	li $a0, 98
	li $a1, 109
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 29
	li $a1, 108
	li $a3, 29
	jal DrawHorizontalLine

	li $a0, 97
	li $a1, 108
	li $a3, 97
	jal DrawHorizontalLine

	li $a0, 30
	li $a1, 108
	li $a3, 30
	jal DrawHorizontalLine

	li $a0, 96
	li $a1, 108
	li $a3, 96
	jal DrawHorizontalLine

	li $a0, 31
	li $a1, 106
	li $a3, 31
	jal DrawHorizontalLine

	li $a0, 95
	li $a1, 106
	li $a3, 95
	jal DrawHorizontalLine

	li $a0, 32
	li $a1, 106
	li $a3, 32
	jal DrawHorizontalLine

	li $a0, 94
	li $a1, 106
	li $a3, 94
	jal DrawHorizontalLine

	li $a0, 33
	li $a1, 104
	li $a3, 33
	jal DrawHorizontalLine

	li $a0, 93
	li $a1, 104
	li $a3, 93
	jal DrawHorizontalLine

	li $a0, 34
	li $a1, 104
	li $a3, 34
	jal DrawHorizontalLine

	li $a0, 92
	li $a1, 104
	li $a3, 92
	jal DrawHorizontalLine

	li $a0, 35
	li $a1, 102
	li $a3, 35
	jal DrawHorizontalLine

	li $a0, 91
	li $a1, 102
	li $a3, 91
	jal DrawHorizontalLine


	li $a0, 36
	li $a1, 102
	li $a3, 36
	jal DrawHorizontalLine

	li $a0, 90
	li $a1, 102
	li $a3, 90
	jal DrawHorizontalLine

	li $a0, 37
	li $a1, 102
	li $a3, 28
	jal DrawHorizontalLine

	li $a0, 89
	li $a1, 102
	li $a3, 89
	jal DrawHorizontalLine

	li $a0, 38
	li $a1, 101
	li $a3, 38
	jal DrawHorizontalLine

	li $a0, 88
	li $a1, 101
	li $a3, 88
	jal DrawHorizontalLine

	li $a0, 39
	li $a1, 101
	li $a3, 39
	jal DrawHorizontalLine

	li $a0, 87
	li $a1, 101
	li $a3, 87
	jal DrawHorizontalLine

	li $a0, 40
	li $a1, 101
	li $a3, 40
	jal DrawHorizontalLine

	li $a0, 86
	li $a1, 101
	li $a3, 86
	jal DrawHorizontalLine

	li $a0, 1000
	li $v0, 32
	syscall
.end_macro

.macro general
	#Fundo--------------------------------------------------------------
	li $a0, 0
	li $a1, 127
	addi $a2, $0, 0x00FF0000
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 126
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 125
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 124
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 123
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 122
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 121
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 120
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 119
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 118
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 117
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 116
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 115
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 114
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 113
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 112
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 111
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 110
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 109
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 108
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 107
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 106
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 105
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 104
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 103
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 102
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 101
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 100
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 99
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 98
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 97
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 96
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 95
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 94
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 93
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 92
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 91
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 90
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 89
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 88
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 87
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 86
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 85
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 84
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 83
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 82
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 81
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 80
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 79
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 78
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 77
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 76
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 75
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 74
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 73
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 72
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 71
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 70
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 69
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 68
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 67
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 66
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 65
	li $a3, 127
	jal DrawHorizontalLine


	#Corpo do General--------------------------------------------------------------
	li $a0, 28			# coordenada x inicial
	li $a1, 127			# coordenada y
	addi $a2, $0, 0x00000000			# cor
	li $a3, 98			# coordenada x final
	jal DrawHorizontalLine

	# desenhar linha vertical
	li $a0, 28			# coordenada x
	li $a1, 110			# coordenada y inicial
	addi $a2, $0, 0x00000000			# cor
	li $a3, 127			# coordenada y final
	jal DrawVerticalLine

	li $a0, 98
	li $a1, 110
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 28
	li $a1, 126
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 125
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 124
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 123
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 122
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 121
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 120
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 119
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 118
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 117
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 116
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 115
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 114
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 113
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 112
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 111
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 110
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 29
	li $a1, 109
	li $a3, 97
	jal DrawHorizontalLine

	li $a0, 31
	li $a1, 108
	li $a3, 95
	jal DrawHorizontalLine

	li $a0, 31
	li $a1, 107
	li $a3, 95
	jal DrawHorizontalLine

	li $a0, 33
	li $a1, 106
	li $a3, 93
	jal DrawHorizontalLine

	li $a0, 33
	li $a1, 105
	li $a3, 93
	jal DrawHorizontalLine

	li $a0, 35
	li $a1, 104
	li $a3, 91
	jal DrawHorizontalLine

	li $a0, 35
	li $a1, 103
	li $a3, 91
	jal DrawHorizontalLine

	li $a0, 39
	li $a1, 102
	li $a3, 87
	jal DrawHorizontalLine

	li $a0, 43
	li $a1, 101
	li $a3, 83
	jal DrawHorizontalLine

	li $a0, 47
	li $a1, 100
	li $a3, 79
	jal DrawHorizontalLine

	#Caebca--------------------------------------------------------

	li $a0, 44
	li $a1, 85
	addi $a2, $0, 0x00808080
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 82
	li $a1, 85
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 45
	li $a1, 83
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 81
	li $a1, 83
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 46
	li $a1, 81
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 80
	li $a1, 81
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 47
	li $a1, 79
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 79
	li $a1, 79
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 48
	li $a1, 77
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 78
	li $a1, 77
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 49
	li $a1, 75
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 77
	li $a1, 75
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 50
	li $a1, 73
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 76
	li $a1, 73
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 51
	li $a1, 71
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 75
	li $a1, 71
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 52
	li $a1, 69
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 74
	li $a1, 69
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 53
	li $a1, 67
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 73
	li $a1, 67
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 54
	li $a1, 65
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 72
	li $a1, 65
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 55
	li $a1, 65
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 71
	li $a1, 65
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 56
	li $a1, 65
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 70
	li $a1, 65
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 57
	li $a1, 65
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 69
	li $a1, 65
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 58
	li $a1, 65
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 68
	li $a1, 65
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 59
	li $a1, 65
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 65
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 60
	li $a1, 65
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 66
	li $a1, 65
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 61
	li $a1, 65
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 65
	li $a1, 65
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 62
	li $a1, 65
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 63
	li $a1, 65
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 64
	li $a1, 65
	li $a3, 127
	jal DrawVerticalLine

	#olhos---------------------------------------------------

	li $a0, 62
	li $a1, 88
	black
	li $a3, 96
	jal DrawVerticalLine

	li $a0, 64
	li $a1, 88
	li $a3, 96
	jal DrawVerticalLine

	li $a0, 60
	li $a1, 89
	black
	li $a3, 96
	jal DrawVerticalLine

	li $a0, 66
	li $a1, 89
	li $a3, 96
	jal DrawVerticalLine

	li $a0, 58
	li $a1, 90
	black
	li $a3, 96
	jal DrawVerticalLine

	li $a0, 68
	li $a1, 90
	li $a3, 96
	jal DrawVerticalLine

	#Rosto---------------------------------------------

	li $a0, 57
	li $a1, 98
	addi $a2, $0, 0x00D2B48C
	li $a3, 101
	jal DrawVerticalLine

	li $a0, 69
	li $a1, 98
	li $a3, 101
	jal DrawVerticalLine

	li $a0, 58
	li $a1, 99
	li $a3, 103
	jal DrawVerticalLine

	li $a0, 68
	li $a1, 99
	li $a3, 103
	jal DrawVerticalLine

	li $a0, 59
	li $a1, 100
	li $a3, 105
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 100
	li $a3, 105
	jal DrawVerticalLine

	li $a0, 60
	li $a1, 101
	li $a3, 107
	jal DrawVerticalLine

	li $a0, 66
	li $a1, 101
	li $a3, 107
	jal DrawVerticalLine

	li $a0, 61
	li $a1, 102
	li $a3, 109
	jal DrawVerticalLine

	li $a0, 65
	li $a1, 102
	li $a3, 109
	jal DrawVerticalLine

	li $a0, 62
	li $a1, 103
	li $a3, 111
	jal DrawVerticalLine

	li $a0, 64
	li $a1, 103
	li $a3, 111
	jal DrawVerticalLine

	li $a0, 63
	li $a1, 104
	li $a3, 113
	jal DrawVerticalLine
.end_macro

.macro papa
	li $a0, 0
	li $a1, 127
	addi $a2, $0, 0x008A2BE2
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 126
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 125
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 124
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 123
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 122
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 121
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 120
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 119
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 118
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 117
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 116
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 115
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 114
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 113
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 112
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 111
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 110
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 109
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 108
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 107
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 106
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 105
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 104
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 103
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 102
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 101
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 100
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 99
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 98
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 97
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 96
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 95
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 94
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 93
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 92
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 91
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 90
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 89
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 88
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 87
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 86
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 85
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 84
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 83
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 82
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 81
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 80
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 79
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 78
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 77
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 76
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 75
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 74
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 73
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 72
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 71
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 70
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 69
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 68
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 67
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 66
	li $a3, 127
	jal DrawHorizontalLine

	li $a0, 0
	li $a1, 65
	li $a3, 127
	jal DrawHorizontalLine




	#Corpo do Papa--------------------------------------------------------------
	li $a0, 28			# coordenada x inicial
	li $a1, 127			# coordenada y
	addi $a2, $0, 0x00FFFFE0			# cor
	li $a3, 98			# coordenada x final
	jal DrawHorizontalLine

	# desenhar linha vertical
	li $a0, 28			# coordenada x
	li $a1, 110			# coordenada y inicial
	addi $a2, $0, 0x00FFFFE0			# cor
	li $a3, 127			# coordenada y final
	jal DrawVerticalLine

	li $a0, 98
	li $a1, 110
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 28
	li $a1, 126
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 125
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 124
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 123
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 122
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 121
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 120
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 119
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 118
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 117
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 116
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 115
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 114
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 113
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 112
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 111
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 28
	li $a1, 110
	li $a3, 98
	jal DrawHorizontalLine

	li $a0, 29
	li $a1, 109
	li $a3, 97
	jal DrawHorizontalLine

	li $a0, 31
	li $a1, 108
	li $a3, 95
	jal DrawHorizontalLine

	li $a0, 31
	li $a1, 107
	li $a3, 95
	jal DrawHorizontalLine

	li $a0, 33
	li $a1, 106
	li $a3, 93
	jal DrawHorizontalLine

	li $a0, 33
	li $a1, 105
	li $a3, 93
	jal DrawHorizontalLine

	li $a0, 35
	li $a1, 104
	li $a3, 91
	jal DrawHorizontalLine

	li $a0, 35
	li $a1, 103
	li $a3, 91
	jal DrawHorizontalLine

	li $a0, 39
	li $a1, 102
	li $a3, 87
	jal DrawHorizontalLine

	li $a0, 43
	li $a1, 101
	li $a3, 83
	jal DrawHorizontalLine

	li $a0, 47
	li $a1, 100
	li $a3, 79
	jal DrawHorizontalLine

	li $a0, 51			# coordenada x
	li $a1, 90			# coordenada y inicial
	addi $a2, $0, 0x00FFE4B5			# cor
	li $a3, 110			# coordenada y final
	jal DrawVerticalLine

	li $a0, 75
	li $a1, 90
	li $a3, 110
	jal DrawVerticalLine

	li $a0, 51
	li $a1, 110
	addi $a2, $0, 0x00FFE4B5
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 52
	li $a1, 111
	li $a3, 74
	jal DrawHorizontalLine

	li $a0, 52
	li $a1, 112
	li $a3, 74
	jal DrawHorizontalLine

	li $a0, 53
	li $a1, 113
	li $a3, 73
	jal DrawHorizontalLine

	li $a0, 53
	li $a1, 114
	li $a3, 73
	jal DrawHorizontalLine

	li $a0, 55
	li $a1, 115
	li $a3, 71
	jal DrawHorizontalLine

	li $a0, 57
	li $a1, 116
	li $a3, 69
	jal DrawHorizontalLine

	li $a0, 59
	li $a1, 117
	li $a3, 67
	jal DrawHorizontalLine

	li $a0, 61
	li $a1, 118
	li $a3, 65
	jal DrawHorizontalLine

	li $a0, 62
	li $a1, 119
	li $a3, 64
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 109
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 108
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 107
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 106
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 105
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 104
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 103
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 102
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 101
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 100
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 99
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 98
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 97
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 96
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 95
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 94
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 93
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 92
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 91
	li $a3, 75
	jal DrawHorizontalLine

	li $a0, 51
	li $a1, 90
	li $a3, 75
	jal DrawHorizontalLine

	# Olhos-------------------------------------------------------
	li $a0, 59
	li $a1, 95
	black
	li $a3, 102
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 95
	li $a3, 102
	jal DrawVerticalLine

	#Chapeu-------------------------------------------------------
	li $a0, 75
	li $a1, 85
	addi $a2, $0, 0x00FFFFE0
	li $a3, 92
	jal DrawVerticalLine

	li $a0, 51
	li $a1, 85
	li $a3, 92
	jal DrawVerticalLine

	li $a0, 52
	li $a1, 82
	li $a3, 92
	jal DrawVerticalLine

	li $a0, 74
	li $a1, 82
	li $a3, 92
	jal DrawVerticalLine

	li $a0, 53
	li $a1, 82
	li $a3, 91
	jal DrawVerticalLine

	li $a0, 73
	li $a1, 82
	li $a3, 91
	jal DrawVerticalLine

	li $a0, 54
	li $a1, 79
	li $a3, 90
	jal DrawVerticalLine

	li $a0, 72
	li $a1, 79
	li $a3, 90
	jal DrawVerticalLine

	li $a0, 55
	li $a1, 79
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 71
	li $a1, 79
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 56
	li $a1, 77
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 70
	li $a1, 77
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 57
	li $a1, 77
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 69
	li $a1, 77
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 58
	li $a1, 75
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 68
	li $a1, 75
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 59
	li $a1, 75
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 75
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 60
	li $a1, 73
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 66
	li $a1, 73
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 61
	li $a1, 73
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 65
	li $a1, 73
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 62
	li $a1, 71
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 64
	li $a1, 71
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 63
	li $a1, 71
	li $a3, 89
	jal DrawVerticalLine

	li $a0, 93
	li $a1, 80
	addi $a2, $0, 0x00FFD700
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 94
	li $a1, 80
	li $a3, 127
	jal DrawVerticalLine

	li $a0, 84
	li $a1, 88
	addi $a2, $0, 0x00FFD700
	li $a3, 103
	jal DrawHorizontalLine

	li $a0, 84
	li $a1, 89
	addi $a2, $0, 0x00FFD700
	li $a3, 103
	jal DrawHorizontalLine

	#animacoes papa--------------------------

	li $a0, 1000
	li $v0, 32
	syscall

	li $a0, 59
	li $a1, 95
	addi $a2, $0, 0x00FFE4B5
	li $a3, 98
	jal DrawVerticalLine

	li $a0, 59
	li $a1, 100
	li $a3, 103
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 95
	li $a3, 98
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 100
	li $a3, 103
	jal DrawVerticalLine

	li $a0, 1000
	li $v0, 32
	syscall

	li $a0, 59
	li $a1, 95
	black
	li $a3, 98
	jal DrawVerticalLine

	li $a0, 59
	li $a1, 100
	black
	li $a3, 103
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 95
	li $a3, 98
	jal DrawVerticalLine

	li $a0, 67
	li $a1, 100
	li $a3, 103
	jal DrawVerticalLine
.end_macro

.macro moldura
	# ---------- borda branca
	# desenhar linha horizontal
	li $a0, 0			# coordenada x inicial
	li $a1, 0			# coordenada y
	lw $a2, white 			# cor
	li $a3, 126			# coordenada x final
	jal DrawHorizontalLine

	# desenhar linha vertical
	li $a0, 0			# coordenada x
	li $a1, 0			# coordenada y inicial
	lw $a2, white			# cor
	li $a3, 63			# coordenada y final
	jal DrawVerticalLine

	li $a0, 0
	li $a1, 64
	li $a3, 127
	jal DrawHorizontalLine


	li $a0, 127
	li $a1, 0
	li $a3, 63
	jal DrawVerticalLine

	# ---------- parte vermelha
	li $a0, 4
	li $a1, 5
	addi $a2, $0, 0x008B0000
	li $a3, 28
	jal DrawVerticalLine

	li $a0, 123
	jal DrawVerticalLine

	li $a0, 4
	li $a1, 4
	li $a3, 123
	jal DrawHorizontalLine

	li $a0, 4
	li $a1, 29
	li $a3, 123
	jal DrawHorizontalLine
.end_macro

.macro indicadores

	#SIM
	lw $a2, white
	li $a0, 18
	li $a1, 42
	li $a3, 24
	jal DrawHorizontalLine

	li $a1, 45
	jal DrawHorizontalLine

	li $a1, 48
	jal DrawHorizontalLine

	li $a1, 42
	li $a3, 45
	jal DrawVerticalLine

	li $a0, 24
	li $a1, 45
	li $a3, 48
	jal DrawVerticalLine

	li $a0, 26
	li $a1, 42
	li $a3, 48
	jal DrawVerticalLine

	li $a0, 28
	jal DrawVerticalLine

	li $a0, 34
	jal DrawVerticalLine

	li $a0, 29
	li $a1, 43
	li $a3, 43
	jal DrawVerticalLine

	li $a0, 30
	li $a1, 44
	li $a3, 44
	jal DrawVerticalLine

	li $a0, 31
	li $a1, 45
	li $a3, 45
	jal DrawVerticalLine

	li $a0, 32
	li $a1, 44
	li $a3, 44
	jal DrawVerticalLine

	li $a0, 33
	li $a1, 43
	li $a3, 43
	jal DrawVerticalLine

	#NAO

	lw $a2, white
	li $a0, 89
	li $a1, 42
	li $a3, 48
	jal DrawVerticalLine
	li $a0, 95
	jal DrawVerticalLine
	li $a0, 97
	jal DrawVerticalLine
	li $a0, 101
	jal DrawVerticalLine
	li $a0, 103
	jal DrawVerticalLine
	li $a0, 107
	jal DrawVerticalLine
	li $a0, 90
	li $a1, 43
	li $a3, 43
	jal DrawVerticalLine
	li $a0, 91
	li $a1, 44
	li $a3, 44
	jal DrawVerticalLine
	li $a0, 92
	li $a1, 45
	li $a3, 45
	jal DrawVerticalLine
	li $a0, 93
	li $a1, 46
	li $a3, 46
	jal DrawVerticalLine
	li $a0, 94
	li $a1, 47
	li $a3, 47
	jal DrawVerticalLine

	li $a0, 97
	li $a1, 42
	li $a3, 101
	jal DrawHorizontalLine
	li $a1, 45
	jal DrawHorizontalLine

	li $a0, 103
	li $a1, 42
	li $a3, 107
	jal DrawHorizontalLine
	li $a1, 48
	jal DrawHorizontalLine

.end_macro



.macro startGame
	reinicia
	lw $a2, white
	#meio
	#li $a0, 18
	#li $a1, 96
	#li $a3, 107
	#jal DrawHorizontalLine
	#cima
	#li $a0, 18
	#li $a1, 85
	#li $a3, 107
	#jal DrawHorizontalLine
	#baixo
	#li $a0, 18
	#li $a1, 107
	#li $a3, 107
	#jal DrawHorizontalLine
	#R
	li $a0, 18
	li $a1, 85
	li $a3, 107
	jal DrawVerticalLine
	li $a0, 19
	jal DrawVerticalLine
	li $a0, 20
	jal DrawVerticalLine
	li $a0, 21
	li $a1, 85
	li $a3, 32
	jal DrawHorizontalLine
	li $a1, 86
	jal DrawHorizontalLine
	li $a1, 87
	jal DrawHorizontalLine
	li $a0, 30
	li $a1, 88
	li $a3, 96
	jal DrawVerticalLine
	li $a0, 31
	jal DrawVerticalLine
	li $a0, 32
	jal DrawVerticalLine
	li $a0, 21
	li $a1, 95
	li $a3, 32
	jal DrawHorizontalLine
	li $a1, 94
	jal DrawHorizontalLine
	li $a1, 96
	jal DrawHorizontalLine
	li $a1, 97
	li $a3, 23
	jal DrawHorizontalLine
	li $a0, 21
	li $a1, 98
	li $a3, 24
	jal DrawHorizontalLine
	li $a0, 22
	li $a1, 99
	li $a3, 25
	jal DrawHorizontalLine
	li $a0, 23
	li $a1, 100
	li $a3, 26
	jal DrawHorizontalLine
	li $a0, 24
	li $a1, 101
	li $a3, 27
	jal DrawHorizontalLine
	li $a0, 25
	li $a1, 102
	li $a3, 28
	jal DrawHorizontalLine
	li $a0, 26
	li $a1, 103
	li $a3, 29
	jal DrawHorizontalLine
	li $a0, 27
	li $a1, 104
	li $a3, 30
	jal DrawHorizontalLine
	li $a0, 28
	li $a1, 105
	li $a3, 31
	jal DrawHorizontalLine
	li $a0, 29
	li $a1, 106
	li $a3, 32
	jal DrawHorizontalLine
	li $a0, 30
	li $a1, 107
	li $a3, 33
	jal DrawHorizontalLine

	#E
	li $a0, 34
	li $a1, 85
	li $a3, 47
	jal DrawHorizontalLine
	li $a1, 86
	jal DrawHorizontalLine
	li $a1, 87
	jal DrawHorizontalLine
	li $a1, 95
	jal DrawHorizontalLine
	li $a1, 96
	jal DrawHorizontalLine
	li $a1, 97
	jal DrawHorizontalLine
	li $a1, 105
	jal DrawHorizontalLine
	li $a1, 106
	jal DrawHorizontalLine
	li $a1, 107
	jal DrawHorizontalLine
	li $a1, 85
	li $a3, 107
	jal DrawVerticalLine
	li $a0, 35
	jal DrawVerticalLine
	li $a0, 36
	jal DrawVerticalLine

	#I
	li $a0, 49
	li $a1, 85
	li $a3, 61
	jal DrawHorizontalLine
	li $a1, 86
	jal DrawHorizontalLine
	li $a1, 87
	jal DrawHorizontalLine
	li $a1, 105
	jal DrawHorizontalLine
	li $a1, 106
	jal DrawHorizontalLine
	li $a1, 107
	jal DrawHorizontalLine
	li $a0, 55
	li $a1, 85
	li $a3, 107
	jal DrawVerticalLine
	li $a0, 54
	jal DrawVerticalLine
	li $a0, 56
	jal DrawVerticalLine

	#G
	li $a0, 63
	li $a1, 85
	li $a3, 75
	jal DrawHorizontalLine
	li $a1, 86
	jal DrawHorizontalLine
	li $a1, 87
	jal DrawHorizontalLine
	li $a1, 105
	jal DrawHorizontalLine
	li $a1, 106
	jal DrawHorizontalLine
	li $a1, 107
	jal DrawHorizontalLine
	li $a1, 85
	li $a3, 107
	jal DrawVerticalLine
	li $a0, 64
	jal DrawVerticalLine
	li $a0, 65
	jal DrawVerticalLine
	li $a0, 73
	li $a1, 96
	li $a3, 107
	jal DrawVerticalLine
	li $a0, 74
	jal DrawVerticalLine
	li $a0, 75
	jal DrawVerticalLine
	li $a0, 70
	li $a3, 72
	jal DrawHorizontalLine
	li $a1, 97
	jal DrawHorizontalLine
	li $a1, 98
	jal DrawHorizontalLine

	#N de 77 a 92
	li $a0, 77
	li $a1, 85
	li $a3, 107
	jal DrawVerticalLine
	li $a0, 78
	jal DrawVerticalLine
	li $a0, 79
	jal DrawVerticalLine
	li $a0, 90
	jal DrawVerticalLine
	li $a0, 91
	jal DrawVerticalLine
	li $a0, 92
	jal DrawVerticalLine
	li $a0, 80
	li $a1, 85
	li $a3, 89
	jal DrawVerticalLine
	li $a0, 81
	li $a1, 87
	li $a3, 91
	jal DrawVerticalLine
	li $a0, 82
	li $a1, 89
	li $a3, 93
	jal DrawVerticalLine
	li $a0, 83
	li $a1, 91
	li $a3, 95
	jal DrawVerticalLine
	li $a0, 84
	li $a1, 93
	li $a3, 97
	jal DrawVerticalLine
	li $a0, 85
	li $a1, 95
	li $a3, 99
	jal DrawVerticalLine
	li $a0, 86
	li $a1, 97
	li $a3, 101
	jal DrawVerticalLine
	li $a0, 87
	li $a1, 99
	li $a3, 103
	jal DrawVerticalLine
	li $a0, 88
	li $a1, 101
	li $a3, 105
	jal DrawVerticalLine
	li $a0, 89
	li $a1, 103
	li $a3, 107
	jal DrawVerticalLine

	#S
	li $a0, 94
	li $a1, 85
	li $a3, 107
	jal DrawHorizontalLine
	li $a1, 86
	jal DrawHorizontalLine
	li $a1, 87
	jal DrawHorizontalLine
	li $a1, 96
	jal DrawHorizontalLine
	li $a1, 95
	jal DrawHorizontalLine
	li $a1, 97
	jal DrawHorizontalLine
	li $a1, 105
	jal DrawHorizontalLine
	li $a1, 106
	jal DrawHorizontalLine
	li $a1, 107
	jal DrawHorizontalLine
	li $a0, 94
	li $a1, 85
	li $a3, 94
	jal DrawVerticalLine
	li $a0, 95
	jal DrawVerticalLine
	li $a0, 96
	jal DrawVerticalLine
	li $a0, 105
	li $a1, 98
	li $a3, 107
	jal DrawVerticalLine
	li $a0, 106
	jal DrawVerticalLine
	li $a0, 107
	jal DrawVerticalLine

	#divisões
	lw $a2, black
	li $a0, 33
	jal DrawVerticalLine
	li $a0, 48
	jal DrawVerticalLine
	li $a0, 62
	jal DrawVerticalLine
	li $a0, 76
	jal DrawVerticalLine
	li $a0, 93
	jal DrawVerticalLine

	pressKey
.end_macro

.macro pressKey
	#PRESS A KEY
	white
	addi $s7, $zero, 43  #base X
	#PRESS
	add $a0, $zero, $s7
	li $a1, 114
	addi $s6, $s7, 2
	add $a3, $zero, $s6
	jal DrawHorizontalLine
	li $a1, 116
	jal DrawHorizontalLine
	add $a0, $zero, $s7
	li $a1, 114
	li $a3, 118
	jal DrawVerticalLine
	add $a0, $zero, $s6
	li $a3, 116
	jal DrawVerticalLine

	addi $a0, $s7, 4
	li $a1, 114
	li $a3, 118
	jal DrawVerticalLine
	addi $a3, $s7, 6
	jal DrawHorizontalLine
	li $a1, 116
	jal DrawHorizontalLine
	addi $a0, $s7, 6
	li $a1, 115
	jal DrawPoint
	li $a1, 118
	jal DrawPoint
	li $a1, 117
	addi $a0, $s7, 5
	jal DrawPoint

	addi $a0, $s7, 8
	li $a1, 114
	li $a3, 118
	jal DrawVerticalLine
	addi $a3, $s7, 10
	jal DrawHorizontalLine
	li $a1, 116
	jal DrawHorizontalLine
	li $a1, 118
	jal DrawHorizontalLine

	addi $a0, $s7, 12
	li $a1, 114
	addi $a3, $s7, 14
	jal DrawHorizontalLine
	li $a1, 115
	jal DrawPoint
	li $a1, 116
	jal DrawHorizontalLine
	li $a1, 118
	jal DrawHorizontalLine
	addi $a0, $s7, 14
	li $a1, 117
	jal DrawPoint

	addi $a0, $s7, 16
	li $a1, 114
	addi $a3, $s7, 18
	jal DrawHorizontalLine
	li $a1, 115
	jal DrawPoint
	li $a1, 116
	jal DrawHorizontalLine
	li $a1, 118
	jal DrawHorizontalLine
	addi $a0, $s7, 18
	li $a1, 117
	jal DrawPoint

	addi $a0, $s7, 22
	li $a1, 114
	addi $a3, $s7, 24
	jal DrawHorizontalLine
	li $a3, 118
	jal DrawVerticalLine
	addi $a0, $s7, 24
	jal DrawVerticalLine
	li $a1, 116
	addi $a0, $s7, 23
	jal DrawPoint

	addi $a0, $s7, 28
	li $a1, 114
	li $a3, 118
	jal DrawVerticalLine
	addi $a0, $a0, 1
	li $a1, 115
	jal DrawPoint
	li $a1, 117
	jal DrawPoint
	addi $a0, $a0, 1
	li $a1, 114
	jal DrawPoint
	li $a1, 118
	jal DrawPoint

	addi $a0, $s7, 32
	li $a1, 114
	li $a3, 118
	jal DrawVerticalLine
	addi $a3, $s7, 34
	jal DrawHorizontalLine
	li $a1, 116
	jal DrawHorizontalLine
	li $a1, 118
	jal DrawHorizontalLine

	addi $a0, $s7, 36
	li $a1, 114
	li $a3, 116
	jal DrawVerticalLine
	addi $a0, $a0, 2
	jal DrawVerticalLine
	addi $a0, $a0, -1
	li $a1, 116
	li $a3, 118
	jal DrawVerticalLine

	li $v0, 12 #le char, retorno no proprio v0
	syscall
.end_macro

.macro pintadepreto
	li $a1, 7
	jal DrawHorizontalLine
	li $a1, 8
	jal DrawHorizontalLine
	li $a1, 9
	jal DrawHorizontalLine
	li $a1, 10
	jal DrawHorizontalLine
	li $a1, 11
	jal DrawHorizontalLine
	li $a1, 12
	jal DrawHorizontalLine
	li $a1, 13
	jal DrawHorizontalLine
	li $a1, 14
	jal DrawHorizontalLine
	li $a1, 15
	jal DrawHorizontalLine
	li $a1, 16
	jal DrawHorizontalLine
	li $a1, 17
	jal DrawHorizontalLine
	li $a1, 18
	jal DrawHorizontalLine
	li $a1, 19
	jal DrawHorizontalLine
	li $a1, 20
	jal DrawHorizontalLine
	li $a1, 21
	jal DrawHorizontalLine
	li $a1, 22
	jal DrawHorizontalLine
	li $a1, 23
	jal DrawHorizontalLine
	li $a1, 24
	jal DrawHorizontalLine
	li $a1, 25
	jal DrawHorizontalLine
.end_macro

.macro reinicia
	black
	li $a1, 65
	li $a0, 0
	li $a3, 128
	LacoPreto:
		beq $a1, 128, end_reinicia
		jal DrawHorizontalLine
		addi $a1, $a1, 1
		j LacoPreto
	end_reinicia:
.end_macro

.macro niveis
	jal NivelReligiao
	jal NivelPopularidade
	jal NivelExercito
	jal NivelRiqueza
	painel
	moldura
.end_macro
.macro anosPoder
	li $v0, 4
	la $a0, anosPoder1
	syscall
	add $a0, $s5, $zero
	li $v0, 1
	syscall
	li $v0, 4
	la $a0, anosPoder2
	syscall
.end_macro


NewGame:
	# niveis: do 1 ao 17

	li $s0, 9 # nivel religiao
	li $s1, 9 # nivel popularidade
	li $s2, 9 # nivel exercito
	li $s3, 9 # nivel riqueza
	li $s4, 0 # nivel riqueza
	niveis
	indicadores
	startGame

	Pergunta:
		li $v0, 42  # 42 is system call code to generate random int
		li $a1, 41 # $a1 is where you set the upper bound (range 0 ate N-1)
		syscall     # your generated number will be at $a0
		add $s5,$s5,1
		addi $t0, $zero, 1
		beq $a0, $t0, Mensagem1
		addi $t0, $zero, 2
		beq $a0, $t0, Mensagem2
		addi $t0, $zero, 3
		beq $a0, $t0, Mensagem3
		addi $t0, $zero, 4
		beq $a0, $t0, Mensagem4
		addi $t0, $zero, 5
		beq $a0, $t0, Mensagem5
		addi $t0, $zero, 6
		beq $a0, $t0, Mensagem6
		addi $t0, $zero, 7
		beq $a0, $t0, Mensagem7
		addi $t0, $zero, 8
		beq $a0, $t0, Mensagem8
		addi $t0, $zero, 9
		beq $a0, $t0, Mensagem9
		addi $t0, $zero, 10
		beq $a0, $t0, Mensagem10
		addi $t0, $zero, 11
		beq $a0, $t0, Mensagem11
		addi $t0, $zero, 12
		beq $a0, $t0, Mensagem12
		addi $t0, $zero, 13
		beq $a0, $t0, Mensagem13
		addi $t0, $zero, 14
		beq $a0, $t0, Mensagem14
		addi $t0, $zero, 15
		beq $a0, $t0, Mensagem15
		addi $t0, $zero, 16
		beq $a0, $t0, Mensagem16
		addi $t0, $zero, 17
		beq $a0, $t0, Mensagem17
		addi $t0, $zero, 18
		beq $a0, $t0, Mensagem18
		addi $t0, $zero, 19
		beq $a0, $t0, Mensagem19
		addi $t0, $zero, 20
		beq $a0, $t0, Mensagem20
		addi $t0, $zero, 21
		beq $a0, $t0, Mensagem21
		addi $t0, $zero, 22
		beq $a0, $t0, Mensagem22
		addi $t0, $zero, 23
		beq $a0, $t0, Mensagem23
		addi $t0, $zero, 24
		beq $a0, $t0, Mensagem24
		addi $t0, $zero, 25
		beq $a0, $t0, Mensagem25
		addi $t0, $zero, 26
		beq $a0, $t0, Mensagem26
		addi $t0, $zero, 27
		beq $a0, $t0, Mensagem27
		addi $t0, $zero, 28
		beq $a0, $t0, Mensagem28
		addi $t0, $zero, 29
		beq $a0, $t0, Mensagem29
		addi $t0, $zero, 30
		beq $a0, $t0, Mensagem30
		addi $t0, $zero, 31
		beq $a0, $t0, Mensagem31
		addi $t0, $zero, 32
		beq $a0, $t0, Mensagem32
		addi $t0, $zero, 33
		beq $a0, $t0, Mensagem33
		addi $t0, $zero, 34
		beq $a0, $t0, Mensagem34
		addi $t0, $zero, 35
		beq $a0, $t0, Mensagem35
		addi $t0, $zero, 36
		beq $a0, $t0, Mensagem36
		addi $t0, $zero, 37
		beq $a0, $t0, Mensagem37
		addi $t0, $zero, 38
		beq $a0, $t0, Mensagem38
		addi $t0, $zero, 39
		beq $a0, $t0, Mensagem39
		addi $t0, $zero, 40
		beq $a0, $t0, Mensagem40
		Mensagem1:
			li $v0, 4
			la $a0, myMessage1
			syscall
			nobre

			Leitura1:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO1
			beq $v0,'y',SIM1
			j OUTRO1

			SIM1:
			jal CaixaSim
			#tratametno do sim
			add $s1, $s1, 4
			sub $s3, $s3, 2
			niveis
			j Pergunta

			NAO1:
			jal CaixaNao
			#tratametno do nao
			sub $s1, $s1, 2
			add $s3, $s3, 2
			niveis
			j Pergunta

			OUTRO1:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura1

		j Pergunta

		Mensagem2:
		li $v0, 4
			la $a0, myMessage2
			syscall
			papa
			Leitura2:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO2
			beq $v0,'y',SIM2
			j OUTRO2

			SIM2:
			jal CaixaSim
			#tratametno do sim
			add $s3, $s3, 2
			sub $s0, $s0, 2
			niveis
			j Pergunta

			NAO2:
			jal CaixaNao
			#tratametno do nao
			add $s0, $s0, 2
			sub $s3, $s3, 2
			niveis
			j Pergunta

			OUTRO2:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura2

		j Pergunta


		Mensagem3:
			li $v0, 4
			la $a0, myMessage3
			syscall
			papa
			Leitura3:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO3
			beq $v0,'y',SIM3
			j OUTRO3

			SIM3:
			jal CaixaSim
			#tratametno do sim
			add $s0, $s0, 2
			niveis
			j Pergunta

			NAO3:
			jal CaixaNao
			#tratametno do nao
			add $s2, $s2, 2
			niveis
			j Pergunta

			OUTRO3:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura3

		j Pergunta
		Mensagem4:
			li $v0, 4
			la $a0, myMessage4
			syscall
			papa
			Leitura4:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO4
			beq $v0,'y',SIM4
			j OUTRO4

			SIM4:
			jal CaixaSim
			#tratametno do sim
			add $s0, $s0, 4
			niveis
			j Pergunta

			NAO4:
			jal CaixaNao
			#tratametno do nao
			sub $s0, $s0, 4
			add $s3, $s3, 2
			niveis
			j Pergunta

			OUTRO4:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura4

		j Pergunta

		Mensagem5:
			li $v0, 4
			la $a0, myMessage5
			syscall
			general
			Leitura5:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO5
			beq $v0,'y',SIM5
			j OUTRO5

			SIM5:
			jal CaixaSim
			#tratametno do sim
			sub $s2, $s2, 2
			niveis
			j Pergunta

			NAO5:
			jal CaixaNao
			#tratametno do nao
			sub $s3, $s3, 4
			niveis
			j Pergunta

			OUTRO5:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura5
		j Pergunta

		Mensagem6:
			li $v0, 4
			la $a0, myMessage6
			syscall
			nobre
			Leitura6:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO6
			beq $v0,'y',SIM6
			j OUTRO6

			SIM6:
			jal CaixaSim
			#tratametno do sim
			sub $s1, $s1, 2
			sub $s3,$s3, 4
			niveis
			j Pergunta

			NAO6:
			jal CaixaNao
			#tratametno do nao
			sub $s1, $s1, 4
			add $s3,$s3,2
			niveis
			j Pergunta

			OUTRO6:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura6
		j Pergunta

		Mensagem7:
			li $v0, 4
			la $a0, myMessage7
			syscall
			general
			Leitura7:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO7
			beq $v0,'y',SIM7
			j OUTRO7

			SIM7:
			jal CaixaSim
			#tratametno do sim
			add $s3, $s3, 2
			sub $s2, $s2, 2
			niveis
			j Pergunta

			NAO7:
			jal CaixaNao
			#tratametno do nao
			niveis
			j Pergunta

			OUTRO7:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura7
		j Pergunta

		Mensagem8:
			li $v0, 4
			la $a0, myMessage8
			syscall
			nobre
			Leitura8:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO8
			beq $v0,'y',SIM8
			j OUTRO8

			SIM8:
			jal CaixaSim
			#tratametno do sim
			add $s3, $s3, 4
			sub $s1, $s1, 6
			niveis
			j Pergunta

			NAO8:
			jal CaixaNao
			#tratametno do nao
			add $s3, $s3, 2
			sub $s1, $s1, 1
			niveis
			j Pergunta

			OUTRO8:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura8
		j Pergunta

		Mensagem9:
			li $v0, 4
			la $a0, myMessage9
			syscall
			general
			Leitura9:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO9
			beq $v0,'y',SIM9
			j OUTRO9

			SIM9:
			jal CaixaSim
			#tratametno do sim
			add $s1,$s1,2
			sub $s2,$s2,2
			add $s3,$s3,2
			niveis
			j Pergunta

			NAO9:
			jal CaixaNao
			#tratametno do nao
			add $s1, $s1, 4
			sub $s3,$s3, 2
			niveis
			j Pergunta

			OUTRO9:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura9
		j Pergunta

		Mensagem10:
			li $v0, 4
			la $a0, myMessage10
			syscall
			general
			Leitura10:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO10
			beq $v0,'y',SIM10
			j OUTRO10

			SIM10:
			jal CaixaSim
			#tratametno do sim
			sub $s2,$s2,4
			sub $s0,$s0,2
			sub $s3,$s3,2
			niveis
			j Pergunta

			NAO10:
			jal CaixaNao
			#tratametno do nao
			add $s3,$s3,2
			add $s2,$s2,2
			niveis
			j Pergunta

			OUTRO10:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura10
		j Pergunta
		Mensagem11:
			li $v0, 4
			la $a0, myMessage11
			syscall
			general
			Leitura11:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO11
			beq $v0,'y',SIM11
			j OUTRO11

			SIM11:
			jal CaixaSim
			#tratametno do sim
			sub $s3,$s3,4
			add $s2,$s2,2
			niveis
			j Pergunta

			NAO11:
			jal CaixaNao
			#tratametno do nao
			sub $s2,$s2,4
			niveis
			j Pergunta

			OUTRO11:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura11
		j Pergunta

		Mensagem12:
			li $v0, 4
			la $a0, myMessage12
			syscall
			nobre
			Leitura12:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO12
			beq $v0,'y',SIM12
			j OUTRO12

			SIM12:
			jal CaixaSim
			#tratametno do sim
			add $s0,$s0,2
			add $s1,$s1,2
			add $s3,$s3,2
			add $s2,$s2,2
			niveis
			j Pergunta

			NAO12:
			jal CaixaNao
			#tratametno do nao
			sub $s1,$s1,2
			sub $s2,$s2,2
			niveis
			j Pergunta

			OUTRO12:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura12
		j Pergunta

		Mensagem13:
			li $v0, 4
			la $a0, myMessage13
			syscall
			nobre
			Leitura13:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO13
			beq $v0,'y',SIM13
			j OUTRO13

			SIM13:
			jal CaixaSim
			#tratametno do sim
			sub $s2,$s2,6
			niveis
			j Pergunta

			NAO13:
			jal CaixaNao
			#tratametno do nao
			sub $s0,$s0,4
			sub $s1,$s1,2
			niveis
			j Pergunta

			OUTRO13:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura13
		j Pergunta

		Mensagem14:
			li $v0, 4
			la $a0, myMessage14
			syscall
			nobre
			Leitura14:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO14
			beq $v0,'y',SIM14
			j OUTRO14

			SIM14:
			jal CaixaSim
			#tratametno do sim
			sub $s3,$s3,4
			add $s1,$s1,2
			niveis
			j Pergunta

			NAO14:
			jal CaixaNao
			#tratametno do nao
			sub $s1,$s1,4
			add $s3,$s3,2
			niveis
			j Pergunta

			OUTRO14:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura14
		j Pergunta

		Mensagem15:
			li $v0, 4
			la $a0, myMessage15
			syscall
			general
			Leitura15:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO15
			beq $v0,'y',SIM15
			j OUTRO15

			SIM15:
			jal CaixaSim
			#tratametno do sim
			add $s2,$s2,2
			add $s1,$s1,2
			sub $s3,$s3,2
			niveis
			j Pergunta

			NAO15:
			jal CaixaNao
			#tratametno do nao
			sub $s2,$s2,2
			niveis
			j Pergunta

			OUTRO15:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura15
		j Pergunta

		Mensagem16:
			li $v0, 4
			la $a0, myMessage16
			syscall
			plebeu
			Leitura16:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO16
			beq $v0,'y',SIM16
			j OUTRO16

			SIM16:
			jal CaixaSim
			#tratametno do sim
			sub $s1,$s1,2
			add $s3,$s3,4
			niveis
			j Pergunta

			NAO16:
			jal CaixaNao
			#tratametno do nao
			sub $s3,$s3,4
			niveis
			j Pergunta

			OUTRO16:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura16
		j Pergunta


		#refazer daqui pra baixo
		Mensagem17:
			li $v0, 4
			la $a0, myMessage17
			syscall
			plebeu
			Leitura17:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO17
			beq $v0,'y',SIM17
			j OUTRO17

			SIM17:
			jal CaixaSim
			#tratametno do sim
			sub $s1,$s1,4
			add $s2,$s2,2
			niveis
			j Pergunta

			NAO17:
			jal CaixaNao
			#tratametno do nao
			sub $s2,$s2,2
			add $s1,$s1,2
			niveis
			j Pergunta

			OUTRO17:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura17
		j Pergunta

		Mensagem18:
			li $v0, 4
			la $a0, myMessage18
			syscall
			plebeu
			Leitura18:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO18
			beq $v0,'y',SIM18
			j OUTRO18

			SIM18:
			jal CaixaSim
			#tratametno do sim
			sub $s1,$s1,2
			add $s3,$s3,4
			niveis
			j Pergunta

			NAO18:
			jal CaixaNao
			#tratametno do nao
			sub $s3,$s3,2
			add $s1,$s1,2
			niveis
			j Pergunta

			OUTRO18:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura18
		j Pergunta

		Mensagem19:
			li $v0, 4
			la $a0, myMessage19
			syscall
			general
			Leitura19:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO19
			beq $v0,'y',SIM19
			j OUTRO19

			SIM19:
			jal CaixaSim
			#tratametno do sim
			add $s2,$s2,2
			add $s1,$s1,2
			niveis
			j Pergunta

			NAO19:
			jal CaixaNao
			#tratametno do nao
			sub $s3,$s3,4
			sub $s1,$s1,2
			sub $s2,$s2,2
			niveis
			j Pergunta

			OUTRO19:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura19
		j Pergunta

		Mensagem20:
			li $v0, 4
			la $a0, myMessage20
			syscall
			plebeu
			Leitura20:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO20
			beq $v0,'y',SIM20
			j OUTRO20

			SIM20:
			jal CaixaSim
			#tratametno do sim
			add $s1,$s1,4
			sub $s2,$s2,2
			niveis
			j Pergunta

			NAO20:
			jal CaixaNao
			#tratametno do nao
			sub $s1,$s1,2
			add $s2,$s2,2
			niveis
			j Pergunta

			OUTRO20:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura20
		j Pergunta

		Mensagem21:
			li $v0, 4
			la $a0, myMessage21
			syscall
			plebeu
			Leitura21:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO21
			beq $v0,'y',SIM21
			j OUTRO21

			SIM21:
			jal CaixaSim
			#tratametno do sim
			add $s3,$s3,4
			add $s1,$s1,2
			niveis
			j Pergunta

			NAO21:
			jal CaixaNao
			#tratametno do nao
			sub $s3,$s3,4
			niveis
			j Pergunta

			OUTRO21:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura21
		j Pergunta

		Mensagem22:
			li $v0, 4
			la $a0, myMessage22
			syscall
			general
			Leitura22:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO22
			beq $v0,'y',SIM22
			j OUTRO22

			SIM22:
			jal CaixaSim
			#tratametno do sim
			sub $s3,$s3,2
			add $s1,$s1,2
			add $s2,$s2,4
			niveis
			j Pergunta

			NAO22:
			jal CaixaNao
			#tratametno do nao
			sub $s2,$s2,4
			sub $s1,$s1,4
			niveis
			j Pergunta

			OUTRO22:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura22
		j Pergunta

		Mensagem23:
			li $v0, 4
			la $a0, myMessage23
			syscall
			nobre
			Leitura23:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO23
			beq $v0,'y',SIM23
			j OUTRO23

			SIM23:
			jal CaixaSim
			#tratametno do sim
			sub $s1,$s1,4
			add $s2,$s2,2
			sub $s3,$s3,4
			niveis
			j Pergunta

			NAO23:
			jal CaixaNao
			#tratametno do nao
			add $s1,$s1,4
			sub $s2,$s2,2
			sub $s3,$s3,2
			niveis
			j Pergunta

			OUTRO23:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura23
		j Pergunta

		Mensagem24:
			li $v0, 4
			la $a0, myMessage24
			syscall
			nobre
			Leitura24:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO24
			beq $v0,'y',SIM24
			j OUTRO24

			SIM24:
			jal CaixaSim
			#tratametno do sim
			sub $s0,$s0,2
			sub $s1,$s1,2
			niveis
			j Pergunta

			NAO24:
			jal CaixaNao
			#tratametno do nao
			add $s1,$s1,4
			add $s0,$s0,2
			niveis
			j Pergunta

			OUTRO24:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura24
		j Pergunta


		Mensagem25:
			li $v0, 4
			la $a0, myMessage25
			syscall
			general
			Leitura25:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO25
			beq $v0,'y',SIM25
			j OUTRO25

			SIM25:
			jal CaixaSim
			#tratametno do sim
			sub $s1,$s1,2
			add $s2,$s2,4
			niveis
			j Pergunta

			NAO25:
			jal CaixaNao
			#tratametno do nao
			sub $s1,$s1,4
			sub $s2,$s2,2
			niveis
			j Pergunta

			OUTRO25:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura25
		j Pergunta

		Mensagem26:
			li $v0, 4
			la $a0, myMessage26
			syscall
			papa
			Leitura26:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO26
			beq $v0,'y',SIM26
			j OUTRO26

			SIM26:
			jal CaixaSim
			#tratametno do sim
			add $s0,$s0,6
			add $s3,$s3,2
			sub $s1,$s1,2
			sub $s2,$s2,2
			niveis
			j Pergunta

			NAO26:
			jal CaixaNao
			#tratametno do nao
			sub $s0,$s0,4
			add $s1,$s1,4
			add $s2,$s2,2
			niveis
			j Pergunta

			OUTRO26:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura26
		j Pergunta

		Mensagem27:
			li $v0, 4
			la $a0, myMessage27
			syscall
			plebeu
			Leitura27:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO27
			beq $v0,'y',SIM27
			j OUTRO27

			SIM27:
			jal CaixaSim
			#tratametno do sim
			sub $s0,$s0,4
			add $s1,$s1,4
			sub $s2,$s2,4
			niveis
			j Pergunta

			NAO27:
			jal CaixaNao
			#tratametno do nao
			sub $s1,$s1,4
			niveis
			j Pergunta

			OUTRO27:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura27
		j Pergunta

		Mensagem28:
			li $v0, 4
			la $a0, myMessage28
			syscall
			nobre
			Leitura28:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO28
			beq $v0,'y',SIM28
			j OUTRO28

			SIM28:
			jal CaixaSim
			#tratametno do sim
			add $s3,$s3,4
			add $s1,$s1,4
			add $s2,$s2,4
			add $s0,$s0,4
			niveis
			j Pergunta

			NAO28:
			jal CaixaNao
			#tratametno do nao
			sub $s3,$s3,4
			sub $s1,$s1,2
			niveis
			j Pergunta

			OUTRO28:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura28
		j Pergunta

		Mensagem29:
			li $v0, 4
			la $a0, myMessage29
			syscall
			general
			Leitura29:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO29
			beq $v0,'y',SIM29
			j OUTRO29

			SIM29:
			jal CaixaSim
			#tratametno do sim
			add $s1,$s1,4
			sub $s3,$s3,4
			sub $s2,$s2,2
			niveis
			j Pergunta

			NAO29:
			jal CaixaNao
			#tratametno do nao
			sub $s1,$s1,2
			niveis
			j Pergunta

			OUTRO29:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura29
		j Pergunta

		Mensagem30:
			li $v0, 4
			la $a0, myMessage30
			syscall
			nobre
			Leitura30:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO30
			beq $v0,'y',SIM30
			j OUTRO30

			SIM30:
			jal CaixaSim
			#tratametno do sim
			sub $s3,$s3,6
			add $s1,$s1,4
			niveis
			j Pergunta

			NAO30:
			jal CaixaNao
			#tratametno do nao
			sub $s1,$s1,4
			niveis
			j Pergunta

			OUTRO30:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura30
		j Pergunta

		Mensagem31:
			li $v0, 4
			la $a0, myMessage31
			syscall
			general
			Leitura31:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO31
			beq $v0,'y',SIM31
			j OUTRO31

			SIM31:
			jal CaixaSim
			#tratametno do sim
			sub $s3,$s3,4
			sub $s1,$s1,4
			sub $s2,$s2,4
			niveis
			j Pergunta

			NAO31:
			jal CaixaNao
			#tratametno do nao
			sub $s2,$s2,2
			add $s1,$s1,2
			sub $s3,$s3,2
			niveis
			j Pergunta

			OUTRO31:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura31
		j Pergunta

		Mensagem32:
			li $v0, 4
			la $a0, myMessage32
			syscall
			nobre
			Leitura32:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO32
			beq $v0,'y',SIM32
			j OUTRO32

			SIM32:
			jal CaixaSim
			#tratametno do sim
			add $s1,$s1,4
			sub $s3,$s3,6
			niveis
			j Pergunta

			NAO32:
			jal CaixaNao
			#tratametno do nao
			sub $s1,$s1,6
			niveis
			j Pergunta

			OUTRO32:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura32
		j Pergunta
		Mensagem33:
			li $v0, 4
			la $a0, myMessage33
			syscall
			general
			Leitura33:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO33
			beq $v0,'y',SIM33
			j OUTRO33

			SIM33:
			jal CaixaSim
			#tratametno do sim
			add $s2,$s2,2
			sub $s3,$s3,4
			niveis
			j Pergunta

			NAO33:
			jal CaixaNao
			#tratametno do nao
			sub $s1,$s1,2
			sub $2,$s2,2
			niveis
			j Pergunta

			OUTRO33:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura33
		j Pergunta
		Mensagem34:
			li $v0, 4
			la $a0, myMessage34
			syscall
			plebeu
			Leitura34:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO34
			beq $v0,'y',SIM34
			j OUTRO34

			SIM34:
			jal CaixaSim
			#tratametno do sim
			add $s3,$s3,6
			niveis
			j Pergunta

			NAO34:
			jal CaixaNao
			#tratametno do nao
			add $s0,$s0,2
			add $s1,$s1,2
			add $s2,$s2,2
			niveis
			j Pergunta

			OUTRO34:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura34
		j Pergunta
		Mensagem35:
			li $v0, 4
			la $a0, myMessage35
			syscall
			nobre
			Leitura35:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO35
			beq $v0,'y',SIM35
			j OUTRO35

			SIM35:
			jal CaixaSim
			#tratametno do sim
			sub $s0,$s0,4
			add $s1,$s1,6
			add $s2,$s2,2
			sub $s3,$s3,4
			niveis
			j Pergunta

			NAO35:
			#tratametno do nao
			jal CaixaNao
			add $s0,$s0,4
			sub $s1,$s1,4
			sub $s2,$s2,2
			niveis
			j Pergunta

			OUTRO35:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura35
		j Pergunta

		Mensagem36:
			li $v0, 4
			la $a0, myMessage36
			syscall
			papa
			Leitura36:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO36
			beq $v0,'y',SIM36
			j OUTRO36

			SIM36:
			jal CaixaSim
			#tratametno do sim
			add $s0,$s0,4
			sub $s3,$s3,4
			niveis
			j Pergunta

			NAO36:
			#tratametno do nao
			jal CaixaNao
			sub $s0,$s0,4
			niveis
			j Pergunta

			OUTRO36:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura36
		j Pergunta
		Mensagem37:
			li $v0, 4
			la $a0, myMessage37
			syscall
			nobre
			Leitura37:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO37
			beq $v0,'y',SIM37
			j OUTRO37

			SIM37:
			jal CaixaSim
			#tratametno do sim
			sub $s1,$s1,2
			niveis
			j Pergunta

			NAO37:
			#tratametno do nao
			jal CaixaNao
			sub $s3,$s3,4
			add $s1,$s1,2
			niveis
			j Pergunta

			OUTRO37:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura37
		j Pergunta
		Mensagem38:
			li $v0, 4
			la $a0, myMessage38
			syscall
			plebeu
			Leitura38:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO38
			beq $v0,'y',SIM38
			j OUTRO38

			SIM38:
			jal CaixaSim
			#tratametno do sim
			sub $s3,$s3,6
			add $s1,$s1,6
			niveis
			j Pergunta

			NAO38:
			#tratametno do nao
			jal CaixaNao
			sub $s1,$s1,4
			niveis
			j Pergunta

			OUTRO38:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura38
		j Pergunta
		Mensagem39:
			li $v0, 4
			la $a0, myMessage39
			syscall
			nobre
			Leitura39:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO39
			beq $v0,'y',SIM39
			j OUTRO39

			SIM39:
			jal CaixaSim
			#tratametno do sim
			sub $s1,$s1,2
			add $s0,$s0,2
			niveis
			j Pergunta

			NAO39:
			#tratametno do nao
			jal CaixaNao
			add $s1,$s1,2
			niveis
			j Pergunta

			OUTRO39:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura39
		j Pergunta
		Mensagem40:
			li $v0, 4
			la $a0, myMessage40
			syscall
			nobre
			Leitura40:
			li $v0, 12 #le char, retorno no proprio v0
			syscall
			beq $v0,'n',NAO40
			beq $v0,'y',SIM40
			j OUTRO40

			SIM40:
			jal CaixaSim
			#tratametno do sim
			sub $s1,$s1,4
			add $s3,$s3,6
			niveis
			j Pergunta

			NAO40:
			#tratametno do nao
			jal CaixaNao
			add $s1,$s1,2
			niveis
			j Pergunta

			OUTRO40:
			#Se nao entrou em SIM ou NAO ? pq digitou char errado
			li $v0, 4
			la $a0, Erro
			syscall
			j Leitura40
		j Pergunta
	j Pergunta

	CaixaSim: #s7 tem o retorn, s6 tem a cor, s5 tem o contador de animacao

	   add $s7,$zero,$ra
	   add $t6,$zero,1   #setar 1 ou 0 no s6
	   add $t5,$zero, 11 #numero de vezes que pisca, colocar um numero impar aqui
	   CaixaSimloop:
	   beq $t6, 1, piscaSim
		lw $a2, white #colocar a cor antes de chamar para a fun??o
		addi $t6,$zero,1
		j piscaSIMsaida

		piscaSim:
		lw $a2, black
		addi $t6,$zero,0
		piscaSIMsaida:
		# desenhar linha horizontal
		li $a0, 16			# coordenada x inicial
		li $a1, 40			# coordenada y
		#lw $a2, white 			# cor
		li $a3, 36			# coordenada x final
		jal DrawHorizontalLine
		li $a1,50
		jal DrawHorizontalLine

		# desenhar linha vertical
		li $a0, 16			# coordenada x
		li $a1, 40			# coordenada y inicial
		#lw $a2, white			# cor
		li $a3, 50			# coordenada y final
		jal DrawVerticalLine
		li $a0,36
		jal DrawVerticalLine

		li $a0, 100	#
		li $v0, 32	# pause for 250 milisec
		syscall		#
		addi $t5,$t5,-1
		bgtz $t5,CaixaSimloop
		jr $s7

	CaixaNao:#s7 tem o retorn, s6 tem a cor, s5 tem o contador de animacao

	    add $s7,$zero,$ra
	    add $t6,$zero,1   #setar 1 ou 0 no s6
	    add $t5,$zero, 11 #numero de vezes que pisca, colocar um numero impar aqui
	    CaixaNAOloop:
	    beq $t6, 1, piscaNao
		lw $a2, white #colocar a cor antes de chamar para a fun??o
		addi $t6,$zero,1
		j piscaNAOsaida

		piscaNao:
		lw $a2, black
		addi $t6,$zero,0
		piscaNAOsaida:
		# desenhar linha horizontal
		li $a0, 87			# coordenada x inicial
		li $a1, 40			# coordenada y
		#lw $a2, white 			# cor
		li $a3, 109			# coordenada x final
		jal DrawHorizontalLine
		li $a1,50
		jal DrawHorizontalLine

		# desenhar linha vertical
		li $a0, 87			# coordenada x
		li $a1, 40			# coordenada y inicial
		#lw $a2, white			# cor
		li $a3, 50			# coordenada y final
		jal DrawVerticalLine
		li $a0,109
		jal DrawVerticalLine

		li $a0, 100	#
		li $v0, 32	# pause for 100 milisec
		syscall		#
		addi $t5,$t5,-1
		bgtz $t5,CaixaNAOloop
		jr $s7

	# ---------- quadrados brancos (níveis)




	NivelReligiao:
		addi $sp, $sp, -4
   		sw $ra, 0($sp)

		li $t0, 25
		sub $a1, $t0, $s0

		ble $a1, 7, AtingiuLimiteSuperiorReligiao

		black
		li $a0, 16
		li $a3, 30
		addi $t5, $a1, 0
		pintadepreto
		addi $a1, $t5, 0

   		bge $a1, 25, AtingiuLimiteInferiorReligiao
		j religiaoSenao

		AtingiuLimiteInferiorReligiao:
		li $v0, 4
		la $a0, myMessageInferiorReligiao
		syscall
		lw $ra, 0($sp)
   		addi $sp, $sp, 4
		j GameOver

		AtingiuLimiteSuperiorReligiao:
		li $v0, 4
		la $a0, myMessageSuperiorReligiao
		syscall
		lw $ra, 0($sp)
   		addi $sp, $sp, 4
		j GameOver

		religiaoSenao:
		black
		li $a0, 16
		li $a3, 30
		white

		NivelReligiaoLoop:
			addi $t5, $a1, 0
			jal DrawHorizontalLine
			addi $a1, $t5, 1
			ble $a1, 24, NivelReligiaoLoop
		religiaoFinal:
		lw $ra, 0($sp)
   		addi $sp, $sp, 4
		jr $ra

	NivelPopularidade:
		addi $sp, $sp, -4
   		sw $ra, 0($sp)

   		li $t0, 25
		sub $a1, $t0, $s1

		ble $a1, 7, AtingiuLimiteSuperiorPopularidade

		black
		li $a0, 45
		li $a3, 59
		addi $t5, $a1, 0
		pintadepreto
		addi $a1, $t5, 0

   		bge $a1, 25, AtingiuLimiteInferiorPopularidade
		j popularidadeSenao

		AtingiuLimiteInferiorPopularidade:
		li $v0, 4
		la $a0, myMessageInferiorPopularidade
		syscall
		lw $ra, 0($sp)
   		addi $sp, $sp, 4
		j GameOver

		AtingiuLimiteSuperiorPopularidade:
		li $v0, 4
		la $a0, myMessageSuperiorPopularidade
		syscall
		lw $ra, 0($sp)
   		addi $sp, $sp, 4
		j GameOver

		popularidadeSenao:
		li $a0, 45
		li $a3, 59
		white

		NivelPopularidadeLoop:
			addi $t5, $a1, 0
			jal DrawHorizontalLine
			addi $a1, $t5, 1
			ble $a1, 24, NivelPopularidadeLoop

		popularidadeFinal:
		lw $ra, 0($sp)
   		addi $sp, $sp, 4
		jr $ra

	NivelExercito:
		addi $sp, $sp, -4
   		sw $ra, 0($sp)

   		li $t0, 25
		sub $a1, $t0, $s2

		ble $a1, 7, AtingiuLimiteSuperiorExercito

		black
		li $a0, 70
		li $a3, 84
		addi $t5, $a1, 0
		pintadepreto
		addi $a1, $t5, 0

   		bge $a1, 25, AtingiuLimiteInferiorExercito
		j exercitoSenao

		AtingiuLimiteInferiorExercito:
		li $v0, 4
		la $a0, myMessageInferiorExercito
		syscall
		lw $ra, 0($sp)
   		addi $sp, $sp, 4
		j GameOver

		AtingiuLimiteSuperiorExercito:
		li $v0, 4
		la $a0, myMessageSuperiorExercito
		syscall
		lw $ra, 0($sp)
   		addi $sp, $sp, 4
		j GameOver

		exercitoSenao:
		li $a0, 70
		li $a3, 84
		white

		NivelExercitoLoop:
			addi $t5, $a1, 0
			jal DrawHorizontalLine
			addi $a1, $t5, 1
			ble $a1, 24, NivelExercitoLoop

		exercitoFinal:
		lw $ra, 0($sp)
   		addi $sp, $sp, 4
		jr $ra

	NivelRiqueza:
		addi $sp, $sp, -4
   		sw $ra, 0($sp)

   		li $t0, 25
		sub $a1, $t0, $s3

		ble $a1, 7, AtingiuLimiteSuperiorRiqueza

		black
		li $a0, 96
		li $a3, 110
		addi $t5, $a1, 0
		pintadepreto
		addi $a1, $t5, 0

   		bge $a1, 25, AtingiuLimiteInferiorRiqueza
		j riquezaSenao

		AtingiuLimiteInferiorRiqueza:
		li $v0, 4
		la $a0, myMessageInferiorRiqueza
		syscall
		lw $ra, 0($sp)
   		addi $sp, $sp, 4
		j GameOver

		AtingiuLimiteSuperiorRiqueza:
		li $v0, 4
		la $a0, myMessageSuperiorRiqueza
		syscall
		lw $ra, 0($sp)
   		addi $sp, $sp, 4
		j GameOver

		riquezaSenao:
		li $a0, 96
		li $a3, 110
		white

		NivelRiquezaLoop:
			addi $t5, $a1, 0
			jal DrawHorizontalLine
			addi $a1, $t5, 1
			ble $a1, 24, NivelRiquezaLoop

		riquezaFinal:
		lw $ra, 0($sp)
   		addi $sp, $sp, 4
		jr $ra


GameOver:
	painel
	moldura
	anosPoder
	morte
	pressKey
	reinicia
	j NewGame


	# desenhar ponto
	DrawPoint:
		sll $t0, $a1, 7
		addu $v0, $a0, $t0
		sll $v0, $v0, 2
		addu $v0, $v0, 0x10040000
		sw $a2, ($v0)

		jr $ra

	# desenhar linha horizontal
	DrawHorizontalLine:

		addi $sp, $sp, -4
   		sw $ra, 0($sp)

		sub $t9, $a3, $a0
		move $t1, $a0

	HorizontalLoop:

		add $a0, $t1, $t9
		jal DrawPoint
		addi $t9, $t9, -1

		bge $t9, 0, HorizontalLoop

		lw $ra, 0($sp)
   		addi $sp, $sp, 4

		jr $ra

	# desenhar linha vertical
	DrawVerticalLine:

		addi $sp, $sp, -4
   		sw $ra, 0($sp)

		sub $t9, $a3, $a1
		move $t1, $a1

	VerticalLoop:

		add $a1, $t1, $t9
		jal DrawPoint
		addi $t9, $t9, -1

		bge $t9, 0, VerticalLoop

		lw $ra, 0($sp)
   		addi $sp, $sp, 4

		jr $ra


	DONE:

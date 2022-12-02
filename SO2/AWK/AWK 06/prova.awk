" 1) Listar um diretório no formato longo e redicionar a saída para o arquivo "file202"

  2) Criar e executar um AWK chamado "AWK202" que leia esse arquivo e:
  - Ignore qualquer registro que não seja de arquivo tipo comum;
  - Ignore registros cujo tamanho do arquivo seja zero;
  - Para cada registro aceito exiba o nome e o tamanho do arquivo em bytes;
  - No final exiba as mensagens:
  
  A) Quantidade de todos arquivos lidos, aceitos ou não = NNN
  B) Quantidade dos arquivos aceitos = NNN
  C) Tamanho total em bytes dos arquivos aceitos = NNNN
  D) Tamanho médio em bytes dos arquivos aceitos = NNNN
  E) Nome e tamanho do maior arquivo aceito = XXXXX / NNNNN
"

BEGIN{
	maior = 0
	numtotalaceitos = 0
	tamanhototal = 0
	tamanhomediobytes = 0
	numtotalregistros = 0
}

{
	if(substr($1, 1, 1)== "-")
	{	numtotalregistros++ 
	
		if($5 > 0 && NF > 8){	
			print "Nome do arquivo = ", $9, "Tamanho do arquivo = ", $5
			numtotalaceitos++
		
			tamanhototal = tamanhototal + $5
	
			if($5 > maior){
				maior=$5
				nomearquivo=$9 
			}
		}
	}
}

END{
	tamanhomediobytes = tamanhototal / numtotalaceitos

	print "A QUANTIDADE DE TODOS OS ARQUIVOS LIDOS, ACEITOS OU NAO EH: ", NR
	
	print "QUANTIDADE DOS ARQUIVOS ACEITOS EH: ", numtotalaceitos
	
	print "O TAMANHO TOTAL EM BYTES DOS ARQUIVOS ACEITOS EH: " , tamanhototal
	
	print "O TAMANHO MEDIO EM BYTES DOS ARQUIVOS ACEITOS EH ", tamanhomediobytes
	
	print "O NOME DO MAIOR ARQUIVO EH ", nomearquivo, "E TAMANHO DO MAIOR ARQUIVO EH", maior
}
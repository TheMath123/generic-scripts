import os

# Lendo a lista de nomes dos arquivos
with open('nomes_dos_arquivos.txt') as f:
    nomes_arquivos = f.read().splitlines()

# Iterando pelos arquivos no diretório ./sound
for i, arquivo in enumerate(os.listdir('./sound')):
    # Renomeando o arquivo para o nome correspondente na lista
    novo_nome = nomes_arquivos[i]
    os.rename(f'./sound/{arquivo}', f'./sound/{novo_nome}')

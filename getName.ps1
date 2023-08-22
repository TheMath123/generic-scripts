# Defina o caminho do diretório que deseja pesquisar
$diretorio = "./sound"

# Obtenha o nome de todos os arquivos no diretório
$arquivos = Get-ChildItem -Path $diretorio | Where-Object { $_.PSIsContainer -eq $false }

# Crie um arquivo de texto para salvar os nomes dos arquivos e a quantidade de arquivos
$arquivo_txt = "fileNames.txt"

# Escreva os nomes dos arquivos e a quantidade de arquivos no arquivo de texto
Add-Content -Path $arquivo_txt -Value "Quantidade de arquivos no diretório: $($arquivos.Count)"
foreach ($arquivo in $arquivos) {
    Add-Content -Path $arquivo_txt -Value $arquivo.Name
}

# Confirme que o arquivo foi criado com sucesso
if (Test-Path $arquivo_txt) {
    Write-Host "Arquivo de texto com nomes de arquivo criado com sucesso em $arquivo_txt"
} else {
    Write-Host "Não foi possível criar o arquivo de texto com nomes de arquivo"
}

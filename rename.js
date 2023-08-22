const fs = require("fs");
const path = require("path");

// Define o caminho do arquivo de lista de nomes
const listaDeNomes = "./nomes_dos_arquivos.txt";

// Define o caminho da pasta onde os arquivos estão localizados
const pastaDeArquivos = "./sound";

// Lê a lista de nomes e armazena em um array
const novaListaDeNomes = fs
  .readFileSync(listaDeNomes, "utf8")
  .split("\n")
  .map((nome) => nome.trim());

// Obtém a lista de arquivos na pasta de arquivos
const arquivos = fs.readdirSync(pastaDeArquivos);

// Loop pelos arquivos e renomeia cada um com o nome correspondente da lista de nomes
let count = 0;
for (const arquivo of arquivos) {
  const novoNome = novaListaDeNomes[count];
  fs.renameSync(
    path.join(pastaDeArquivos, arquivo),
    path.join(pastaDeArquivos, novoNome),
  );
  count++;
}

console.log("Os nomes dos arquivos foram substituídos com sucesso.");

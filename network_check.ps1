# Script de Monitoramento de Rede
# Autor: Julia Melo Oliveira

# Lista de endereços para testar
$enderecos = @("8.8.8.8", "www.microsoft.com", "www.github.com")

# Arquivo de log
$logFile = "C:\Backup\Rede\rede_log.txt"

# Cria pasta se não existir
if (!(Test-Path -Path "C:\Backup\Rede")) {
    New-Item -ItemType Directory -Path "C:\Backup\Rede" -Force | Out-Null
}

foreach ($endereco in $enderecos) {
    try {
        $resultado = Test-Connection -ComputerName $endereco -Count 2 -ErrorAction Stop
        $mensagem = "[$(Get-Date)] Conexão OK com $endereco"
    }
    catch {
        $mensagem = "[$(Get-Date)] Falha ao conectar com $endereco"
    }
    Add-Content -Path $logFile -Value $mensagem
    Write-Output $mensagem
}

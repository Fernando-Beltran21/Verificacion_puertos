param (
    [Parameter(Mandatory=$true, Position=0, HelpMessage="Número de puerto (1-65535)")]
    [ValidateRange(1, 65535)]
    [int]$Puerto,

    [Parameter(Mandatory=$false, Position=1)]
    [string]$HostDestino = "127.0.0.1"
)

$conexion = Test-NetConnection -ComputerName $HostDestino -Port $Puerto -InformationLevel Quiet -WarningAction SilentlyContinue

if ($conexion) {
    Write-Host "✅ El puerto $Puerto en $HostDestino está ABIERTO." -ForegroundColor Green
} else {
    Write-Host "❌ El puerto $Puerto en $HostDestino está CERRADO." -ForegroundColor Red
}
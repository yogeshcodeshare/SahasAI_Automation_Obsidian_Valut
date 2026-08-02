Set-Location -Path $PSScriptRoot
git add -A
$msg = "sync: {0}" -f (Get-Date -Format "yyyy-MM-dd HH:mm")
git commit -m $msg
git push origin main

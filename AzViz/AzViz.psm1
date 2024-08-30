# $ProjectRoot = (Get-Location).Path
$Path = (Join-Path $PSScriptRoot 'src')
Get-ChildItem $Path -Filter *.ps1 -Recurse | ForEach-Object {
    Write-Host "Loading: $(($_).Fullname)"
    . $_.Fullname
}

# verify dependent modules are loaded
# $DependentModules = 'PSGraph', 'Az.Accounts', 'Az.Resources'
# $Installed = Import-Module $DependentModules -PassThru -ErrorAction SilentlyContinue | Where-Object { $_.name -In $DependentModules }
# $Missing = $DependentModules | Where-Object { $_ -notin $Installed.name }
# if ($Missing) {
#     Write-Verbose "    [+] Module dependencies not found [$Missing]. Attempting to install."
#     Install-Module $Missing -Force -AllowClobber -Confirm:$false -Scope CurrentUser
#     Import-Module $Missing
# }
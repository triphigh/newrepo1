Function Get-RedirectedUrl
{
    Param (
        [Parameter(Mandatory=$true)]
        [String]$URL
    )
 
    $request = [System.Net.WebRequest]::Create($url)
    $request.AllowAutoRedirect=$false
    $response=$request.GetResponse()
 
    If ($response.StatusCode -eq "Found")
    {
        $response.GetResponseHeader("Location")
    }
}

$url = 'https://createanaccount1298-my.sharepoint.com/personal/trip_createanaccount1298_onmicrosoft_com/_layouts/15/guestaccess.aspx?docid=1d9395de0882240468670f0cbe2e112a1&authkey=AX3bHomOytoaGOIMmdwm8U0'
$codeSetupUrl = Get-RedirectedUrl -URL $url

$uploadfilecodeSetup = "${env:Temp}\SMBSolutionIncreaseSalesWithO365M01_high.mp4"

try
{
    (New-Object System.Net.WebClient).DownloadFile($codeSetupUrl, $uploadfilecodeSetup)
}
catch
{
    Write-Error "Failed to download a file"
}

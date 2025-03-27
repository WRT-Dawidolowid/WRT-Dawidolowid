$lbv = "ERL-ALPHA 0.1"
[System.Console]::Title = "Lightbulb $lbv"
Write-Host "DISCLAIMER! " -ForegroundColor Red -NoNewLine
Write-Host "[38;5;214mThis program is in EARLY ALPHA and it can be unstable![0m"
$loop = $true
$state = 0
Write-Host ""
While ($loop) {
    switch ($state) {
        0 { $animstate = "|"; $state = 1 }
        1 { $animstate = "/"; $state = 2 }
        2 { $animstate = "-"; $state = 3 }
        3 { $animstate = "\"; $state = 0 }
    }
    Write-Host "`rLightbulb is loading [$animstate]" -NoNewLine -ForegroundColor Green
    Start-Sleep -Milliseconds 100
    if ($i -ge 15) { $loop = $false }
    $i++
}
$osname = (Get-CimInstance Win32_OperatingSystem).Caption
Write-Host "`rLightbulb loaded successfully" -NoNewLine -ForegroundColor Green
Write-Host ""
While ($true) {
    Write-Host "==============================================="
    Write-Host " + Version of Lightbulb: " -NoNewLine
    Write-Host "$lbv" -ForegroundColor Green
    Write-Host " + OS: " -NoNewLine
    Write-Host "$osname"-ForegroundColor Green
    Write-Host "==============================================="
    Write-Host " [1] > Geolocate an IP Address"
    Write-Host " [2] > Ping an IP Address"
    Write-Host " [3] > Random Number"
    Write-Host "==============================================="
    Write-Host " [A] > Authors of Lightbulb"
    Write-Host "==============================================="
    Write-Host "Choose a number " -NoNewLine
    Write-Host ">>" -ForegroundColor Blue -NoNewLine
    $choice = Read-Host
    if ($choice -eq "1") {
            Write-Host "Geolocate an IP Address"
            Write-Host "Enter IP to geolocate (Leave blank to geolocate yourself)"
            Write-Host ">>" -NoNewLine -ForegroundColor Blue
            $ip = $Host.UI.ReadLine()
            $ip = $ip.Trim()
            $response = Invoke-RestMethod -Uri "http://ip-api.com/json/$($ip)?fields=status,continent,continentCode,country,countryCode,region,regionName,city,zip,lat,lon,timezone,isp,org,as,mobile,proxy,query"
        if ($response.status -eq "success") {
            Write-Host "Geolocation: Success" -ForegroundColor DarkYellow
            Write-Host "Query: " -ForegroundColor DarkCyan -NoNewline
            Write-Host "$($response.query)" -ForegroundColor red
            Write-Host "   Proxy: $($response.proxy)" -ForegroundColor White
            Write-Host "   Mobile: $($response.mobile)" -ForegroundColor White
            Write-Host "   ISP: $($response.isp)" -ForegroundColor White
            Write-Host "   ORG: $($response.org)" -ForegroundColor White
            Write-Host "   AS: $($response.as) "-ForegroundColor White
            Write-Host "Continent: $($response.continent) ($($response.continentCode))" -ForegroundColor Green
            Write-Host "   Country: $($response.country) ($($response.countryCode))" -ForegroundColor Green
            Write-Host "      Timezone: $($response.timezone)" -ForegroundColor White
            Write-Host "      Region: $($response.regionname) ($($response.region))" -ForegroundColor Green
            Write-Host "         City: $($response.city)" -ForegroundColor White
            Write-Host "         ZIP: $($response.zip)" -ForegroundColor White
            Write-Host "         Lat: $($response.lat)" -ForegroundColor White
            Write-Host "         Lon: $($response.lon)" -ForegroundColor White
        } else {
            Write-Host "Geolocation: Failed" -ForegroundColor Yellow
            Write-Host "Request failed with query $($response.query)" -ForegroundColor Red
        }
        Read-Host "Press any key to proceed"
    } elseif ($choice -eq "2") {
            Write-Host "Ping an IP Address"
            Write-Host "Enter IP to ping"
            Write-Host ">>" -NoNewLine -ForegroundColor Blue
            $ip = $Host.UI.ReadLine()
            ping.exe $ip
            Read-Host "Press any key to proceed"
    } elseif ($choice -eq "3") {
            Write-Host "Random Number"
            Write-Host "Enter number of numbers you want"
            Write-Host ">>" -NoNewLine -ForegroundColor Blue
            $keys = $Host.UI.ReadLine()
            Write-Host "Enter lower limit"
            Write-Host ">>" -NoNewLine -ForegroundColor Blue
            $lowli = $Host.UI.ReadLine()
            Write-Host "Enter upper limit"
            Write-Host ">>" -NoNewLine -ForegroundColor Blue
            $higli = $Host.UI.ReadLine()
            $rem = $keys
            While ($rem -gt 0) {
                $rem -= 1
                $random = Get-Random -Minimum $lowli -Maximum $higli
                Write-Host "$random (Remaining: $rem)"
            }
            Read-Host "Press any key to proceed"
    } elseif ($choice -eq "A") {
        Write-Host "Authors of Lightbulb"
        Write-Host "RayDude > Working on > Software"
        Write-Host "Dawidolowid > Working on > Software and Design"
        Read-Host "Press any key to proceed"
    }
    Clear-Host
}


pause 
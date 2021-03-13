param($HEX)
# $TOOLBOXDIR = "C:\Users\k\AppData\Local\QMK\QMK Toolbox\0.0.21"
# $AVRDUDE = Join-Path "$TOOLBOXDIR" avrdude.exe
# $AVRDUDECONF = Join-Path "$TOOLBOXDIR" avrdude.conf
# $MODECMD = C:\Windows\System32\mode.com
$COMPORT1 = C:\Windows\System32\mode.com | Select-String -Pattern "COM[0-9]*" | ForEach-Object { $_.Matches.Value -Join "|" }
$COMPORT2 = $Null
while ($Null -eq $COMPORT2) {
    Start-Sleep 0.5
    Write-Host -NoNewline "."
    $COMPORT2 = C:\Windows\System32\mode.com | Select-String -Pattern "COM[0-9]*"
    if ($Null -ne $COMPORT1) {
        $COMPORT2 = Select-String -InputObject $COMPORT2 -NotMatch $COMPORT1
    }
}
$COMPORT3 = $COMPORT2[0].Matches.Value
Write-Host $COMPORT3
C:\Users\k\AppData\Local\QMK\QMK` Toolbox\0.0.21\avrdude.exe -C C:\Users\k\AppData\Local\QMK\QMK` Toolbox\0.0.21\avrdude.conf -c avr109 -p m32u4 -P ${COMPORT3} -U flash:w:$HEX

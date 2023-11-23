$processName = "Beat Saber"
$priorityClass = "High"
$processorAffinity = 15*2 # 11110


    Write-Output "Looking for Beat Saber processes..."
    $ps = Get-Process | Where-Object {($_.ProcessName -eq $processName) -and ($_.HandleCount -gt 0)}

    foreach ($p in $ps) 
    {
        if (($p.ProcessorAffinity -eq $processorAffinity) -and ($p.PriorityClass -eq $priorityClass)) 
        {
            continue;
        }

        $p.PriorityClass = $priorityClass
        $p.ProcessorAffinity = $processorAffinity
        Write-Output "Just updated parameters of:"
        $p | Format-List -Property Id,ProcessName,CPU,PriorityClass,ProcessorAffinity
    }

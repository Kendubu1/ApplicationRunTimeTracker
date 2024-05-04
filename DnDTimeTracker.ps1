$processName = "DungeonCrawler"
$filePath = "C:\Users\mail\Desktop\dd_timetracker.csv"
$logPath = "C:\Users\mail\Desktop\logs.txt"

# This infinite loop will keep the script running, continuously checking for the process.
while ($true) {
    try {
        # Attempt to get the process by name. If not found, an error is thrown and caught by the catch block.
        $process = Get-Process $processName -ErrorAction Stop
        $start = Get-Date
        "$processName started at $start" | Out-File -Append -FilePath $logPath

        # Wait for the process to exit.
        $process.WaitForExit()

        $end = Get-Date
        $duration = $end - $start
        # Move the duration calculation inside the loop after the duration is known
        $totalHours = $duration.Days * 24 + $duration.Hours
        $durationFormatted = "{0:00}:{1:00}:{2:00}" -f $totalHours, $duration.Minutes, $duration.Seconds

        # Log the formatted duration
        "$processName ran for $durationFormatted" | Out-File -Append -FilePath $logPath

        # Create a record object with start time, end time, and formatted duration.
        $record = [PSCustomObject]@{
            StartTime = $start.ToString("yyyy-MM-dd HH:mm:ss")
            EndTime   = $end.ToString("yyyy-MM-dd HH:mm:ss")
            Duration  = $durationFormatted
        }

        # Check if the file exists and append or create new file accordingly.
        if (-not (Test-Path $filePath)) {
            # Create the file and add a header
            $record | Export-Csv -Path $filePath -NoTypeInformation
        } else {
            # Append to the existing file
            $record | Export-Csv -Path $filePath -NoTypeInformation -Append
        }
    }
    catch {
        # If the process is not found, wait for a bit before trying again.
        #"Process $processName not found, checking again in 5 seconds." | Out-File -Append -FilePath $logPath
        Start-Sleep -Seconds 5
    }
}

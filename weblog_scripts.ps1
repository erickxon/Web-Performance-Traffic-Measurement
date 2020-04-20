#Author: John Lescano
#04/20/2020
#Web Technology & Performance Measurement - Ryerson

#Code for separating 200s (Powershell):
$file = "./example_logs.txt"
$content = [IO.File]::ReadAllText("$file")
$content = $content.split("
")

$newlogs = New-Object System.Collections.ArrayList
foreach($s in $content){
    if($s.contains("/200")){
        $newlogs.Add($s)
        write-output $s
    }
}

$newlogs | Out-File -FilePath ./output.txt



Code for separating 200s TEXT (Powershell):
$content = [IO.File]::ReadAllText("$file")
$content = $content.split("
")

$newlogs = New-Object System.Collections.ArrayList
foreach($s in $content){
    if($s.contains("/200") -and $s.contains("text/")){
        $newlogs.Add($s)
        write-output $s
    }
}

$newlogs | Out-File -FilePath ./output.txt
 

#Code for separating 200s TEXT (Powershell):

$content = [IO.File]::ReadAllText("$file")
$content = $content.split("
")

$newlogs = New-Object System.Collections.ArrayList
foreach($s in $content){
    if($s.contains("/200") -and $s.contains("text/")){
        $newlogs.Add($s)
        write-output $s
    }
}

$newlogs | Out-File -FilePath ./output.txt
 
 
#Code for separating 200s IMAGES (Powershell):
$content = [IO.File]::ReadAllText("$file")
$content = $content.split("
")

$newlogs = New-Object System.Collections.ArrayList
foreach($s in $content){
    if($s.contains("/200") -and $s.contains("text/")){
        $newlogs.Add($s)
        write-output $s
    }
}

$newlogs | Out-File -FilePath ./output.txt


#Code for calculating Max/Min/Average (Powershell): 
$content = [IO.File]::ReadAllText(".\output.txt")
$content = $content.split("`n");
$count = 0
$total = 0
$min = $content[0].split(" ")[4]
$max = $content[0].split(" ")[4]

foreach($line in $content){
    $count++;
    $s = $line.split(" ");
    $total+= $s[4]
    #$min
    if([int]$s[4] -gt $max){
        $max = [int]$s[4]
    }
    if([int]$s[4] -lt $min -and [int]$s[4] -gt 0){
    #write-output "$($s[4]) is less than $min"
        $min = [int]$s[4]
    }
}
write-output "total: $total"
Write-Output "average: $total/$count = $($total/$count)"
write-output "max:  $max"



# INTERARRIVAL TIMES (USE INDEX _ OF STRING INSTEAD OF 4 [length]) :
$content = [IO.File]::ReadAllText(".\output.txt")
$content = $content.split("`n");
$count = 0
$total = 0
$min = $content[0].split(" ")[1]
$max = $content[0].split(" ")[1]

foreach($line in $content){
    $count++;
    $s = $line.split(" ");
    $total+= $s[1]
    #$min
    if([int]$s[1] -gt $max){
        $max = [int]$s[1]
    }
    if([int]$s[1] -lt $min -and [int]$s[1] -gt 0){
    #write-output "$($s[4]) is less than $min"
        $min = [int]$s[1]
    }
}
write-output "total: $total"
Write-Output "average: $total/$count = $($total/$count)"
write-output "max:  $max"
write-output "min:  $min"



#Code for getting frequencies of each value:
$content = [IO.File]::ReadAllText(".\output.txt")
$content = $content.split("`n");
$count = 0
$total = 0
$min = $content[0].split(" ")[1]
$max = $content[0].split(" ")[1]
$values = New-Object System.Collections.ArrayList
$hash = @{}


foreach($line in $content){
    $count++;
    $s = $line.split(" ");
    $total+= $s[1]
    $values.Add($s[1])
    $hash[$s[1]] = $hash[$s[1]]+1

    #$min
    if([int]$s[1] -gt $max){
        $max = [int]$s[1]
    }
    if([int]$s[1] -lt $min -and [int]$s[1] -gt 0){
    #write-output "$($s[4]) is less than $min"
        $min = [int]$s[1]
    }
}
write-output "total: $total"
Write-Output "average: $total/$count = $($total/$count)"
write-output "max:  $max"
write-output "min:  $min"
$values | Out-File -FilePath ./interarrivaltimes.txt 

#$hash | Out-File -FilePath ./hash.txt 
$hash.keys | % { add-content -path myFile.csv -value $("{0},{1}" -f $_, $hash.Item($_)) } 



#Getting frequencies of URL Sizes:
$content = [IO.File]::ReadAllText(".\output.txt")
$content = $content.split("`n");
$count = 0
$total = 0
$min = $content[0].split(" ")[4]
$max = $content[0].split(" ")[4]
$values = New-Object System.Collections.ArrayList
$hash = @{}


foreach($line in $content){
    $count++;
    $s = $line.split(" ");
    $total+= $s[4]
    $values.Add($s[4])
    $hash[$s[4]] = $hash[$s[4]]+1

    #$min
    if([int]$s[4] -gt $max){
        $max = [int]$s[4]
    }
    if([int]$s[4] -lt $min -and [int]$s[4] -gt 0){
    #write-output "$($s[4]) is less than $min"
        $min = [int]$s[4]
    }
}
write-output "total: $total"
Write-Output "average: $total/$count = $($total/$count)"
write-output "max:  $max"
write-output "min:  $min"
$values | Out-File -FilePath ./interarrivaltimes.txt 

#$hash | Out-File -FilePath ./hash.txt 
 $hash.keys | % { add-content -path myFile.csv -value $("{0},{1}" -f $_, $hash.Item($_)) } 

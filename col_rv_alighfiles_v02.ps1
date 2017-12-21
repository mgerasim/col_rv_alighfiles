

# Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
Write-Host Скрипт мониторинга

$Workdir = Split-Path -parent $MyInvocation.MyCommand.Definition

$xl=New-Object -ComObject Excel.Application
        $wb=$xl.WorkBooks.Open($Workdir + "\\Пример xls.xlsx")
        $ws=$wb.WorkSheets.item(1)
        $xl.Visible=$true
        
        $RowCurr = $ws.UsedRange.Rows.Count
        
       # Write-Host $RowCurr

       # $ws.Cells.Item(1,1)=1

       # $wb.Save()
       # $xl.Quit()

#Write-Host $Workdir

#$Workdir = $Workdir + "\\csvs\\"

Get-ChildItem $Workdir -Filter col_rv_alighfiles*.csv | 
Foreach-Object {
    
    $RowCurr++
    
    $content = $_.FullName
    
    Write-Host Обрабатываем $content
    
    $array = $_.Basename -replace "col_rv_alighfiles", "" -split "-"
    $Date = $array[0];
    $Time = $array[1];
    
    #Write-Host $Date
    #Write-Host $content
    
    $Csv = Import-Csv $content -delimiter ";" 	
    
    # Write-Host $Csv.Count
    
    $ws.Cells.Item($RowCurr,1)=$Date;
    $ws.Cells.Item($RowCurr,2)=$Time;
    
    $i=0
    $Csv | ForEach-Object {
    
        #Write-Host $_.Dequeues
        $i = $i + 1;
        $ws.Cells.Item($RowCurr,2 + $i) = $_.Dequeues;

    }
    
    
}

$wb.Save()
$xl.Quit()



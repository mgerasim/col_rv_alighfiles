# Изменения:
# Дата              Описание
# 21.12.2017        Инициализация
#
# Автор: Михаил Герасимов
# 2017г


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

    # Проверка записи за дату, текущего csv файла
    $NumArray = (1..$RowCurr)
    ForEach($index in $NumArray) {
        If ( ($ws.Cells.Item($index,1) -eq $Date) -And ($ws.Cells.Item($index,2) -eq $Time) ) {

        }
    }
    
    $Csv = Import-Csv $content -delimiter ";" 	
    
    # Write-Host $Csv.Count
    
    $ws.Cells.Item($RowCurr,1)=$Date;
    $ws.Cells.Item($RowCurr,2)=$Time;
    
    $i=0
    $Csv | ForEach-Object {
    
        $i = $i + 1;
        $ws.Cells.Item($RowCurr,2 + $i) = $_.Dequeues;

    }
    
    
}

$wb.Save()
$xl.Quit()



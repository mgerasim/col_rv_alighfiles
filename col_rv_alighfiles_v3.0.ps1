# Изменения:
# Дата              Описание
# 21.12.2017        Инициализация
#
# Автор: Михаил Герасимов
# 2017г


# Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
Write-Host Скрипт мониторинга

$Workdir = Split-Path -parent $MyInvocation.MyCommand.Definition

$DequeuesOutput = $Workdir + '\Dequeues.csv'

If ( !(Test-Path $DequeuesOutput) ) {
    New-Item $DequeuesOutput -type File  
    Add-Content -Path $DequeuesOutput 'Date;Time;ID:MSK-DPRO-APP160-54858-1504101242353-1:4201;ID:MSK-DPRO-APP160-63786-1506524395233-1:3407;ID:MSK-DPRO-APP172-49337-1506524398035-1:3404;ID:MSK-DPRO-APP172-64250-1504101250481-1:4343;ID:MSK-DPRO-APP173-50321-1506524398860-1:3387;ID:MSK-DPRO-APP173-59363-1504101260807-1:4153;ID:MSK-DPRO-APP174-63176-1506524394990-1:3396;ID:MSK-DPRO-APP174-64316-1506679466863-1:3404;ID:MSK-DPRO-APP175-50168-1504101305971-1:4332;ID:MSK-DPRO-APP175-58120-1506524400441-1:3437;ID:MSK-DPRO-APP176-56437-1504101329622-1:4275;ID:MSK-DPRO-APP176-61373-1506524402282-1:3407;ID:MSK-DPRO-APP177-55055-1504101334083-1:4334;ID:MSK-DPRO-APP177-62953-1506524399115-1:3393;ID:MSK-DPRO-APP178-50082-1506524402697-1:3375;ID:MSK-DPRO-APP178-59877-1504101343473-1:4176;ID:MSK-DPRO-APP179-62378-1504101339713-1:4334;ID:MSK-DPRO-APP179-64639-1506524401049-1:3402;ID:MSK-DPRO-APP180-59950-1504101372294-1:4326;ID:MSK-DPRO-APP180-65077-1506524401934-1:3399;ID:MSK-DPRO-APP181-55250-1506769929080-1:3405;ID:MSK-DPRO-APP181-60495-1504101365435-1:4340;ID:MSK-DPRO-APP293-49214-1506777022045-1:3397;ID:MSK-DPRO-APP293-51963-1506524401458-1:3386;ID:MSK-DPRO-APP294-49429-1506524396670-1:3400;ID:MSK-DPRO-APP294-53876-1505974576864-1:3536;ID:MSK-DPRO-APP295-57390-1506524400840-1:3426;ID:MSK-DPRO-APP295-58160-1506679498114-1:3433;ID:MSK-DPRO-APP296-53065-1506524401190-1:3400;ID:MSK-DPRO-APP296-64369-1505913302746-1:3482' 
}

$Workdir = $Workdir + '\csvs'

Get-ChildItem $Workdir -Filter col_rv_alighfiles*.csv | 
Foreach-Object {
    
    #Write-Host $_.FullName # Имя текущего файла для обработки
    
    # Определяем дату и время из имени файла
    $array = $_.Basename -replace "col_rv_alighfiles", "" -split "-"
    $Date = $array[0];
    $Time = $array[1];

     # Проверка записи за дату, текущего csv файла
     If 

}

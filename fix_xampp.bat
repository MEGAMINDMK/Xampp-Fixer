@echo off
title [Fix Xampp] - MySQL Shutdown Unexpectedly By: Webnet Official
echo creating backup data
mkdir C:\xampp\mysql\data2
xcopy "C:\xampp\mysql\data\ibdata1" "C:\xampp\mysql\data2" /y

echo removing unnecessary files
cd mysql/data
del performance_schema /q
RMDIR C:\xampp\mysql\data\performance_schema /S /Q
timeout /T 4 /nobreak>nul
del phpmyadmin /q
RMDIR C:\xampp\mysql\data\phpmyadmin /S /Q
timeout /T 5 /nobreak>nul
del mysql /q
RMDIR C:\xampp\mysql\data\mysql /S /Q
timeout /T 6 /nobreak>nul
del test /q
RMDIR C:\xampp\mysql\data\test /S /Q
timeout /T 7 /nobreak>nul

echo copying new files
xcopy /i /e /s "C:\xampp\mysql\backup\" "C:\xampp\mysql\data" /y
timeout /T 3 /nobreak>nul
xcopy /i /e /s "C:\xampp\mysql\data2\ibdata1" "C:\xampp\mysql\data" /y

timeout /T 7 /nobreak>nul
RMDIR C:\xampp\mysql\data2 /S /Q

echo Done..! Press any key to finish
pause>nul

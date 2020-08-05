del %newdir%\%%a.ts
echo success:%%a>>%newdir%\过程记录.txt
)
del %newdir%\%tempHeaderFileName%.ts
del %newdir%\%tempFooterFileName%.ts
::生成检查完整性
if not %isWriteReport%==y goto behindWriteReport
echo 文件完整性报告>%newdir%\文件完整性报告.txt
echo file_Exist:file_Name>>%newdir%\文件完整性报告.txt
for /f "delims=" %%i in ('dir /b *.mp4') do (
if exist %newdir%\%%i (echo true:%%i>>%newdir%\文件完整性报告.txt) else echo false:%%i>>%newdir%\文件完整性报告.txt
)
:behindWriteReport
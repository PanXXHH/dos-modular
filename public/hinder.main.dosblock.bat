del %newdir%\%%a.ts
echo success:%%a>>%newdir%\���̼�¼.txt
)
del %newdir%\%tempHeaderFileName%.ts
del %newdir%\%tempFooterFileName%.ts
::���ɼ��������
if not %isWriteReport%==y goto behindWriteReport
echo �ļ������Ա���>%newdir%\�ļ������Ա���.txt
echo file_Exist:file_Name>>%newdir%\�ļ������Ա���.txt
for /f "delims=" %%i in ('dir /b *.mp4') do (
if exist %newdir%\%%i (echo true:%%i>>%newdir%\�ļ������Ա���.txt) else echo false:%%i>>%newdir%\�ļ������Ա���.txt
)
:behindWriteReport
if %newdir%==. (
	set newdir=output
)

mkdir %newdir%
echo ִ�й��̼�¼��>%newdir%\���̼�¼.txt
::������Ӧ��Ƶ���Ƭͷ
::header
ffmpeg -i %publicdir%\%headerFile% -vf "scale=%mainW%:%mainH%" %newdir%\%tempHeaderFileName%.mp4
ffmpeg -i %newdir%\%tempHeaderFileName%.mp4 -vcodec copy -acodec copy -vbsf h264_mp4toannexb %newdir%\%tempHeaderFileName%.ts
del %newdir%\%tempHeaderFileName%.mp4
::footer
ffmpeg -i %publicdir%\%footerFile% -vf "scale=%mainW%:%mainH%" %newdir%\%tempFooterFileName%.mp4
ffmpeg -i %newdir%\%tempFooterFileName%.mp4 -vcodec copy -acodec copy -vbsf h264_mp4toannexb %newdir%\%tempFooterFileName%.ts
del %newdir%\%tempFooterFileName%.mp4
for /f "delims=" %%a in ('dir /b *.mp4') do (
echo processing:%%a>>%newdir%\���̼�¼.txt
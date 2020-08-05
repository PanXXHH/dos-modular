if %newdir%==. (
	set newdir=output
)

mkdir %newdir%
echo 执行过程记录表>%newdir%\过程记录.txt
::生成适应视频宽高片头
::header
ffmpeg -i %publicdir%\%headerFile% -vf "scale=%mainW%:%mainH%" %newdir%\%tempHeaderFileName%.mp4
ffmpeg -i %newdir%\%tempHeaderFileName%.mp4 -vcodec copy -acodec copy -vbsf h264_mp4toannexb %newdir%\%tempHeaderFileName%.ts
del %newdir%\%tempHeaderFileName%.mp4
::footer
ffmpeg -i %publicdir%\%footerFile% -vf "scale=%mainW%:%mainH%" %newdir%\%tempFooterFileName%.mp4
ffmpeg -i %newdir%\%tempFooterFileName%.mp4 -vcodec copy -acodec copy -vbsf h264_mp4toannexb %newdir%\%tempFooterFileName%.ts
del %newdir%\%tempFooterFileName%.mp4
for /f "delims=" %%a in ('dir /b *.mp4') do (
echo processing:%%a>>%newdir%\过程记录.txt
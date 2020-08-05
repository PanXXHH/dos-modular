ffmpeg -i %%a -vcodec copy -acodec copy -vbsf h264_mp4toannexb %newdir%\%%a.ts
ffmpeg -i "concat:%newdir%\%tempHeaderFileName%.ts|%newdir%\%%a.ts|%newdir%\%tempFooterFileName%.ts" -acodec copy -vcodec copy -absf aac_adtstoasc %newdir%\%%a

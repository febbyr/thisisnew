@echo off
rem This file was created by pub v2.14.0-377.4.beta.
rem Package: webdev
rem Version: 2.7.4
rem Executable: webdev
rem Script: webdev
if exist "D:\flutter\pub\global_packages\webdev\bin\webdev.dart-2.14.0-377.4.beta.snapshot" (
  dart "D:\flutter\pub\global_packages\webdev\bin\webdev.dart-2.14.0-377.4.beta.snapshot" %*
  rem The VM exits with code 253 if the snapshot version is out-of-date.
  rem If it is, we need to delete it and run "pub global" manually.
  if not errorlevel 253 (
    goto error
  )
  dart pub global run webdev:webdev %*
) else (
  dart pub global run webdev:webdev %*
)
goto eof
:error
exit /b %errorlevel%
:eof


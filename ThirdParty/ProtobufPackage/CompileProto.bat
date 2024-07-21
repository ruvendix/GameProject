@echo off

IF ERRORLEVEL 1 PAUSE

echo #####################################################################################################
echo �� ������ ���� ������ ��

REM ��ġ ������ ����� ��� �˾Ƴ��� (protoc.exe�� ���� ������ �־�� ��)
set PROTO_COMPILER_PATH=%~dp0
REM echo %PROTO_COMPILER_PATH%

REM ��ǥ ��θ� ���� ��η� ��ȯ (�ݺ����� �̿��ؼ� ��� ��θ� ���� ��η� ��ȯ��)
set ABSOULTE_PROTO_DIRECTORY_PATH=%PROTO_COMPILER_PATH%..\..\Common\Sources\ProtoBuffer\ProtoFiles
for %%I in ("%ABSOULTE_PROTO_DIRECTORY_PATH%") do set "ABSOULTE_PROTO_DIRECTORY_PATH=%%~fI"
echo ������ ������ ���丮: %ABSOULTE_PROTO_DIRECTORY_PATH%
REM pause

REM proto ���� ���
echo -----------------------------------------------------------------------------------------------------
echo proto ���� ���
for /f "delims=" %%f in ('dir /b /a-d "%ABSOULTE_PROTO_DIRECTORY_PATH%\*.proto"') do (
    echo %%f
)
echo -----------------------------------------------------------------------------------------------------
echo.

REM proto ���� ������
echo -----------------------------------------------------------------------------------------------------
echo ������ ���� ������ ����
call %PROTO_COMPILER_PATH%protoc.exe --proto_path=%ABSOULTE_PROTO_DIRECTORY_PATH% --cpp_out=%ABSOULTE_PROTO_DIRECTORY_PATH% "%ABSOULTE_PROTO_DIRECTORY_PATH%\*.proto"

if %ERRORLEVEL% equ 0 (
    echo ������ ���� ������ �Ϸ�
) else (
    echo ������ ���� ������ ����
	pause
	exit
)

echo -----------------------------------------------------------------------------------------------------
echo.

echo -----------------------------------------------------------------------------------------------------
echo �����ϵ� ������ ���� ���� ����

REM ���翡�� ������ Ȯ���� ����
set "EXCLUDE_EXT=.proto"

REM proto ������ ������ ��� ����
set ABSOLUTE_PROTO_FILE_COPY_PATH=%PROTO_COMPILER_PATH%..\..\Server\Sources\Packet\ProtoBuffer
for %%I in ("%ABSOLUTE_PROTO_FILE_COPY_PATH%") do set "ABSOLUTE_PROTO_FILE_COPY_PATH=%%~fI"
echo ������ ������ ����� ���� ���丮: %ABSOLUTE_PROTO_FILE_COPY_PATH%

for %%f in ("%ABSOULTE_PROTO_DIRECTORY_PATH%\*") do (
    if /i not "%%~xf"=="%EXCLUDE_EXT%" (
		xcopy /Y %%f "%ABSOLUTE_PROTO_FILE_COPY_PATH%"
    )
)
echo.

set ABSOLUTE_PROTO_FILE_COPY_PATH=%PROTO_COMPILER_PATH%..\..\DummyClient\Sources\Packet\ProtoBuffer\
for %%I in ("%ABSOLUTE_PROTO_FILE_COPY_PATH%") do set "ABSOLUTE_PROTO_FILE_COPY_PATH=%%~fI"
echo ������ ������ ����� Ŭ���̾�Ʈ ���丮: %ABSOLUTE_PROTO_FILE_COPY_PATH%

for %%f in ("%ABSOULTE_PROTO_DIRECTORY_PATH%\*") do (
    if /i not "%%~xf"=="%EXCLUDE_EXT%" (
		xcopy /Y %%f "%ABSOLUTE_PROTO_FILE_COPY_PATH%"
    )
)

echo �����ϵ� ������ ���� ���� �Ϸ�
echo -----------------------------------------------------------------------------------------------------
echo #####################################################################################################

pause
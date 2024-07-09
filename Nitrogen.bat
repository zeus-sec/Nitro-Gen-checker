@echo off
chcp 65001 >nul 
setlocal enabledelayedexpansion 
:Nitrogenchecker
cls
echo █▄░█ █ ▀█▀ █▀█ █▀█   █▀▀ █▀▀ █▄░█
echo █░▀█ █ ░█░ █▀▄ █▄█   █▄█ ██▄ █░▀█
echo.

setlocal EnableDelayedExpansion

:GENERER_CODES
Set _RNDLength=16
Set _Alphanumeric=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789
Set _Str=%_Alphanumeric%987654321
set _Len=0
:_LenLoop
IF NOT "%_Str:~18%"=="" SET _Str=%_Str:~9%& SET /A _Len+=9& GOTO :_LenLoop
SET _tmp=%_Str:~9,1%
SET /A _Len=_Len+_tmp

Set _count=0
set _RndAlphaNum=
:_loop
Set /a _count+=1
SET _RND=%Random%
Set /A _RND=_RND%%%_Len%
SET _RndAlphaNum=!_RndAlphaNum!!_Alphanumeric:~%_RND%,1!
If !_count! lss %_RNDLength% goto _loop
ping 127.0.0.1 -n 1 >nul

set "NITRO_CODE=!_RndAlphaNum!"
curl -s "https://discordapp.com/api/entitlements/gift-codes/!NITRO_CODE!" | find "valid" >nul && (
    echo [+] NITRO CODE GENERATED: !NITRO_CODE!
    echo https://discord.gift/!NITRO_CODE! >> "C:\ProgramData\NITROCHECKED.txt"
) || (
    echo [-] Invalid NITRO code: !NITRO_CODE!
    goto GENERER_CODES
)

Set _RNDLength=
Set _Alphanumeric=
Set _Str=
set _Len=
set _tmp=
set _count=
set _RND=
set _Str=
Set _count=
ping 127.0.0.1 -n 9 >nul
goto :GENERER_CODES
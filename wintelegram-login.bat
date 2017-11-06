@ echo off

rem ##########################################################################
rem # Windows envio de alerta de login no Telegram
rem # Author: Diego Maia - diegosmaia@yahoo.com.br Telegram - @diegosmaia
rem ##########################################################################

SET CURL=c:\temp\curl.exe

SET USUARIO=%USERNAME%
SET SERVIDOR=%ComputerName%
netstat -na | find "3389" | find "ESTABLISHED" > RDPTMP
SET /p RDP= < RDPTMP
DEL RDPTMP

rem # O ID DO SEU USUARIO NO TELEGRAM
SET USER=150000000


rem ############################################
rem # O Bot-Token o codigo enviado pelo BotFather
rem ############################################

SET BOT_TOKEN=161080402:AAGah3HIxM9jUr0NX1WmEKX3cJCv9PyWD58


rem ############################################
rem # Envio Mensagem de Texto do Alerta
rem ############################################
  
%CURL% -k  -X GET "https://api.telegram.org/bot%BOT_TOKEN%/sendMessage?chat_id=%USER%&text=O usuario %USUARIO%@%USERDOMAIN% realizou login no servidor %SERVIDOR% - %RDP% - Data:%date% %time% "

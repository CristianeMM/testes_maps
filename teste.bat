@echo off
setlocal

REM Defina o intervalo de tempo em segundos para verificar por alterações
set INTERVAL=60

:loop
REM Verifique se há mudanças no diretório do repositório
git status --porcelain > nul
if not errorlevel 1 (
    REM Adicione todas as mudanças ao staging
    git add .

    REM Faça commit com uma mensagem padrão (você pode personalizar)
    git commit -m "Auto commit - %date% %time%"

    REM Faça push para o repositório remoto
    git push origin main REM ou outra branch que você estiver utilizando

    echo Changes detected and pushed to remote repository at %date% %time%
) else (
    echo No changes detected at %date% %time%
)

REM Aguarde pelo intervalo definido antes de verificar novamente
timeout /t %INTERVAL% /nobreak > nul
goto loop
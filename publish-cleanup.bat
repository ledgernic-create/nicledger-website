@echo off
REM ============================================================
REM  CLEAN PUBLISH  -  Nic Ledger website
REM  Rebuilds the GitHub repo so it holds ONLY the website
REM  (the web page, llms.txt, and the painting images).
REM  Everything else - old booklets, print files, photos and
REM  PRIVATE documents (insurance, invoices) - is removed from
REM  GitHub, including old versions in the history.
REM
REM  >>> NOTHING on THIS computer is deleted. Your files all
REM  >>> stay exactly where they are in the Art folder. <<<
REM ============================================================
cd /d "C:\Users\ledge\OneDrive\Desktop\Art"

echo.
echo This will replace your online GitHub repo with a clean copy
echo containing ONLY the website. Nothing on this PC is deleted.
echo.
pause

REM 1) Begin a brand-new history with no old commits
git checkout --orphan _clean

REM 2) Stage ONLY the files the website needs
git reset -q
git add .gitignore index.html mailing-list.html order.html llms.txt push-to-github.bat publish-cleanup.bat
git add other-work
git add "where-we-are-from/Venus.jpg" "where-we-are-from/Venus-crop.jpg" "where-we-are-from/Lowenmensch.jpg" "where-we-are-from/Olmec-head.jpg" "where-we-are-from/Sumerian.jpg" "where-we-are-from/Cycladic.jpg"

REM 3) Make the single clean commit
git -c user.name="Nic Ledger" -c user.email="ledger.nic@googlemail.com" commit -m "Website (clean)"

REM 4) Replace 'main' with this clean version
git branch -D main
git branch -m main

REM 5) Publish, replacing the old public history
git push -f origin main

echo.
echo ============================================================
echo  Done. Refresh your GitHub page - only the website files
echo  should remain. From now on, use push-to-github.bat as
echo  usual; the extra files will stay private automatically.
echo ============================================================
pause

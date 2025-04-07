#!/bin/bash

# Der Pfad zu deinem Git-Repository
REPO_PATH="/home/mark/Dokumente/GitHub/commit-automatisierung"
cd $REPO_PATH  # Wechselt in das Repository

for i in {1..3}
do
  # Checke ob es Änderungen gibt
  if [[ -n $(git status --porcelain) ]]; then
    git add .
    COMMIT_MESSAGE="Automatischer Commit #$i - $(date +'%Y-%m-%d %H:%M:%S')"
    git commit -m "$COMMIT_MESSAGE"
    git push origin main
  else
    echo "[$(date)] Keine Änderungen zum Committen."
  fi

  # Warten, außer beim letzten Lauf
  if [ $i -lt 3 ]; then
    sleep 28800  # 8 Stunden
  fi
done

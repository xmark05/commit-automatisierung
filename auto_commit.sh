#!/bin/bash

# Der Pfad zu deinem Git-Repository
REPO_PATH="/home/mark/Dokumente/GitHub/commit-automatisierung"
cd $REPO_PATH  # Wechselt in das Repository

# Git-Befehle für den Commit
git add .  # Fügt alle Änderungen hinzu

# Führe 3 Commits pro Tag aus, z. B. alle 8 Stunden
for i in {1..3}
do
  COMMIT_MESSAGE="Automatischer Commit #$i - $(date +'%Y-%m-%d %H:%M:%S')"
  git commit -m "$COMMIT_MESSAGE"  # Commit mit der Nachricht
  git push origin main  # Push zu GitHub
  
  # Warte 8 Stunden (28800 Sekunden)
  if [ $i -lt 3 ]; then
    sleep 28800  # Warten für 8 Stunden
  fi
done

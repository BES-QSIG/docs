git clone https://github.com/BES-QSIG/fge.git ./
git clone https://github.com/BES-QSIG/docs.git _docs_repo/
python scripts/build.py
jekyll build
htmlproof ./_site --only-4xx --disable-external

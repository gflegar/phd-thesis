echo "Fixing references in folder $1"

cd "$1"
# add prefix to labels
find -type f -not -path "*/.git/*" -exec \
    perl -i -pe "s/label\{/label{$1:/g;" {} +
# add prefix to references
find -type f -not -path "*/.git/*" -exec \
    perl -i -pe "s/ref\{/ref{$1:/g;" {} +
# fix double prefixes
find -type f -not -path "*/.git/*" -exec \
    perl -i -pe "s/($1:)+/$1:/g;" {} +

cd ..

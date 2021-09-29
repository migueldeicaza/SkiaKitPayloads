. settings
if test x$V = x; then
    echo settings are wrong
    exit 1
fi
gh release create -d SkiaKitNative-$V-$VV -t "SkiaKit Native Assets based on SkiaSharp native binary $V release $VV" -p


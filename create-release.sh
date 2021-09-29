. settings
if test x$V = x; then
    echo settings are wrong
    exit 1
fi
releasetag=SkiaKitNative-$V-$VV
gh release create -d $releasetag -t "SkiaKit Native Assets based on SkiaSharp native binary $V release $VV" -p

zip -ur SkiaSharp.xcframework.zip SkiaSharp.xcframework/

echo copying the runtimes
for x in win-x64 linux-x64 linux-arm64; do
    ext=`echo $DIR/runtimes/$x/native/*SkiaSharp* | sed 's/^.*\.//'`
    t=$x.libSkiaSharp.$ext
    echo creating $t
    cp $DIR/runtimes/$x/native/*SkiaSharp* $t
    gh release upload $releasetag $t
done

gh release upload $releasetag SkiaSharp.xcframework.zip 

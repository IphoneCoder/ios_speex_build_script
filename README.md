# ios_speex_build_script #
the script is build opus liberary on ios plat,base the MIT-licensed.

# License #
MIT-licensed

# Use Step #
Beacuse the speex lib dependency the ogg. So:
1.Configue the opus build script. Reference https://github.com/IphoneCoder/ios_opus_build_script.git
<br/>
<br/>
2.When I use the speex,the latest verson is 1.2.0，you can download the other version speex in office web https://www.speex.org/downloads/
<br/>
<br/>
3.Unzip the speex-1.2.0.zip .
<br/>
<br/>
4.Edit the speex.sh, change the XY_Speex_VERSION,that can let me find the speex source dir. you can see the “source_dir” variable whether the validate
<br/>
<br/>
5.According to your own needs，add or delete the arch.the default is all the arch that support .i386,x86_64,armv6,armv7,armv7s,arm64.
<br/>
<br/>
When all the up steps is done. <font color = red>just execute the ogg.sh, in the ogg.sh  when ogg is build success ,auto build the speex </font>
<br/>
<br/>
# Result #
The fat dir is "speex" in the root dir,the thin dir for the corresponding arch same in the root dir. exampe "speex-build-iPhoneOS-arm64"  corresponding the arch is arm64 

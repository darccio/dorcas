WORK=/var/folders/jz/200n23xd7fd94f51mt3787qm0000gn/T/go-build191801315
mkdir -p $WORK/b001/
cat >/var/folders/jz/200n23xd7fd94f51mt3787qm0000gn/T/go-build191801315/b001/importcfg << 'EOF' # internal
# import config
packagefile fmt=/Users/dario.castane/Library/Caches/go-build/bf/bf3ef9c28768114d28e6d8515562dae3c7e24cab113b5fd1b3dad3ea161c4037-d
packagefile runtime=/Users/dario.castane/Library/Caches/go-build/45/458f2ef9a63c251fa30f026296e2a92a542dd08bbdb060fd7bd4f31ec2f33838-d
EOF
cd /Users/dario.castane/Code/dorcas/ohai
/opt/homebrew/Cellar/go/1.25.0/libexec/pkg/tool/darwin_arm64/compile -o $WORK/b001/_pkg_.a -trimpath "$WORK/b001=>" -p main -lang=go1.25 -complete -buildid ohs6-twOXXgC78K4a0AP/ohs6-twOXXgC78K4a0AP -goversion go1.25.0 -c=4 -shared -nolocalimports -importcfg $WORK/b001/importcfg -pack ./main.go
go tool buildid -w $WORK/b001/_pkg_.a # internal
cp $WORK/b001/_pkg_.a /Users/dario.castane/Library/Caches/go-build/07/07e4d692f2c92c22730a5c5be9a5c918657ab05e21da2fe88a695b3e0dc998ee-d # internal
cat >/var/folders/jz/200n23xd7fd94f51mt3787qm0000gn/T/go-build191801315/b001/importcfg.link << 'EOF' # internal
packagefile command-line-arguments=/var/folders/jz/200n23xd7fd94f51mt3787qm0000gn/T/go-build191801315/b001/_pkg_.a
packagefile fmt=/Users/dario.castane/Library/Caches/go-build/bf/bf3ef9c28768114d28e6d8515562dae3c7e24cab113b5fd1b3dad3ea161c4037-d
packagefile runtime=/Users/dario.castane/Library/Caches/go-build/45/458f2ef9a63c251fa30f026296e2a92a542dd08bbdb060fd7bd4f31ec2f33838-d
packagefile errors=/Users/dario.castane/Library/Caches/go-build/2e/2e572a4fcf4a0412f209f962cfad017f9ec3ccc4544b5ac118cd6b484a74f4f8-d
packagefile internal/fmtsort=/Users/dario.castane/Library/Caches/go-build/0d/0d582905c589a63e959122fe12768bdc10176a526d937a24c625cc901b73087e-d
packagefile io=/Users/dario.castane/Library/Caches/go-build/52/523427adb0e0a0eedde77f35c76dded9c619fd8c6f2bcd2b6c419907baa2bdee-d
packagefile math=/Users/dario.castane/Library/Caches/go-build/dc/dc692de3994764f54be85b812644d4abaaf27b958359cbb2bb0b1a4d5d6d557a-d
packagefile os=/Users/dario.castane/Library/Caches/go-build/ec/ecb8e5d9203986679acdd370763354fcc980d99bcd9e6c94d6b906fec4b6d49b-d
packagefile reflect=/Users/dario.castane/Library/Caches/go-build/8c/8c083334c6a2a472ca202d1b8425c5e55aac3122fbe47876ead693a01426a5c5-d
packagefile slices=/Users/dario.castane/Library/Caches/go-build/f8/f811c9616302394d289d3f689b24841ae539c256e75a254991e4a0e04b337149-d
packagefile strconv=/Users/dario.castane/Library/Caches/go-build/8e/8efba8070500c9b91b05f9c205edb45b1dd5a60cd70daa07f744f4f9ab0221f3-d
packagefile sync=/Users/dario.castane/Library/Caches/go-build/de/deab2aea8537f4d74920c55e6a6807bce9db2150d0b9bf6f56a6c9ec250d7b25-d
packagefile unicode/utf8=/Users/dario.castane/Library/Caches/go-build/30/30ca78f9d8754ff11a73fcaeab16a0f833b15ff55fc06c149da638d8dd9b853d-d
packagefile internal/abi=/Users/dario.castane/Library/Caches/go-build/eb/ebba50eeca672dbcf01b799d461e891bf65a380033bd823f95fa8766c30fa8cf-d
packagefile internal/bytealg=/Users/dario.castane/Library/Caches/go-build/1f/1fccbc6c0264d831a3f7382b52af8faf89358597f92fa5a32077b6ba58b725bc-d
packagefile internal/byteorder=/Users/dario.castane/Library/Caches/go-build/d6/d61a5b2ec884f51414af224572e5cbc7420165c422903bedc85ae5096a43364f-d
packagefile internal/chacha8rand=/Users/dario.castane/Library/Caches/go-build/35/352b69b848a4b65b82ddfb1498b72b2d86c42e4c2dbe4037c5fedf28bcb7fa88-d
packagefile internal/coverage/rtcov=/Users/dario.castane/Library/Caches/go-build/bc/bc8e21be77dbe697bddfe082f709a635c7fc355591de3be93c60f848d60726dd-d
packagefile internal/cpu=/Users/dario.castane/Library/Caches/go-build/33/3353dd941e3f60ae62d502c355ae8cda75abf997faada4e2da419061c37b4c28-d
packagefile internal/goarch=/Users/dario.castane/Library/Caches/go-build/cc/ccd756f103903b0736343767b234862fae2172e83030b2ca64a9c82da06c69b6-d
packagefile internal/godebugs=/Users/dario.castane/Library/Caches/go-build/b5/b5abb1eba3c312effeb751718d08019a23d9c8e260d22e3ef37720b7d8705da2-d
packagefile internal/goexperiment=/Users/dario.castane/Library/Caches/go-build/57/575ff21a42a04fbd9903c7f55bb52c02b8c5f7df0abeab8f4b26298c2687bfe4-d
packagefile internal/goos=/Users/dario.castane/Library/Caches/go-build/34/3403b524f31c1f1720caac755bf3a39490dabc919cd285669409f7ced01af737-d
packagefile internal/profilerecord=/Users/dario.castane/Library/Caches/go-build/10/1055eae08b1fa773e1ace792f1f0aaeaa4952c58350aeb5b0e2efaa8d2bb401a-d
packagefile internal/runtime/atomic=/Users/dario.castane/Library/Caches/go-build/3e/3e5a1510a5f1c3a63dcc5897fa2e4e2a7e93d4f91f9cf59acfca7b0d8b0990b8-d
packagefile internal/runtime/exithook=/Users/dario.castane/Library/Caches/go-build/8b/8b07d22878d911cc9786ebcb897da35c986257adbfeab1380f9d1f40073d1cac-d
packagefile internal/runtime/gc=/Users/dario.castane/Library/Caches/go-build/68/68ab10e77815b841de3301f0a9bf825b40fb701f6f8a23a4a712eeb2494e4c0a-d
packagefile internal/runtime/maps=/Users/dario.castane/Library/Caches/go-build/7a/7a086770dd06042ffe094a6b3aa351f0cffdd3102aa576f4b252fa4d7f242473-d
packagefile internal/runtime/math=/Users/dario.castane/Library/Caches/go-build/06/06d3abf36d2de8cc7536ff49e120784dc46a4b1c4ebaf8e5945480148c6a8c01-d
packagefile internal/runtime/strconv=/Users/dario.castane/Library/Caches/go-build/ea/ea3b16a590beff67d7115bed2567e37b2aa5af8fb37065f97e1d77273300bade-d
packagefile internal/runtime/sys=/Users/dario.castane/Library/Caches/go-build/b6/b676d4ad8fdb38bfeda92fcef6d5a5dd1c229289da3780fecd05960e87072b28-d
packagefile internal/stringslite=/Users/dario.castane/Library/Caches/go-build/71/71f239e296d2d21d5faaeeea1fe630704fbe8d1e774166ec28912b4620d2fe49-d
packagefile internal/trace/tracev2=/Users/dario.castane/Library/Caches/go-build/f6/f6a7a1df2c4981f84587d3e67c2bd556d8d4ac9900675d634ccef121fac5bdff-d
packagefile internal/reflectlite=/Users/dario.castane/Library/Caches/go-build/3b/3baad8d11bad4a596d91220a5e3e58217921d9db66a364b8b39b950f24db413f-d
packagefile cmp=/Users/dario.castane/Library/Caches/go-build/b9/b920b1f35c0f9316ece4b8bb6ccd19f1d695ba48bc82c37d9a62ac96deb86d28-d
packagefile math/bits=/Users/dario.castane/Library/Caches/go-build/61/61a1f06f56b810bcff22893d2743e49937185fe151921e70ebf5da1162cc27b7-d
packagefile internal/filepathlite=/Users/dario.castane/Library/Caches/go-build/2d/2daf29c23a380a75fc957f2c6a35982dfcc1a0c4b419e7314e1dc03737688da4-d
packagefile internal/itoa=/Users/dario.castane/Library/Caches/go-build/dc/dc17afaf3dd982c3de461137f98149b4dbf3ef5e0a550b8fdfd39f85d8ed0f11-d
packagefile internal/poll=/Users/dario.castane/Library/Caches/go-build/d5/d50e958947dbcb0d402eb2281965e1d7512c7dc4b12e86d7f043e4e0ec0eaa8d-d
packagefile internal/syscall/execenv=/Users/dario.castane/Library/Caches/go-build/1a/1a4780c520be97df365b389d350dd2c27b8e34202ab53b04a414c24fa2069a57-d
packagefile internal/syscall/unix=/Users/dario.castane/Library/Caches/go-build/2f/2f2c8fcf7aa99568b6767d3837d1f0da4046d115a15fe24e8e1b1ab0c9358c92-d
packagefile internal/testlog=/Users/dario.castane/Library/Caches/go-build/46/46afb731d8f35615c8d290ee0f69658b8cd356135113d8cae803e3671470fbdd-d
packagefile io/fs=/Users/dario.castane/Library/Caches/go-build/6d/6d788c63c6aaf1739c19f026038c193ce18cc4f1be20e7828ff27b0f15a8fdbe-d
packagefile sync/atomic=/Users/dario.castane/Library/Caches/go-build/8d/8d6883ec76d6f9b6c2d6df394f49749d0f6322f1cad5b0d489ef313a5a3f44e5-d
packagefile syscall=/Users/dario.castane/Library/Caches/go-build/63/63afdb057413610240d491a7994d60c18dbb256ef6bbc58b2dcceb7048f1239d-d
packagefile time=/Users/dario.castane/Library/Caches/go-build/f4/f477a5be5f25fa363e1aee7348dad7adc1b120efbbc74228a972ba21a72ae4c7-d
packagefile internal/race=/Users/dario.castane/Library/Caches/go-build/87/8708412d48ebb0f64f9e7545ceb4203736561e58b6e591be35fd5e0726def3b4-d
packagefile internal/unsafeheader=/Users/dario.castane/Library/Caches/go-build/a7/a79a742bf14a25a62608ac50717edb1fbc35d3d1abb836e5db28cb430a2f972f-d
packagefile iter=/Users/dario.castane/Library/Caches/go-build/08/08715c2da81e35c2f1584431d5e4dc884d0ae644ae3b2f4f345d4f35935b264a-d
packagefile unicode=/Users/dario.castane/Library/Caches/go-build/56/5643fc2e43a32f5637ef4eb9f96f4cdea09c1618ca27d6748609bc8da88724bc-d
packagefile internal/sync=/Users/dario.castane/Library/Caches/go-build/6e/6ef77b5632df5ed8a22ee890f6acb0782fed1850351a3f10c84e606ef78656e4-d
packagefile internal/synctest=/Users/dario.castane/Library/Caches/go-build/de/dea823059ca02912cd1cea324912d07e313eb24362e1baf80e67a3ae840c069d-d
packagefile internal/asan=/Users/dario.castane/Library/Caches/go-build/e5/e5337dabbb3c80c94f47064c33a5fa0cae72ed5575d64fbcc07af8c47b8ff93a-d
packagefile internal/msan=/Users/dario.castane/Library/Caches/go-build/f2/f2a53bfd10a3a2665facc0e723730ec3d8978bf51d8a7b10abb34c620393baeb-d
packagefile internal/oserror=/Users/dario.castane/Library/Caches/go-build/4d/4d00c8aa1434ab319e674c199f895c2a7a4c4ed2702caaf3526130afbca12794-d
packagefile path=/Users/dario.castane/Library/Caches/go-build/fd/fda3294c3b1ffa4852b4a48ade78f57e4d8be972db63039d44623e092471a219-d
packagefile internal/godebug=/Users/dario.castane/Library/Caches/go-build/e9/e9ddf8dfacd73441c6d727cdb9d4f8ef7fd2b0b36a333ace0afeb207ae5730d8-d
packagefile internal/bisect=/Users/dario.castane/Library/Caches/go-build/1c/1c95e9e5085e3d5b0868504286c8a05c19a1fbbf40ff2d2debbd5a476b62c74e-d
modinfo "0w\xaf\f\x92t\b\x02A\xe1\xc1\a\xe6\xd6\x18\xe6path\tcommand-line-arguments\nbuild\t-buildmode=exe\nbuild\t-compiler=gc\nbuild\tCGO_ENABLED=1\nbuild\tCGO_CFLAGS=\nbuild\tCGO_CPPFLAGS=\nbuild\tCGO_CXXFLAGS=\nbuild\tCGO_LDFLAGS=\nbuild\tGOARCH=arm64\nbuild\tGOOS=darwin\nbuild\tGOARM64=v8.0\n\xf92C1\x86\x18 r\x00\x82B\x10A\x16\xd8\xf2"
EOF
mkdir -p $WORK/b001/exe/
cd .
GOROOT='/opt/homebrew/Cellar/go/1.25.0/libexec' /opt/homebrew/Cellar/go/1.25.0/libexec/pkg/tool/darwin_arm64/link -o $WORK/b001/exe/a.out -importcfg $WORK/b001/importcfg.link -buildmode=pie -buildid=GcEZ4N46-oC6sx0vLv1-/ohs6-twOXXgC78K4a0AP/vxs9bGzrvaSYUTsoZrs4/GcEZ4N46-oC6sx0vLv1- -extld=cc $WORK/b001/_pkg_.a
go tool buildid -w $WORK/b001/exe/a.out # internal
mv $WORK/b001/exe/a.out woof

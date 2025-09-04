WORK=/tmp/dorcas-build
export GOROOT=/opt/homebrew/Cellar/go/1.25.0/libexec
export ORCHESTRION_LOG_LEVEL=TRACE
export TOOLEXEC_IMPORTPATH=datadoghq.com/x/dorcas/subject

rm -rf $WORK
mkdir -p $WORK/b001/

cat >$WORK/b001/importcfg << 'EOF' # internal
# import config
packagefile fmt=/Users/dario.castane/Library/Caches/go-build/03/0364df70131745b90254842c4ddab8e8ea1330f75530fb38129333a4c013dbe7-d
packagefile runtime=/Users/dario.castane/Library/Caches/go-build/91/9141075a755aad2bcfc7ec465820e91d677fa5825bba0b66e282703164a6e7e7-d
EOF

orchestrion toolexec $GOROOT/pkg/tool/darwin_arm64/compile -o $WORK/b001/_pkg_.a -trimpath "$WORK/b001=>" -p main -lang=go1.25 -complete -buildid hwjsdBsjH_hNL2jE2sVv/hwjsdBsjH_hNL2jE2sVv -goversion go1.25.0 -c=4 -shared -nolocalimports -importcfg $WORK/b001/importcfg -pack ./main.go
go tool buildid -w $WORK/b001/_pkg_.a # internal

cat >$WORK/b001/importcfg.link << 'EOF' # internal
packagefile command-line-arguments=/tmp/dorcas-build/b001/_pkg_.a
packagefile fmt=/Users/dario.castane/Library/Caches/go-build/03/0364df70131745b90254842c4ddab8e8ea1330f75530fb38129333a4c013dbe7-d
packagefile runtime=/Users/dario.castane/Library/Caches/go-build/91/9141075a755aad2bcfc7ec465820e91d677fa5825bba0b66e282703164a6e7e7-d
packagefile errors=/Users/dario.castane/Library/Caches/go-build/60/60d38527fe15d712ba4bcaf5c64e96e2289971b01edbc95c9082431fb1ee4926-d
packagefile internal/fmtsort=/Users/dario.castane/Library/Caches/go-build/dd/dddd10d9ef4e1fc6a2bd8f029103599705a736d1a7943e8052f4bdfe4b89f483-d
packagefile io=/Users/dario.castane/Library/Caches/go-build/98/98c32dbfa49252799dc042b30c43c1f020d8e11ecb8f31a1d3cdb72e2795a883-d
packagefile math=/Users/dario.castane/Library/Caches/go-build/9f/9ffbbf754b141eee220abded0fa57a1783674cc588c7ad1e8095eeb80c662b9c-d
packagefile os=/Users/dario.castane/Library/Caches/go-build/4d/4ddf20736d1652b8b628f6422b24e29e6f05a8c25a97df1d2ce0afd58fe9f669-d
packagefile reflect=/Users/dario.castane/Library/Caches/go-build/e2/e251aacdfe6955d9726c429dcbf2ba61bfd131f9a3291fc6114ec136feadeb7a-d
packagefile slices=/Users/dario.castane/Library/Caches/go-build/86/8628bad67d90d411d908c4272733789706fa3482ce37db7f9d21f645f37c1e2b-d
packagefile strconv=/Users/dario.castane/Library/Caches/go-build/51/51ef471aeee3a5663c62aa123f79bdafb02f05dde8ee05cf580a9545363b2723-d
packagefile sync=/Users/dario.castane/Library/Caches/go-build/f9/f97f38dbc10da7147e9ff8c8d6ae46a813912de263d4ec39cd4982770a934f0e-d
packagefile unicode/utf8=/Users/dario.castane/Library/Caches/go-build/83/839abe59a9c1d9142dface36898382e8a9ba6371b1907c3333d9129995d1db3a-d
packagefile internal/abi=/Users/dario.castane/Library/Caches/go-build/fb/fbbd9fcd8828a102db91a3a6ec9d5861172dfcc043a3f4a6560d85ecae2ee61c-d
packagefile internal/bytealg=/Users/dario.castane/Library/Caches/go-build/fc/fc48195c58399577502cfc49a48edecab5ecc896150dc47d9e845bcb82779607-d
packagefile internal/byteorder=/Users/dario.castane/Library/Caches/go-build/cd/cd298f18b8680a9910ebe88cb3ebd56455ac1af3398c6031fc7991b651127d72-d
packagefile internal/chacha8rand=/Users/dario.castane/Library/Caches/go-build/ab/ab55bc4c76ec9124a3d591091072a3249400a4291d19b83cb9a275e9c24215ea-d
packagefile internal/coverage/rtcov=/Users/dario.castane/Library/Caches/go-build/9d/9d569506099773eae26a681983d8ba426114b876bf7e66b1ea6c6a3344092740-d
packagefile internal/cpu=/Users/dario.castane/Library/Caches/go-build/82/8250b66c881587a81f0dc4121d01d172f85a4355ab9f9a1e990180edc7f1b5fa-d
packagefile internal/goarch=/Users/dario.castane/Library/Caches/go-build/42/427154680503a6f2c6b67a2a94c3c857b1696c9fce0de82bb277b842a1d6b149-d
packagefile internal/godebugs=/Users/dario.castane/Library/Caches/go-build/5b/5bdb947b89732245a20d230e13e1c8dbeee631fb8ee879734231582edaeef721-d
packagefile internal/goexperiment=/Users/dario.castane/Library/Caches/go-build/40/405f93dd607237935ae7fb6d82b55f581633867ad8f3e0e374913a0b431f746b-d
packagefile internal/goos=/Users/dario.castane/Library/Caches/go-build/75/754684decb63eed645ecdefcfa9a7c7cff518c7171d3556c9020dcb34f0f7485-d
packagefile internal/profilerecord=/Users/dario.castane/Library/Caches/go-build/e8/e8afeb6e340acaad1ff4dcd79276628698ba19ad900b41fab806aba482640990-d
packagefile internal/runtime/atomic=/Users/dario.castane/Library/Caches/go-build/48/4836eaaaef2b7498ba320ad343061be852bd62899cf5b34d349e3ea26f459d08-d
packagefile internal/runtime/exithook=/Users/dario.castane/Library/Caches/go-build/11/11bf74bbd779df272ab7d8e051eb2961de6d2b60bc61f507d99f5dbdbcb9d396-d
packagefile internal/runtime/gc=/Users/dario.castane/Library/Caches/go-build/a2/a2db3763a02adb38744c27e03447f0584858034dd27815f12ec647887185f599-d
packagefile internal/runtime/maps=/Users/dario.castane/Library/Caches/go-build/68/6851495189f2cb6e2fec48c8c9fb57574276d7979382e721fedb7de2cfd326f2-d
packagefile internal/runtime/math=/Users/dario.castane/Library/Caches/go-build/26/26f50d07b611937c1a90a1086bf3b8777a05094ed1d047e32ccb687411dd0b5f-d
packagefile internal/runtime/strconv=/Users/dario.castane/Library/Caches/go-build/6e/6ebf75d71ee1b15ae7fd5b48ee4111ff95d855091ba55870e5c07da94d7aeeb3-d
packagefile internal/runtime/sys=/Users/dario.castane/Library/Caches/go-build/5f/5fc063b1a4028f911851fcbd06863047c4dff270b37c06bee5f91afef1cf0e69-d
packagefile internal/stringslite=/Users/dario.castane/Library/Caches/go-build/9c/9cedcbe3dcbd6996591454153f7240f3d5c03ab7188e6b928e91ac02ab94238e-d
packagefile internal/trace/tracev2=/Users/dario.castane/Library/Caches/go-build/4d/4de04d6d4019f6622624c775f0cd9c4b1d428861b91f7da8285b03d5ee180a97-d
packagefile internal/reflectlite=/Users/dario.castane/Library/Caches/go-build/4e/4ec0a2c5193ee40609351484a50fd87ca9fa798121255cff0f21f58290ecda75-d
packagefile cmp=/Users/dario.castane/Library/Caches/go-build/74/74b016f89e644d2fe0bad6ccb37e11bddeccedbcd810cbd03e10fd9afdfcf7d9-d
packagefile math/bits=/Users/dario.castane/Library/Caches/go-build/ce/cead6e9689230b2a63a392ee4f0cebe88ca52d2bc4c53250fca53c637827d7e1-d
packagefile internal/filepathlite=/Users/dario.castane/Library/Caches/go-build/02/02ce16379729dc3866aa35779eb44447b059f2c8628820a263b6aefb42860e79-d
packagefile internal/itoa=/Users/dario.castane/Library/Caches/go-build/ef/ef0f6e13e7c598050afb7630b1ca24415365bf26fa32f32ea3e1164b274ce3d6-d
packagefile internal/poll=/Users/dario.castane/Library/Caches/go-build/e9/e9f564c605bf68095d1cfd0f9b81e24bd53c45c916caf7a41d1a1a1a36fac58c-d
packagefile internal/syscall/execenv=/Users/dario.castane/Library/Caches/go-build/8d/8d8edeceab05bff3a733af2eb859e80e3dad0eb1fa82e049f527c8f1fb805d1c-d
packagefile internal/syscall/unix=/Users/dario.castane/Library/Caches/go-build/b2/b2be5d03133b858da0b9db5e6b51eab2e510f4b806f5dc2a19d5f3b03a0846d9-d
packagefile internal/testlog=/Users/dario.castane/Library/Caches/go-build/0b/0b217e09ee59bb1303d2e6b2eb78b0cd01edd4fe7670756ee1e92f7e23c7ec99-d
packagefile io/fs=/Users/dario.castane/Library/Caches/go-build/98/98e4c78151b86632b71fa1cd7de9f4811bbee5a030918719bb25fcb28b03104c-d
packagefile sync/atomic=/Users/dario.castane/Library/Caches/go-build/e7/e7f5ff8d552a465df245764f8b4a957eb5ebd8eec33401d6b46f3028e19b8544-d
packagefile syscall=/Users/dario.castane/Library/Caches/go-build/4f/4f182fc51db3687f3f5419f6c93dbf874894162171cd0e222e6d180b3fbbc54f-d
packagefile time=/Users/dario.castane/Library/Caches/go-build/eb/ebd54a0e850015436ad4cc0841e216c9c227244676f59b17026dadab526f3b95-d
packagefile internal/race=/Users/dario.castane/Library/Caches/go-build/3c/3c40871c42923732d7dbf427950e0472ee805a1dd8f446e7b8c6a40069022c5d-d
packagefile internal/unsafeheader=/Users/dario.castane/Library/Caches/go-build/6a/6af21056c3d1c23966ea2f1c5c5951a0e72661d0c6671362593a282270cf1c4a-d
packagefile iter=/Users/dario.castane/Library/Caches/go-build/d6/d690b2cec05e9b4870bb4378296fe337cb2158f0dbbd83e91d5354e741f45123-d
packagefile unicode=/Users/dario.castane/Library/Caches/go-build/67/673af19d5e8c65d4727c609e45c72904da9e74fb124d2a9d7d2ca287dd16fc9c-d
packagefile internal/sync=/Users/dario.castane/Library/Caches/go-build/0f/0fbc23a66d6e39b967b86777c214ff0f77d08775bab5ce11bcee4ddc36b7a466-d
packagefile internal/synctest=/Users/dario.castane/Library/Caches/go-build/1f/1ffff554915c00361c67cacbe26647d8b7899f549a5cb70466e1281bd4995956-d
packagefile internal/asan=/Users/dario.castane/Library/Caches/go-build/5b/5b06e91571a742d72f7c641161893aca68733c2c636c8f4d182f5008d744bc95-d
packagefile internal/msan=/Users/dario.castane/Library/Caches/go-build/ce/ce2f8af5ae4165cfcddcaf768307260f83aed9ed68f3c769087013cabfbf5f59-d
packagefile internal/oserror=/Users/dario.castane/Library/Caches/go-build/d1/d16163160f3339193cf10bd67d34a8dc8c0a0897f301f8ef513ba39758eb95a6-d
packagefile path=/Users/dario.castane/Library/Caches/go-build/b3/b38cedf8b92f11f88a763cd761e2f3b43bebdb0581a1497552c366edbc05a1cb-d
packagefile internal/godebug=/Users/dario.castane/Library/Caches/go-build/14/14bf242c8bb502bf50ddc6d165386b616138dda5a03d5a50a7e7a11ba1db8d65-d
packagefile internal/bisect=/Users/dario.castane/Library/Caches/go-build/47/47558c2df3b481e0bd0d22e22401bbde2775228dec046f343617763516e8e18d-d
modinfo "0w\xaf\f\x92t\b\x02A\xe1\xc1\a\xe6\xd6\x18\xe6path\tcommand-line-arguments\nbuild\t-buildmode=exe\nbuild\t-compiler=gc\nbuild\tCGO_ENABLED=1\nbuild\tCGO_CFLAGS=\nbuild\tCGO_CPPFLAGS=\nbuild\tCGO_CXXFLAGS=\nbuild\tCGO_LDFLAGS=\nbuild\tGOARCH=arm64\nbuild\tGOOS=darwin\nbuild\tGOARM64=v8.0\n\xf92C1\x86\x18 r\x00\x82B\x10A\x16\xd8\xf2"
EOF

mkdir -p $WORK/b001/exe/
orchestrion toolexec $GOROOT/pkg/tool/darwin_arm64/link -o $WORK/b001/exe/a.out -importcfg $WORK/b001/importcfg.link -buildmode=pie -buildid=UQwR1Q3jJJkSQLMg_3xK/hwjsdBsjH_hNL2jE2sVv/dXFxo_Qcus9eZFY6v0jb/UQwR1Q3jJJkSQLMg_3xK -extld=cc $WORK/b001/_pkg_.a
go tool buildid -w $WORK/b001/exe/a.out # internal
mv $WORK/b001/exe/a.out woof

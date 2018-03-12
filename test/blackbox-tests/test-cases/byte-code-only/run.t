  $ env ORIG_PATH="$PATH" PATH="$PWD/ocaml-bin:$PATH" $JBUILDER build --root . -j1 --display short
      ocamldep bin/toto.ml.d
        ocamlc bin/.toto.eobjs/toto.{cmi,cmo,cmt}
        ocamlc bin/toto.exe
      ocamldep src/foo.ml.d
        ocamlc src/.foo.objs/foo.{cmi,cmo,cmt}
        ocamlc src/foo.cma

Check that building a native only executable fails
  $ env ORIG_PATH="$PATH" PATH="$PWD/ocaml-bin:$PATH" $JBUILDER build --root . -j1 --display short native-only/foo.exe
  Don't know how to build native-only/foo.exe
  [1]

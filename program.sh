#!/bin/bash

repl(){
  clj \
    -J-Dclojure.core.async.pool-size=1 \
    -X:repl Ripley.core/process \
    :main-ns Tyrion.main
}


main(){
  clojure \
    -J-Dclojure.core.async.pool-size=1 \
    -M -m Tyrion.main
}

jar(){

  clojure \
    -X:identicon Zazu.core/process \
    :word '"Tyrion"' \
    :filename '"out/identicon/icon.png"' \
    :size 256

  rm -rf out/*.jar
  clojure \
    -X:uberjar Genie.core/process \
    :main-ns Tyrion.main \
    :filename "\"out/Tyrion-$(git rev-parse --short HEAD).jar\"" \
    :paths '["src"]'
}

release(){
  jar
}

"$@"
#!/bin/bash

repl(){
  clj \
    -J-Dclojure.core.async.pool-size=1 \
    -X:repl Ripley.core/process \
    :main-ns still-going-strong.main
}


main(){
  clojure \
    -J-Dclojure.core.async.pool-size=1 \
    -M -m still-going-strong.main
}

jar(){

  clojure \
    -X:identicon Zazu.core/process \
    :word '"program-name"' \
    :filename '"out/identicon/icon.png"' \
    :size 256

  rm -rf out/*.jar
  clojure \
    -X:uberjar Genie.core/process \
    :main-ns still-going-strong.main \
    :filename "\"out/program-name-$(git rev-parse --short HEAD).jar\"" \
    :paths '["src"]'
}

release(){
  jar
}

"$@"
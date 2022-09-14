#!/usr/bin/env bash
source ~/.bash_prompt

function k() {
    kubectl $@
}

function kc() {
    kubectx $@
}

function kn() {
    kubens $@
}
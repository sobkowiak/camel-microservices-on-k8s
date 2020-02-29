#!/bin/bash

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

function initKnativeTmux4() {
  tmux kill-session -t knative4;
  tmux new-session -s knative4 -d -c $SCRIPTPATH\; \
    split-window -v \; \
    select-pane -t knative4:1.1 \; \
    send-keys 'source setenv.sh && reset' C-m \; \
    split-window -h \; \
    select-pane -t knative4:1.2 \; \
    send-keys 'source setenv.sh && reset' C-m \; \
    select-pane -t knative4:1.3 \; \
    send-keys 'source setenv.sh && reset' C-m \; \
    split-window -h \; \
    select-pane -t knative4:1.4 \; \
    send-keys 'source setenv.sh && reset' C-m \; \
    select-window -t knative4:1 \; \
    select-pane -t knative4:1.1 \;
};

function postInitKnativeTmux4() {
  tmux select-window -t knative4:1 \; \
    select-pane -t knative4:1.1 \; \
    send-keys 'source init.sh && reset' C-m \; \
    select-pane -t knative4:1.2 \; \
    send-keys 'source init.sh && reset' C-m \; \
    select-pane -t knative4:1.3 \; \
    send-keys 'source init.sh && reset' C-m \; \
    select-pane -t knative4:1.4 \; \
    send-keys 'source init.sh && reset' C-m \; \
    select-window -t knative4:1 \; \
    select-pane -t knative4:1.1 \;
};


function initKnativeTmux5() {
  tmux kill-session -t knative5;
  tmux new-session -s knative5 -d -c $SCRIPTPATH\; \
    split-window -v \; \
    select-pane -t knative5:1.1 \; \
    send-keys 'source setenv.sh && reset' C-m \; \
    split-window -h \; \
    select-pane -t knative5:1.2 \; \
    send-keys 'source setenv.sh && reset' C-m \; \
    select-pane -t knative5:1.3 \; \
    send-keys 'source setenv.sh && reset' C-m \; \
    split-window -h \; \
    select-pane -t knative5:1.4 \; \
    send-keys 'source setenv.sh && reset' C-m \; \
    split-window -h \; \
    select-pane -t knative5:1.5 \; \
    send-keys 'source setenv.sh && reset' C-m \; \
    select-window -t knative5:1 \; \
    select-pane -t knative5:1.1 \;
};

function postInitKnativeTmux5() {
  tmux select-window -t knative5:1 \; \
    select-pane -t knative5:1.1 \; \
    send-keys 'source init.sh && reset' C-m \; \
    select-pane -t knative5:1.2 \; \
    send-keys 'source init.sh && reset' C-m \; \
    select-pane -t knative5:1.3 \; \
    send-keys 'source init.sh && reset' C-m \; \
    select-pane -t knative5:1.4 \; \
    send-keys 'source init.sh && reset' C-m \; \
    select-pane -t knative5:1.5 \; \
    send-keys 'source init.sh && reset' C-m \; \
    select-window -t knative5:1 \; \
    select-pane -t knative5:1.1 \;
};


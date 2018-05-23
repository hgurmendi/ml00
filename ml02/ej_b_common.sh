#!/bin/bash

export HIDDEN_NEURONS="2 5 10 20 40"
export TOTAL_TRAIN=2000
export TRAIN=1600
export TEST=2000
export EPOCHS=40000
export MU=0.5
export LR=0.01
export RECORD_RATE=400
export TEMP_DIR=temp_b
export TEMP_STEM=b
export VERBOSITY=0
export DATASETS_DIR=datasets
export SPIRALS=../ml00/spirals
export BP=./bin/bp
export PLOTTER=./ej_b_plot.R
export DISCRETIZA=./bin/discretiza

# Number of training rounds. Should be 1
export ROUNDS=1

create_netfile ()
{
    if [ $# -le 13 ]; then
        echo "Not enough parameters to create netfile."
        exit
    fi

    # Neurons in input layer
    local N1=${1}
    # Neurons in hidden layer
    local N2=${2}
    # Neurons in output layer
    local N3=${3}
    # Number of inputs in the .data file
    local PTOT=${4}
    # Number of inputs to be used in training (the rest are used in validation)
    local PR=${5}
    # Number of inputs in the .test file
    local PTEST=${6}
    # Total number of iterations (epochs)
    local ITER=${7}
    # Learning rate
    local ETA=${8}
    # Momentum
    local u=${9}
    # Write error every NERROR iterations
    local NERROR=${10}
    # Initial synapsis file
    local WTS=${11}
    # Seed for the RNG
    local SEED=${12}
    # Verbosity level
    local CONTROL=${13}
    # Filename for the netfile
    local FILE=${14}

    rm -f ${FILE}

    echo ${N1} >>${FILE}
    echo ${N2} >>${FILE}
    echo ${N3} >>${FILE}
    echo ${PTOT} >>${FILE}
    echo ${PR} >>${FILE}
    echo ${PTEST} >>${FILE}
    echo ${ITER} >>${FILE}
    echo ${ETA} >>${FILE}
    echo ${u} >>${FILE}
    echo ${NERROR} >>${FILE}
    echo ${WTS} >>${FILE}
    echo ${SEED} >>${FILE}
    echo ${CONTROL} >>${FILE}
}
export -f create_netfile

# Generate a 4-byte unsigned random number greater than 0
gen_rand ()
{
    od -vAn -N4 -tu4 < /dev/urandom | awk '{print 1 + $1}'
}
export -f gen_rand


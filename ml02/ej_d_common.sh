#!/bin/bash

# Number of patterns in the datafile
export TOTAL_DATAFILE=180

export TEMP_DIR=temp_d
export TEMP_STEM=d
export DATASETS_DIR=datasets
export DATASET_NAME=ssp
export BP=./bin/bp_weight_decay
export GAMMAS="0.00000001 0.0000001 0.000001 0.00001 0.0001 0.001 0.01 0.1 1"

# Number of training rounds. Should be 20
export ROUNDS=5

create_netfile ()
{
    if [ $# -le 14 ]; then
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
    # Gamma (weight decay penalty)
    local GAMMA=${14}
    # Filename for the netfile
    local FILE=${15}

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
    echo ${GAMMA} >>${FILE}
}
export -f create_netfile

# Generate a 4-byte unsigned random number greater than 0
gen_rand ()
{
    od -vAn -N4 -tu4 < /dev/urandom | awk '{print 1 + $1}'
}
export -f gen_rand


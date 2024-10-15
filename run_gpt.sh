#!/bin/bash
# Script to run the reward model with specified parameters

DATASET_PATH='<anonymized for review>'
MODELS=(
    "NCSOFT/Llama-3-OffsetBias-RM-8B"
    "Skywork/Skywork-Reward-Gemma-2-27B"
    "Skywork/Skywork-Reward-Llama-3.1-8B"
    "LxzGordon/URM-LLaMa-3.1-8B"
    "sfairXC/FsfairX-LLaMA3-RM-v0.1"
)

# Iterate over each model in the MODELS array
for MODEL in "${MODELS[@]}"; do
    echo "Running model: $MODEL"
    python reward-bench/scripts/run_generative.py \
        --model=$MODEL \
        --custom_dataset_path=$DATASET_PATH
done

#!/usr/bin/env bash
# Train the Crazyflie 2.x policy from scratch (PPO, rl_games).
# Requires Isaac Lab v2.1.0 + Isaac Sim 4.5 (see README).
set -euo pipefail
cd "${ISAACLAB_DIR:?set ISAACLAB_DIR to your IsaacLab checkout}"
export OMNI_KIT_ACCEPT_EULA=YES
./isaaclab.sh -p scripts/reinforcement_learning/rl_games/train.py \
  --task Isaac-Quadcopter-Direct-v0 --num_envs 4096 --headless

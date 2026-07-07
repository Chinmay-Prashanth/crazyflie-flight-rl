#!/usr/bin/env bash
# Record a rollout video of the Crazyflie 2.x using NVIDIA's published pretrained
# checkpoint (downloaded automatically from the Omniverse asset server).
# Apply patches/isaaclab_play_camera.patch first for the VIEWER_* overrides.
set -euo pipefail
cd "${ISAACLAB_DIR:?set ISAACLAB_DIR to your IsaacLab checkout}"
export OMNI_KIT_ACCEPT_EULA=YES PYTHONUNBUFFERED=1
export VIEWER_RESOLUTION=1920x1080
export VIEWER_FOLLOW=robot VIEWER_EYE=0.5,0.5,0.3 VIEWER_LOOKAT=0,0,0.05
./isaaclab.sh -p scripts/reinforcement_learning/rl_games/play.py \
  --task Isaac-Quadcopter-Direct-v0 --num_envs 32 \
  --use_pretrained_checkpoint \
  --headless --enable_cameras --video --video_length 600
# The clip lands under .pretrained_checkpoints/ or logs/ as rl-video-step-0.mp4

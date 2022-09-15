export CARLA_ROOT=/home/wangrenzhi/code/carla_0.9.10.1

export PORT=2000                                                    # change to port that CARLA is running on
export ROUTES=leaderboard/data/routes_training/route_07.xml         # change to desired route
export TEAM_AGENT=image_agent.py                                    # no need to change
export TEAM_CONFIG=../model.ckpt                                       # change path to checkpoint
export HAS_DISPLAY=1                                                # set to 0 if you don't want a debug window

echo 'start'

docker run --rm -d --name carla_sim \
    -e SDL_VIDEODRIVER=offscreen \
    -e DISPLAY=$DISPLAY\
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --net=host \
    -it \
    --gpus all \
    carlasim/carla:0.9.10.1 ./CarlaUE4.sh -opengl -nosound -benchmark -fps=20

sleep 3s

echo 'start pilot'


timeout 30s ./run_agent.sh

docker stop carla_sim

echo "done"
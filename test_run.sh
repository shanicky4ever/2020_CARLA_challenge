export PORT=2000                                                    # change to port that CARLA is running on
export ROUTES=leaderboard/data/routes_training/route_16.xml         # change to desired route
export TEAM_AGENT=my_image_agent.py                                    # no need to change
export TEAM_CONFIG=../model.ckpt                                       # change path to checkpoint
export HAS_DISPLAY=1                                                # set to 0 if you don't want a debug window

rm -rf tmp_record
mkdir tmp_record

./run_agent.sh